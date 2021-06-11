unit Eagle.ClientePenseAPI.Model.Requisicao.DadosTerminal;

interface

uses

  XSuperObject;

type

  TDadosRequisicaoTerminal = class
  public
    [Alias('name')]
    Nome: string;

    [Alias('externalReference')]
    CodigoTerminalERP: string;

    [Alias('externalReferenceStore')]
    CodigoTerminalLoja: string;
  end;

implementation

end.
