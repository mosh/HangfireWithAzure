namespace HangFireConsoleApplication.ServiceBusQueue;

interface

uses
  System,
  System.Linq,
  System.Threading,
  Microsoft.ServiceBus.Messaging,
  Hangfire.SqlServer,
  Hangfire.Storage;

type

  ServiceBusQueueJobQueue = assembly class(IPersistentJobQueue)
  private
    class var     SyncReceiveTimeout: TimeSpan := TimeSpan.FromSeconds(5); readonly;
    var     _connectionString: String; readonly;

  public
    constructor(connectionString: String);

    method Dequeue(queues: array of String; cancellationToken: CancellationToken): IFetchedJob;

    method Enqueue(queue: String; jobId: String);
  end;


implementation


constructor ServiceBusQueueJobQueue(connectionString: String);
begin
  _connectionString := connectionString
end;

method ServiceBusQueueJobQueue.Dequeue(queues: array of String; cancellationToken: CancellationToken): IFetchedJob;
begin
  var message: BrokeredMessage := nil;
  var queueIndex := 0;

  var clients := queues.Select(queue -> QueueClient.CreateFromConnectionString(_connectionString, queue)).ToArray();

  repeat 
  begin
    cancellationToken.ThrowIfCancellationRequested();

    try
      var client := clients[queueIndex];
      message := iif(queueIndex = 0, client.Receive(SyncReceiveTimeout), client.Receive(new TimeSpan(1)))
      
    except        
      on TimeoutException do 
      begin
        Console.WriteLine('TimeoutException');
      end;
    end;

    queueIndex := (queueIndex + 1) mod queues.Length
  end
  until (assigned(message));

  exit new ServiceBusQueueFetchedJob(message)
end;

method ServiceBusQueueJobQueue.Enqueue(queue: String; jobId: String);
begin
  var client := QueueClient.CreateFromConnectionString(_connectionString, queue);

  using message := new BrokeredMessage(jobId) do 
  begin
    client.Send(message)
  end
end;

end.
