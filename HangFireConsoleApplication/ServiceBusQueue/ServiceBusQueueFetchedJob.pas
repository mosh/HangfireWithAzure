namespace HangFireConsoleApplication.ServiceBusQueue;

interface

uses
  System,
  Microsoft.ServiceBus.Messaging,
  Hangfire.Storage;

type

  ServiceBusQueueFetchedJob = assembly class(IFetchedJob)
  private
    var     _message: BrokeredMessage; readonly;
    var     _completed: Boolean;
    var     _disposed: Boolean;

  public
    constructor(message: BrokeredMessage);

    property JobId: String;

    method RemoveFromQueue;

    method Requeue;



    method Dispose;
  end;


implementation


constructor ServiceBusQueueFetchedJob(message: BrokeredMessage);
begin
  if not assigned(message) then    
  begin
    raise new ArgumentNullException('message');
  end;

  _message := message;

  JobId := _message.GetBody<String>()
end;

method ServiceBusQueueFetchedJob.RemoveFromQueue;
begin
  _message.Complete();
  _completed := true
end;

method ServiceBusQueueFetchedJob.Requeue;
begin
  raise new NotImplementedException()
end;

method ServiceBusQueueFetchedJob.Dispose;
begin
  if (not _completed) and (not _disposed) then
  begin
    _message.Abandon()
  end;

  _message.Dispose();
  _disposed := true
end;

end.
