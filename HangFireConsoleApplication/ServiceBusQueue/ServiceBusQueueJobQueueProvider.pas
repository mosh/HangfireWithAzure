namespace HangFireConsoleApplication.ServiceBusQueue;

interface

uses
  System,
  System.Data,
  Microsoft.ServiceBus,
  Microsoft.ServiceBus.Messaging,
  Hangfire.SqlServer;

type
  ServiceBusQueueJobQueueProvider = assembly class(IPersistentJobQueueProvider)
  private
    var     _connectionString: String; readonly;
    var     _configureAction: Action<QueueDescription>; readonly;
    var     _queues: array of String; readonly;

  public
    constructor(connectionString: String; configureAction: Action<QueueDescription>; queues: array of String);

    method GetJobQueue(connection: IDbConnection): IPersistentJobQueue;

    method GetJobQueueMonitoringApi(connection: IDbConnection): IPersistentJobQueueMonitoringApi;

  private
    method CreateQueuesIfNotExists;
  end;


implementation


constructor ServiceBusQueueJobQueueProvider(connectionString: String; configureAction: Action<QueueDescription>; queues: array of String);
begin
  if connectionString = nil then    
  begin
    raise new ArgumentNullException('connectionString');
  end;
  if queues = nil then    
  begin
    raise new ArgumentNullException('queues');
  end;

  _connectionString := connectionString;
  _configureAction := configureAction;
  _queues := queues;

  CreateQueuesIfNotExists()
end;

method ServiceBusQueueJobQueueProvider.GetJobQueue(connection: IDbConnection): IPersistentJobQueue;
begin
  exit new ServiceBusQueueJobQueue(_connectionString)
end;

method ServiceBusQueueJobQueueProvider.GetJobQueueMonitoringApi(connection: IDbConnection): IPersistentJobQueueMonitoringApi;
begin
  exit new ServiceBusQueueMonitoringApi(_connectionString, _queues)
end;

method ServiceBusQueueJobQueueProvider.CreateQueuesIfNotExists;
begin
  for each queue in _queues do 
  begin
    var namespaceManager := NamespaceManager.CreateFromConnectionString(_connectionString);

    if not namespaceManager.QueueExists(queue) then
    begin
      var description := new QueueDescription(queue);

      if assigned(_configureAction) then
      begin
        _configureAction(description)
      end;

      namespaceManager.CreateQueue(description)
    end
  end
end;

end.
