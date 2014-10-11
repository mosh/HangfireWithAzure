namespace HangFireConsoleApplication.ServiceBusQueue;

interface

uses
  System,
  System.Collections.Generic,
  System.Linq,
  Microsoft.ServiceBus,
  Microsoft.ServiceBus.Messaging,
  Hangfire.SqlServer;

type
  ServiceBusQueueMonitoringApi = assembly class(IPersistentJobQueueMonitoringApi)
  private
    var     _connectionString: String; readonly;
    var     _queues: array of String; readonly;

  public
    constructor(connectionString: String; queues: array of String);

    method GetQueues: IEnumerable<String>;

    method GetEnqueuedJobIds(queue: String; &from: Integer; perPage: Integer): IEnumerable<Integer>;

    method GetFetchedJobIds(queue: String; &from: Integer; perPage: Integer): IEnumerable<Integer>;

    method GetEnqueuedAndFetchedCount(queue: String): EnqueuedAndFetchedCountDto;
  end;


implementation


constructor ServiceBusQueueMonitoringApi(connectionString: String; queues: array of String);
begin
  if connectionString = nil then    raise new ArgumentNullException('connectionString');
  if queues = nil then    raise new ArgumentNullException('queues');

  _connectionString := connectionString;
  _queues := queues
end;

method ServiceBusQueueMonitoringApi.GetQueues: IEnumerable<String>;
begin
  exit _queues
end;

method ServiceBusQueueMonitoringApi.GetEnqueuedJobIds(queue: String; &from: Integer; perPage: Integer): IEnumerable<Integer>;
begin
  var client := QueueClient.CreateFromConnectionString(_connectionString, queue);
  var messages := client.PeekBatch(perPage).ToArray();

  var &result := messages.Select(x -> Integer.Parse(x.GetBody<String>()));

  for each message in messages do begin
    message.Dispose()
  end;

  exit &result
end;

method ServiceBusQueueMonitoringApi.GetFetchedJobIds(queue: String; &from: Integer; perPage: Integer): IEnumerable<Integer>;
begin
  exit Enumerable.Empty<Integer>()
end;

method ServiceBusQueueMonitoringApi.GetEnqueuedAndFetchedCount(queue: String): EnqueuedAndFetchedCountDto;
begin
  var namespaceManager := NamespaceManager.CreateFromConnectionString(_connectionString);
  var queueDescriptor := namespaceManager.GetQueue(queue);

  exit new EnqueuedAndFetchedCountDto(EnqueuedCount := Integer(queueDescriptor.MessageCount), 
  FetchedCount := nil
  )
end;

end.
