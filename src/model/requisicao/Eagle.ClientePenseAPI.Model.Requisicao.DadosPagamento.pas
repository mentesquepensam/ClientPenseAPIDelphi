unit Eagle.ClientePenseAPI.Model.Requisicao.DadosPagamento;

interface

uses

  XSuperObject;

type

  TClientePagamento = class
  public
    [Alias('name')]
    Nome: string;

    [Alias('email')]
    EMail: string;

    [Alias('document')]
    Documento: string;
  end;

  TItemPagamento = class
  public
    [Alias('description')]
    Descricao: string;

    [Alias('quantity')]
    Quantidade: Double;

    [Alias('value')]
    Valor: Double;
  end;

  TDadosRequisicaoPagamento = class
  public
    [Alias('description')]
    Descricao: string;

    [Alias('customer')]
    ClientePagamento: TClientePagamento;

    [Alias('externalReference')]
    CodigoPagamentoERP: string;

    [Alias('urlCallback')]
    URLRetorno: string;

    [Alias('items')]
    ItensPagamento: TArray<TItemPagamento>;

    [Alias('value')]
    Valor: Double;

    [Alias('store')]
    CodigoLoja: string;

    [Alias('pdv')]
    CodigoTerminal: string;

    [Alias('wallet')]
    CarteiraDigital: string;
  end;

implementation

end.
