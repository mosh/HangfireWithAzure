namespace HangFireConsoleApplication;

interface

uses
  Microsoft.WindowsAzure,
  Hangfire,
  Hangfire.Storage.*,
  System.Configuration,
  Hangfire.SqlServer,
  Hangfire.Redis,
  System.Collections.Generic,
  System.Linq,
  System.Text, 
  HangFireConsoleApplication.ServiceBusQueue,
  Owin;

type

  Startup = public class
  private
  protected
  public
    method Configuration(app:IAppBuilder);

  end;

implementation

method Startup.Configuration(app: Owin.IAppBuilder);
begin
  app.UseNancy;
  app.UseHangfire(config -> 
    begin
      var databaseConnectionString := ConfigurationManager.AppSettings['Database'];
      var serviceBusConnectionString := CloudConfigurationManager.GetSetting('Microsoft.ServiceBus.ConnectionString');
      var redisConnectionString := ConfigurationManager.AppSettings['Redis'];

      config
      .UseSqlServerStorage(databaseConnectionString)
//      .UseRedisStorage(redisConnectionString)
      .UseServiceBusQueues(serviceBusConnectionString,['default']);

      config.UseServer();
    end
  );

end;

end.
