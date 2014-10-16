namespace AzureWebApplication.Modules;

interface

uses
  System.Collections.Generic,
  System.Linq,
  System.Text, 
  AzureWebApplication.Services,
  Moshine.MessagePipeline,
  Nancy;

type

  HomeModule = public class(NancyModule)
  private
    _pipeline:Pipeline;
    _cache:Cache;
  public
    constructor(pipeline:Pipeline; cache:Cache);
  end;

implementation

constructor HomeModule(pipeline:Pipeline; cache:Cache);
begin
  _pipeline := pipeline;
  _cache := cache;

  Get['/'] := _ -> Response.AsJson(new class(application:='Azure Web Application with Pipeline'));
  Get['/SimpleGet'] := _ -> Response.AsJson(new class(application:='SimpleGet'));

  Put['/SomeObjectResponse'] := _ -> 
    begin 
      var pipelineResponse:=_pipeline.Send<AzureService>(s -> s.SomeMethod);
      var obj:Object:=pipelineResponse.WaitForResult(_cache);
      exit iif(assigned(obj), Response.AsJson(obj), HttpStatusCode.InternalServerError);
    end;
  Get['/AnotherObjectResponse'] := _ -> 
    begin 
      var pipelineResponse:=_pipeline.Send<AzureService>(s -> s.SomeMethod);
      var obj:Object:=pipelineResponse.WaitForResult(_cache);
      exit iif(assigned(obj), Response.AsJson(obj), HttpStatusCode.InternalServerError);
    end;

end;

end.
