unit Eagle.ClientePenseAPI.Model.Resposta.BankDadosErro;

interface

uses

  XSuperObject;

type

  TBanckDadosRespostaErro = class
  public
    [Alias('success')]
    Successo: Boolean;

    [Alias('message')]
    Mensagem: string;
  end;

implementation

end.
