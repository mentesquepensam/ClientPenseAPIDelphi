unit Eagle.Core.Http.Impl.HttpResponse;

interface

uses
  Spring.Container,

  Eagle.Core.Http.HttpResponse;

type
  THttpResponse = class(TInterfacedObject, IHttpResponse)
  private
    FBody: string;
    FErrorMensage: string;
    FCodigo: Integer;

    function GetBody: string;
    function GetErrorMensage: string;
    function GetCodigo: Integer;

    procedure SetBody(const Value: string);
    procedure SetErrorMensage(const Value: string);
    procedure SetCodigo(const Value: Integer);

  public
    constructor Create(const Codigo: Integer; const Body, ErrorMensage: string);

    property Codigo: Integer read GetCodigo write SetCodigo;
    property Body: string read GetBody write SetBody;
    property ErrorMensage: string read GetErrorMensage write SetErrorMensage;
  end;

implementation

constructor THttpResponse.Create(const Codigo: Integer; const Body, ErrorMensage: string);
begin
  FCodigo := Codigo;
  FBody := Body;
  FErrorMensage := ErrorMensage;
end;

function THttpResponse.GetBody: string;
begin
  Result := FBody;
end;

function THttpResponse.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function THttpResponse.GetErrorMensage: string;
begin
  Result := FErrorMensage;
end;

procedure THttpResponse.SetBody(const Value: string);
begin
  FBody := Value;
end;

procedure THttpResponse.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure THttpResponse.SetErrorMensage(const Value: string);
begin
  FErrorMensage := Value;
end;

initialization

GlobalContainer.RegisterType<THttpResponse>.Implements<IHttpResponse>;

end.
