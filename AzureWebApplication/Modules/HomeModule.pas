namespace AzureWebApplication.Modules;

interface

uses
  System.Collections.Generic,
  System.Linq,
  System.Text, 
  Nancy;

type

  HomeModule = public class(NancyModule)
  private
  protected
  public
    constructor;
  end;

implementation

constructor HomeModule;
begin
  Get['/'] := _ -> Response.AsJson(new class(application:='Azure Web Application'));

end;

end.
