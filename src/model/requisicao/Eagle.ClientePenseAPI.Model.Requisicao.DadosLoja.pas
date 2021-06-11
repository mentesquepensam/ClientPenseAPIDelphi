unit Eagle.ClientePenseAPI.Model.Requisicao.DadosLoja;

interface

uses

  XSuperObject,

  Eagle.ClientePenseAPI.Model.HorarioFuncionamentoLoja,
  Eagle.ClientePenseAPI.Model.EnderecoLoja;

type

  TDadosRequisicaoLoja = class
  public
    [Alias('name')]
    Nome: string;

    [Alias('externalReference')]
    CodigoLoja: string;

    [Alias('location')]
    Endereco: TEnderecoLoja;

    [Alias('businessHours')]
    HorarioFuncionamento: THorarioFuncionamentoLoja;
  end;

implementation

end.
