unit Eagle.ClientePenseAPI.Model.EnderecoLoja;

interface

uses

  XSuperObject;

type

  TEnderecoLoja = class
  public
    [Alias('streetNumber')]
    Numero: string;

    [Alias('streetName')]
    Logradouro: string;

    [Alias('cityName')]
    Cidade: string;

    [Alias('stateName')]
    NomeEstado: string;

    [Alias('latitude')]
    Latitude: Double;

    [Alias('longitude')]
    Longitude: Double;

    [Alias('reference')]
    Referencia: string;
  end;

implementation

end.
