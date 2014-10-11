namespace HangFireConsoleApplication.ServiceBusQueue;

interface

uses
  System,
  Microsoft.ServiceBus.Messaging,
  Hangfire.SqlServer,
  Hangfire.States;

extension method SqlServerStorage.UseServiceBusQueues(connectionString:String):SqlServerStorage;
extension method SqlServerStorage.UseServiceBusQueues(connectionString:String;queues:array of String):SqlServerStorage;
extension method SqlServerStorage.UseServiceBusQueues(connectionString:String;configureAction: Action<QueueDescription>; params queues: array of String):SqlServerStorage;


implementation


extension method SqlServerStorage.UseServiceBusQueues(connectionString:String):SqlServerStorage;
begin
  exit UseServiceBusQueues(connectionString, [EnqueuedState.DefaultQueue]);
end;

extension method SqlServerStorage.UseServiceBusQueues(connectionString:String;queues:array of String):SqlServerStorage;
begin
  exit UseServiceBusQueues(connectionString, nil, queues);
end;

extension method SqlServerStorage.UseServiceBusQueues(connectionString:String;configureAction: Action<QueueDescription>; params queues: array of String):SqlServerStorage;
begin
  if not assigned(self) then    
  begin
    raise new ArgumentNullException('storage');
  end;
  if connectionString = nil then    
  begin
    raise new ArgumentNullException('connectionString');
  end;

  var provider := new ServiceBusQueueJobQueueProvider(connectionString, configureAction, queues);

  self.QueueProviders.Add(provider, queues);

  exit self;
end;

end.
