namespace HangFireConsoleApplication;

interface

uses
  System.Linq, 
  Microsoft.Owin.Hosting;

type
  ConsoleApp = class
  public
    class method Main(args: array of String);
  end;

implementation

class method ConsoleApp.Main(args: array of String);
begin
  var port := 5005;

  using WebApp.Start<Startup>(String.Format('http://localhost:{0}', port)) do
  begin
      Console.WriteLine(String.Format('On Port {0}', port));
      Console.ReadLine();
  end;

end;

end.
