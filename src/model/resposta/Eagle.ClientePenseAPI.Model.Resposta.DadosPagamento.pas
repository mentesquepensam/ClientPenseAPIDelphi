unit Eagle.ClientePenseAPI.Model.Resposta.DadosPagamento;

interface

uses

  XSuperObject;

type

  TDadosRespostaPagamento = class
  public
    [Alias('id')]
    Codigo: Integer;

    [Alias('description')]
    Descricao: string;

    [Alias('externalReference')]
    ReferenciaExterna: string;

    [Alias('urlCallback')]
    URLRetorno: string;

    [Alias('qrCodeUrl')]
    QrCodeURL: string;

    [Alias('qrCodeData')]
    QrCodeData: string;

    [Alias('status')]
    Status: string;

    [Alias('wallet')]
    CarteiraDigital: string;

    [Alias('updateAt')]
    UltimaAtualizacao: string;
  end;

implementation

end.
