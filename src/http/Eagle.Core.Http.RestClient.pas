unit Eagle.Core.Http.RestClient;

interface

uses
  System.Classes, IDHttp,

  Spring.Collections,

  Eagle.Core.Http.HttpResponse;

type
  IRestClient = interface(IInvokable)
    ['{6B4D0327-C95D-470A-94F1-0700C7AD84D5}']

    procedure ConfigurarHeaders(const Headers: IDictionary<string, string>);

    function Get(const Recurso: string): IHttpResponse;
    function Post(const Recurso: string; const Data: string = ''): IHttpResponse;
    function Delete(const Recurso: string): IHttpResponse;
  end;

implementation

end.
