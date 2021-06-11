unit Eagle.ClientePenseAPI.Model.HorarioFuncionamentoLoja;

interface

uses

  XSuperObject;

type

  TDia = class
  public
    [Alies('open')]
    HorarioAbertura: string;

    [Alies('close')]
    HorarioFechamento: string;
  end;

  THorarioFuncionamentoLoja = class
  public
    [Alias('monday')]
    SegundaFeira: TDia;

    [Alias('tuesday')]
    TercaFeira: TDia;

    [Alias('wednesday')]
    QuartaFeira: TDia;

    [Alias('sunday')]
    Domingo: TDia;

    [Alias('saturday')]
    Sabado: TDia;

    [Alias('friday')]
    SextaFeira: TDia;

    [Alias('thursday')]
    QuintaFeira: TDia;
  end;

implementation

end.
