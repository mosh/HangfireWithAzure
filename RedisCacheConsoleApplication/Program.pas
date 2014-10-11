namespace RedisCacheConsoleApplication;

interface

uses
  System.Linq, 
  StackExchange.Redis;

type
  ConsoleApp = class
  public
    class method Main(args: array of String);
  end;

implementation

class method ConsoleApp.Main(args: array of String);
begin

  var connection := ConnectionMultiplexer.Connect('isailed.redis.cache.windows.net,ssl=true,password=G+OmGu4vYcYeXZFFS/fiW+1mozgFzvqUq6TcSPvpTV0=');
  var cache := connection.GetDatabase;

  cache.StringSet('key','value');

  var value := cache.StringGet('key');
  Console.WriteLine(value);

end;

end.
