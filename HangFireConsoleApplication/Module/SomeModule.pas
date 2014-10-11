namespace HangFireConsoleApplication._Module;

interface

uses
  System.Collections.Generic,
  System.Linq,
  System.Text, 
  Hangfire,
  HangFireConsoleApplication.Services,
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
      BackgroundJob.Enqueue<SomeService>( x -> x.SomeMethod);
    end;

end;

end.
