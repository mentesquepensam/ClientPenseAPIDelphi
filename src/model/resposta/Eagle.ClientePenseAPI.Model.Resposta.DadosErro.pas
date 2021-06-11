unit Eagle.ClientePenseAPI.Model.Resposta.DadosErro;

interface

uses

  XSuperObject;

type

  TDadosRespostaErro = class
  public
    [Alias('type')]
    Tipo: string;

    [Alias('title')]
    Titulo: string;

    [Alias('status')]
    Codigo: Integer;

    [Alias('detail')]
    Descricao: string;

  end;

implementation

end.
