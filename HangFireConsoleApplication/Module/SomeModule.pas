namespace HangFireConsoleApplication._Module;

interface

uses
  System.Collections.Generic,
  System.Linq,
  System.Text, 
  HangFire,
  Nancy;

type
  SomeModule = public class(NancyModule)
  private
  protected
  public
    constructor;
  end;

implementation

constructor SomeModule;
begin
  Post['/DoWork'] := () ->
    begin
      BackgroundJob.Enqueue(() -> 
        begin
          Console.WriteLine('Hello');
        end
      );
    end;

end;

end.
