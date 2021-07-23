unit Eagle.ClientePenseAPI.Model.Requisicao.DadosLoja;

interface

uses

  XSuperObject,

  Eagle.ClientePenseAPI.Model.HorarioFuncionamentoLoja,
  Eagle.ClientePenseAPI.Model.EnderecoLoja;

type

  TDadosRequisicaoLoja = class
  public
    //[Alias('name')]
    [Alias('companyName')]
    Nome: string;

    [Alias('tradeName')]
    NomeComercial: string;

    [Alias('document')]
    Documento: string;

    [Alias('externalReference')]
    CodigoLoja: string;

    [Alias('location')]
    Endereco: TEnderecoLoja;

    [Alias('businessHours')]
    HorarioFuncionamento: THorarioFuncionamentoLoja;
  end;

implementation

end.

{
  "companyName": "string",
  "tradeName": "string",     ???????????
  "document": "string",      ???????????
  "businessHours": {
    "monday": [
      {
        "open": "string",
        "close": "string"
      }
    ],
    "tuesday": [
      {
        "open": "string",
        "close": "string"
      }
    ],
    "wednesday": [
      {
        "open": "string",
        "close": "string"
      }
    ],
    "sunday": [
      {
        "open": "string",
        "close": "string"
      }
    ],
    "saturday": [
      {
        "open": "string",
        "close": "string"
      }
    ],
    "friday": [
      {
        "open": "string",
        "close": "string"
      }
    ],
    "thursday": [
      {
        "open": "string",
        "close": "string"
      }
    ]
  },
  "location": {
    "streetNumber": "string",
    "streetName": "string",
    "cityName": "string",
    "stateName": "string",
    "latitude": 0,
    "longitude": 0,
    "reference": "string"
  },
  "externalReference": "string"
}
Responses
