namespace AzureWebApplication;

interface

uses
  System.Collections.Generic,
  System.Configuration,
  System.Linq,
  System.Text, 
  Microsoft.WindowsAzure,
  Autofac,
  Moshine.MessagePipeline,
  Nancy, 
  Nancy.Bootstrapper,
  Nancy.Bootstrappers.Autofac, 
  Nancy.Elmah,
  StackExchange.Redis;

type

  AzureBootStrapper = public class(AutofacNancyBootstrapper)
  private
  protected
    method ApplicationStartup(container: ILifetimeScope; pipelines: Nancy.Bootstrapper.IPipelines); override;
    method ConfigureApplicationContainer(existingContainer:ILifetimeScope);override;
  public
  end;

implementation

method AzureBootStrapper.ConfigureApplicationContainer(existingContainer: Autofac.ILifetimeScope);
begin
  inherited.ConfigureApplicationContainer(existingContainer);

  var connectionString := CloudConfigurationManager.GetSetting('Microsoft.ServiceBus.ConnectionString');

  var cacheString := ConfigurationManager.AppSettings['RedisCache'];
  var cache := new Cache(ConnectionMultiplexer.Connect(cacheString));

  var builder := new ContainerBuilder();
  builder.Register(c -> begin
                     var obj := new Pipeline(connectionString,'TestQueue',cache);
                     obj.ErrorCallback := (e) ->
                      begin
                        System.Diagnostics.Trace.TraceInformation(e.ToString);
                        Elmah.ErrorSignal.FromCurrentContext().Raise(e);
                      end;
                     obj.TraceCallback := (m) ->
                      begin
                        System.Diagnostics.Trace.TraceInformation(m);
                      end;
                     obj.Start;
                     exit obj;
                     end).As<Pipeline>().SingleInstance;

  builder.Register(c -> cache).As<Cache>().SingleInstance;
  
  builder.Update(existingContainer.ComponentRegistry);

end;

method AzureBootStrapper.ApplicationStartup(container: ILifetimeScope; pipelines: Nancy.Bootstrapper.IPipelines);
begin
  inherited.ApplicationStartup(container, pipelines);
  Elmahlogging.Enable(pipelines,'logging');
end;

end.
