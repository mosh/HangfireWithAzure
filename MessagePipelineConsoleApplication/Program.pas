namespace MessagePipelineConsoleApplication;

interface

uses
  System.Dynamic,
  System.Linq, 
  Microsoft.WindowsAzure;

type

  ConsoleApp = class
  public
    class method Main(args: array of String);
  end;

  ServiceClass = public class
  public
    method SomeMethod;
  end;

  SomeOtherServiceClass = public class
  public
    method SomeMethod(value:dynamic);
  end;

implementation

method ServiceClass.SomeMethod;
begin
  Console.WriteLine('Some method');
end;


class method ConsoleApp.Main(args: array of String);
begin

  var connectionString := CloudConfigurationManager.GetSetting('Microsoft.ServiceBus.ConnectionString');

  var pipeline := new Pipeline(connectionString,'TestQueue');


  pipeline.Start;
  try

    pipeline.Send<ServiceClass>(s -> s.SomeMethod);

//    pipeline.Send<SomeOtherServiceClass>(s -> 
//      begin
//        var obj:dynamic := new ExpandoObject;
//        s.SomeMethod(obj);
//      end);


    Console.WriteLine('Press enter to quit.');
    Console.ReadLine();

  finally
    pipeline.Stop;
  end;





end;

method SomeOtherServiceClass.SomeMethod(value: dynamic);
begin

end;

end.
