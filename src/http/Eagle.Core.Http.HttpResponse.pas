unit Eagle.Core.Http.HttpResponse;

interface

type
  IHttpResponse = interface
    ['{6B297CA6-4DCD-43EF-9130-87C9BBF2373C}']

    function GetBody: string;
    function GetErrorMensage: string;
    function GetCodigo: Integer;

    procedure SetBody(const Value: string);
    procedure SetErrorMensage(const Value: string);
    procedure SetCodigo(const Value: Integer);

    property Codigo: Integer read GetCodigo write SetCodigo;
    property Body: string read GetBody write SetBody;
    property ErrorMensage: string read GetErrorMensage write SetErrorMensage;

  end;

implementation

end.
