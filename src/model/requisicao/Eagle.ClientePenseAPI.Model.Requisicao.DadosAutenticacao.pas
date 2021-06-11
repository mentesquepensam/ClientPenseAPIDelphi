unit Eagle.ClientePenseAPI.Model.Requisicao.DadosAutenticacao;

interface

uses

  XSuperObject;

type

  TDadosRequisicaoAutenticacao = class
  public
    [Alias('clientId')]
    IdentificadorCliente: string;

    [Alias('accessKey')]
    ChaveAcesso: string;
  end;

implementation

end.
