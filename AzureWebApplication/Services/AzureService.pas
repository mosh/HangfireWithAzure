namespace AzureWebApplication.Services;

interface

uses
  System.Collections.Generic,
  System.Dynamic,
  System.Linq,
  System.Text;

type
  AzureService = public class
  private
  protected
  public
    method SomeMethod:dynamic;
  end;

implementation

method AzureService.SomeMethod: dynamic;
begin
  var obj:dynamic := new ExpandoObject;
  obj.Id := 1;
  exit obj;
end;

end.
