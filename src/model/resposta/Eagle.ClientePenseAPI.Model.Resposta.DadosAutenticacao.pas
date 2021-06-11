unit Eagle.ClientePenseAPI.Model.Resposta.DadosAutenticacao;

interface

uses

  XSuperObject;

type

  TDadosRespostaAutenticacao = class
  public
    [Alias('authenticated')]
    Autenticado: Boolean;

    [Alias('message')]
    Mensagem: string;

    [Alias('create')]
    DataCriacao: TDateTime;

    [Alias('expiration')]
    DataValidade: TDateTime;

    [Alias('accessToken')]
    TokenAcesso: string;

    [Alias('accessKey')]
    IdentificadorCliente: string;

    [Alias('clientId')]
    ChaveAcesso: string;
  end;

implementation

end.
