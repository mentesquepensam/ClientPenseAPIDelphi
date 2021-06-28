unit Eagle.Core.Http.Impl.RestClient;

interface

uses
  System.SysUtils, System.Classes,
  IDHttp, IdSSLOpenSSL, IdCompressorZLib,

  Spring.Container,
  Spring.Collections,

  Eagle.Core.Http.HttpResponse,
  Eagle.Core.Http.RestClient;

type
  TRestClient = class(TInterfacedObject, IRestClient)
  private
    FHttpClient: TIDHttp;

    FBaseURL: string;

    procedure ResetarRequestEResponse;

  public
    constructor Create(const BaseURL: string);
    destructor Destroy; override;

    procedure ConfigurarHeaders(const Headers: IDictionary<string, string>);

    function Get(const Recurso: string): IHttpResponse;
    function Post(const Recurso: string; const Data: string = ''): IHttpResponse;
    function Delete(const Recurso: string): IHttpResponse;
  end;

implementation

constructor TRestClient.Create(const BaseURL: string);
var
  Ssl: TIdSSLIOHandlerSocketOpenSSL;
begin
  FBaseURL := BaseURL;

  FHttpClient := TIDHttp.Create(nil);

  Ssl := TIdSSLIOHandlerSocketOpenSSL.Create(FHttpClient);

  //
  //testa se e´ a versao do delphi Xe7
  //
  {$IFDEF VER280}
  Ssl.SSLOptions.Method := sslvSSLv23;
  {$ELSE}
  Ssl.SSLOptions.SSLVersions := [SslvTLSv1, SslvTLSv1_1, SslvTLSv1_2];
  {$ENDIF}

  FHttpClient.IOHandler := Ssl;
  FHttpClient.HandleRedirects := True;
  FHttpClient.Request.CustomHeaders.FoldLines := False;
  FHttpClient.Compressor := TIdCompressorZLib.Create(FHttpClient);

  ResetarRequestEResponse;
end;

procedure TRestClient.ResetarRequestEResponse;
begin
  FHttpClient.Request.RawHeaders.Clear;
  FHttpClient.Response.RawHeaders.Clear;

  FHttpClient.Request.Accept := 'application/json';
  FHttpClient.Request.ContentType := 'application/json';
  FHttpClient.Request.Charset := 'utf-8';
end;

destructor TRestClient.Destroy;
begin
  FHttpClient.Free;
  inherited;
end;

function TRestClient.Get(const Recurso: string): IHttpResponse;
var
  Response: TStringStream;
  URL, ErrorMensage: string;
begin
  URL := FBaseURL + Recurso;

  Response := TStringStream.Create(EmptyStr, TEncoding.UTF8);

  try
    FHttpClient.Get(URL, Response);
  except
    on E: EIdHTTPProtocolException do
      ErrorMensage := E.ErrorMessage;
    on E: Exception do
      raise Exception.Create(E.Message);
  end;

  Result := GlobalContainer.Resolve<IHttpResponse>([FHttpClient.Response.ResponseCode, Response.DataString, ErrorMensage]);
end;

function TRestClient.Post(const Recurso: string; const Data: string = ''): IHttpResponse;
var
  Request, Response: TStringStream;
  URL, ErrorMensage: string;
begin
  URL := FBaseURL + Recurso;
  Request := TStringStream.Create(Data, TEncoding.UTF8);
  Response := TStringStream.Create(EmptyStr, TEncoding.UTF8);

  try
    FHttpClient.POST(URL, Request, Response);
  except
    on E: EIdHTTPProtocolException do
      ErrorMensage := E.ErrorMessage;
    on E: Exception do
      raise Exception.Create(E.Message);
  end;

  URL := FHttpClient.ResponseText;

  Result := GlobalContainer.Resolve<IHttpResponse>([FHttpClient.Response.ResponseCode, Response.DataString, ErrorMensage]);
end;

function TRestClient.Delete(const Recurso: string): IHttpResponse;
var
  Response: TStringStream;
  URL, ErrorMensage: string;
begin
  URL := FBaseURL + Recurso;

  Response := TStringStream.Create(EmptyStr, TEncoding.UTF8);

  try
    FHttpClient.Delete(URL, Response);
  except
    on E: EIdHTTPProtocolException do
      ErrorMensage := E.ErrorMessage;
    on E: Exception do
      raise Exception.Create(E.Message);
  end;

  Result := GlobalContainer.Resolve<IHttpResponse>([FHttpClient.Response.ResponseCode, Response.DataString, ErrorMensage]);
end;

procedure TRestClient.ConfigurarHeaders(const Headers: IDictionary<string, string>);
begin
  FHttpClient.Request.RawHeaders.Clear();
  Headers.Keys.ForEach(
    procedure(const Chave: string)
    begin
      FHttpClient.Request.CustomHeaders.AddValue(Chave, Headers.GetValueOrDefault(Chave));
    end);
end;

initialization

GlobalContainer.RegisterType<TRestClient>.Implements<IRestClient>;

end.
