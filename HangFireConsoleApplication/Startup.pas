namespace HangFireConsoleApplication;

interface

uses
  Microsoft.WindowsAzure,
  HangFire,
  Hangfire.Storage.*,
  HangFire.Azure.ServiceBusQueue,
  System.Configuration,
  Hangfire.SqlServer,
  System.Collections.Generic,
  System.Linq,
  System.Text, 
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

      config
      .UseSqlServerStorage(databaseConnectionString)
      .UseServiceBusQueues(serviceBusConnectionString);

      config.UseServer();
    end
  );

end;

end.
