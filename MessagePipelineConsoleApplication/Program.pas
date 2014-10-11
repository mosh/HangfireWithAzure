namespace MessagePipelineConsoleApplication;

interface

uses
  System.Linq, 
  System.Threading,
  System.Threading.Tasks,
  System.Threading.Tasks.Dataflow,
  Microsoft.ServiceBus.Messaging, 
  Microsoft.WindowsAzure;

type
  ConsoleApp = class
  public
    class method Main(args: array of String);
  end;

implementation

class method ConsoleApp.Main(args: array of String);
begin

  var processMessage := new TransformBlock<BrokeredMessage, BrokeredMessage>(message ->
      begin
        Console.WriteLine('processing message');
        exit message;
      end);

  var finishProcessing := new ActionBlock<BrokeredMessage>(message ->
      begin
        message.Complete;
      end);

  processMessage.LinkTo(finishProcessing);

  processMessage.Completion.ContinueWith(t ->
      begin
        if (t.IsFaulted) then
        begin
          IDataflowBlock(finishProcessing).Fault(t.Exception);
        end
         else finishProcessing.Complete();
      end);

  var tokenSource := new CancellationTokenSource();
  var token := tokenSource.Token;

  var t := Task.Factory.StartNew( () -> 
    begin
      var connectionString := CloudConfigurationManager.GetSetting('Microsoft.ServiceBus.ConnectionString');
      var client := QueueClient.CreateFromConnectionString(connectionString, 'TestQueue');

      repeat
        var serverWaitTime := new TimeSpan(0,0,2);
        var someMessage := client.Receive(serverWaitTime);

        if(assigned(someMessage))then
        begin
          Console.WriteLine('sending message for processing');
          processMessage.Post(someMessage);
        end;

      until token.IsCancellationRequested;
    end, token);


  Console.WriteLine('Press enter to quit.');
  Console.ReadLine();

//  processMessage.Post();

  processMessage.Complete();
  finishProcessing.Completion.Wait();

  tokenSource.Cancel();
  Task.WaitAll(t);


end;

end.
