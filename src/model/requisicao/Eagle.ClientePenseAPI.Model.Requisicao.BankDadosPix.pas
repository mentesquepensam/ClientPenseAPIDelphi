unit Eagle.ClientePenseAPI.Model.Requisicao.BankDadosPix;

interface

uses

  XSuperObject;

type

  TDadosBankRequisicaoPix = class
  public
    [Alias('alias')]
    CodigoERP: string;

    [Alias('totalAmount')]
    Valor: string;

    [Alias('callbackAddress')]
    UrlRetorno: string;

  end;

  TDadosBankEndereco = class
  public
    [Alias('street')]
    Logradouro: string;

    [Alias('city')]
    Cidade: string;

    [Alias('uf')]
    Uf: string;

    [Alias('cep')]
    Cep: string;
  end;

  TDadosBankPagador = class
  public
    [Alias('cpfCpnj')]
    CpfCpnj: string;

    [Alias('name')]
    Nome: string;

    [Alias('addressing')]
    DadosBankEndereco: TDadosBankEndereco;

    [Alias('email')]
    Email: string;

    constructor Create;
    destructor Destroy; override;
  end;

  TDadosBankDesconto = class
  public
    [Alias('valuePerc')]
    Percentual: string;

    [Alias('date')]
    DataLimite: string;
  end;

  TDadosBankRequisicaoPixAgendado = class
  public
    [Alias('alias')]
    CodigoERP: string;

    [Alias('payerInformation')]
    DadosBankPagador: TDadosBankPagador;

    [Alias('totalAmount')]
    Valor: string;

    [Alias('dueDate')]
    DataAgendamento: string;

    [Alias('finesValuePerc')]
    PercentualMulta: string;

    [Alias('interestsValuePerc')]
    PercentualJuros: string;

    [Alias('discount')]
    DadosBankDesconto: TDadosBankDesconto;

    [Alias('callbackAddress')]
    UrlRetorno: string;
    constructor Create;
    destructor Destroy; override;
  end;


implementation
{ TDadosBankPagador }

constructor TDadosBankPagador.Create;
begin
   DadosBankEndereco:= TDadosBankEndereco.Create;
end;

destructor TDadosBankPagador.Destroy;
begin
  DadosBankEndereco.Free;
  inherited;
end;


{ TDadosBankRequisicaoPixAgendado }

constructor TDadosBankRequisicaoPixAgendado.Create;
begin
   DadosBankPagador := TDadosBankPagador.Create;
   DadosBankDesconto := TDadosBankDesconto.Create;
end;

destructor TDadosBankRequisicaoPixAgendado.Destroy;
begin
  DadosBankPagador.free;
  DadosBankDesconto.free;
  inherited;
end;


end.
