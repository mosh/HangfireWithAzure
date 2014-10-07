namespace QueueConsoleApplication;

interface

uses
  Dapper,
  System.Configuration,
  System.Data.SqlClient,
  System.Linq, 
  System.Transactions,
  Microsoft.ServiceBus, 
  Microsoft.ServiceBus.Messaging,
  Microsoft.WindowsAzure;

type
  ConsoleApp = class
  public
    class method CreateQueueIfRequired;
    class method Main(args: array of String);
    class method ReceiveMessage(client:QueueClient);
    class method SendMessage(client:QueueClient;firstname:String;lastname:String);
    class method insertRow(firstname:String;lastname:String);
    class method GetQueueClient:QueueClient;
  end;

implementation

class method ConsoleApp.Main(args: array of String);
begin

//  CreateQueueIfRequired;
//
//  var client := GetQueueClient;
//  //SendMessage(client,'John','Smith');
//  ReceiveMessage(client);

  
end;

class method ConsoleApp.ReceiveMessage(client:QueueClient);
begin

    using scope := new TransactionScope do
    begin

      var serverWaitTime := new TimeSpan(0,0,2);
      var existingMessage := client.Receive(serverWaitTime);

      if(assigned(existingMessage))then
      begin
        try
          //Console.WriteLine('Body: ' + existingMessage.GetBody<String>());
          //Console.WriteLine('MessageID: ' + existingMessage.MessageId);
          //Console.WriteLine('Test Property: ' + existingMessage.Properties['TestProperty']);sert

          insertRow(existingMessage.Properties['firstname'].ToString,existingMessage.Properties['firstname'].ToString);

          existingMessage.Complete();

          scope.Complete;
        except
          on E:Exception do
          begin
            Console.WriteLine(E.Message);
            existingMessage.Abandon;
          end;
        end;

      end;
      
    end;
    Console.WriteLine('Exit');
end;

class method ConsoleApp.SendMessage(client: QueueClient;firstname:String;lastname:String);
begin
  using scope := new TransactionScope do
  begin
    var message := new BrokeredMessage();
    message.Properties['firstname'] := firstname;
    message.Properties['lastname'] := lastname;   
    client.Send(message);
    scope.Complete;
  end;

end;

class method ConsoleApp.insertRow(firstname:String;lastname:String);
begin

  var guidId := Guid.NewGuid;

  var connectionString := ConfigurationManager.AppSettings['Database'];

  using scope := new TransactionScope(TransactionScopeOption.RequiresNew) do
  begin
    var connection := new SqlConnection(connectionString);
    connection.Open;
    try
      connection.Execute('insert into users (GuidId,firstname,lastname) values(@guidid,@firstname, @lastname)', 
        new class(guidId:=guidId, firstname:=firstname, lastname:=lastname));
    finally
      connection.Close;
    end;
    scope.Complete;
  end;
end;

class method ConsoleApp.CreateQueueIfRequired;
begin
  var connectionString := CloudConfigurationManager.GetSetting('Microsoft.ServiceBus.ConnectionString');

  var namespaceManager := NamespaceManager.CreateFromConnectionString(connectionString);

  if (not namespaceManager.QueueExists('TestQueue'))then
  begin
    namespaceManager.CreateQueue('TestQueue');
  end;

end;

class method ConsoleApp.GetQueueClient:QueueClient;
begin
  var connectionString := CloudConfigurationManager.GetSetting('Microsoft.ServiceBus.ConnectionString');
  exit QueueClient.CreateFromConnectionString(connectionString, 'TestQueue');
end;

end.
