unit Eagle.ClientePenseAPI.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Imaging.Pngimage, IdHTTP, System.StrUtils, Winapi.ShellAPI, Vcl.OleCtrls, SHDocVw,

  Spring,
  Spring.Container,
  Spring.Collections,

  //Eagle.Core.View.Notification,

  Mqp.View.Notification,

  Eagle.ClientePenseAPI.Model.HorarioFuncionamentoLoja,
  Eagle.ClientePenseAPI.Model.EnderecoLoja,

  Eagle.ClientePenseAPI.Model.Requisicao.DadosAutenticacao,
  Eagle.ClientePenseAPI.Model.Requisicao.DadosPagamento,
  Eagle.ClientePenseAPI.Model.Requisicao.DadosLoja,
  Eagle.ClientePenseAPI.Model.Requisicao.DadosTerminal,
  Eagle.ClientePenseAPI.Model.Requisicao.BankDadosPix,

  Eagle.ClientePenseAPI.Model.Resposta.DadosAutenticacao,
  Eagle.ClientePenseAPI.Model.Resposta.DadosPagamento,
  Eagle.ClientePenseAPI.Model.Resposta.BankDadosPix,
  Eagle.ClientePenseAPI.Model.Resposta.BankDadosConsultaPix,

  Eagle.ClientePenseAPI.Service.ClientePense, Vcl.Samples.Spin,

  Eagle.ClientePenseAPI.Util.Tipos;

type
  TMain = class(TForm)
    PgcPenseAPI: TPageControl;

    TSConfiguracoes: TTabSheet;
    TSCadastros: TTabSheet;
    TSPagamentosDigitais: TTabSheet;
    TSConsultaPagamentos: TTabSheet;

    GBServidor: TGroupBox;
    GBRequisicaoPagamento: TGroupBox;
    GBTerminal: TGroupBox;
    GBRespotaPagamento: TGroupBox;
    GBLoja: TGroupBox;
    GBItensPagamento: TGroupBox;
    GBConsultarPagamento: TGroupBox;

    LBBaseURLConfiguracao: TLabel;
    LBClientIDConfiguracao: TLabel;
    LBAccessKeyConfiguracao: TLabel;
    LBAPITokenConfiguracao: TLabel;
    LBCodigoTerminalPagamento: TLabel;
    LBDescricaoPagamento: TLabel;
    LBCodigoLojaPagamento: TLabel;
    LBCodigoPagamentoERP: TLabel;
    LBValorPagamento: TLabel;
    LBCarteiraDigitalPagamento: TLabel;
    LBCodigoPagamentoAPIRespostaPagamento: TLabel;
    LBQrCodeURLRespostaPagamento: TLabel;
    LBUltimaAtualizacaoPagamentoResposta: TLabel;
    LBStatusPagamentoRepostaPagamento: TLabel;
    LBUltimaAtualizacaoPagamentoRespostaData: TLabel;
    LBNomeLoja: TLabel;
    LBIdentificadorLoja: TLabel;
    LBLatitudeLoja: TLabel;
    LBLongitudeLoja: TLabel;
    LBTerminalNome: TLabel;
    LBTerminalIdentificador: TLabel;
    LBTerminalIdentificadorLoja: TLabel;
    LBLogradouroLoja: TLabel;
    LBCidadeLoja: TLabel;
    LBNomeEstadoLoja: TLabel;
    LBNumeroLoja: TLabel;
    LBReferenciaLoja: TLabel;
    LBDescricaoItemPagamento: TLabel;
    LBValorItemPagamento: TLabel;
    LBQuantidadeItemPagamento: TLabel;
    LBCodigoPagamentoRespostaPagamento: TLabel;
    LBCodigoPagamentoAPIConsultaPagamentos: TLabel;
    LBURLQrCodeConsultaPagamentos: TLabel;
    LBUltimaAtualizacaoConsultaPagamentos: TLabel;
    LBStatusPagamentoConsultaPagamentos: TLabel;
    LBUltimaAtualizacaoDataConsultaPagamentos: TLabel;
    LBCodigoPagamentoERPConsultaPagamentos: TLabel;
    LBTotalItensPagamento: TLabel;
    MEStatusPagamentoRespostaPagamento: TEdit;

    MMApiTokenConfiguracao: TMemo;

    CBCarteiraDigitalPagamento: TComboBox;

    BTAutenticarClienteConfiguracao: TButton;
    BTListarCarteiras: TButton;
    BTEnviarTerminal: TButton;
    BTEnviarLoja: TButton;
    BTEnviarPagamento: TButton;
    BTAdicionarItemPagamento: TButton;
    BTConsultarPagamentoCodigoAPI: TBitBtn;
    BTConsultarPagamentoCodigoERP: TBitBtn;
    BTAtualizarStatusRespostaPagamento: TBitBtn;
    BTAbrirQRCodeConsultaPagamentosNavegador: TBitBtn;
    BTDeletarPagamento: TBitBtn;
    BTAbrirQRCodeRespostaPagamentosNavegador: TBitBtn;
    BTLimparItensPagamento: TButton;
    MEBaseURLConfiguracao: TEdit;
    MEClientIDConfiguracao: TEdit;
    MEAccessKeyConfiguracao: TEdit;
    MENomeLoja: TEdit;
    MEIdentificadorLoja: TEdit;
    MELogradouroLoja: TEdit;
    MERefernciaLoja: TEdit;
    MENomeEstadoLoja: TEdit;
    MECidadeLoja: TEdit;
    MENumeroLoja: TEdit;
    MELatitude: TSpinEdit;
    MELongitude: TSpinEdit;
    METerminalNome: TEdit;
    METerminalIdentificador: TEdit;
    METerminalIdentificadorLoja: TEdit;
    MEDescricaoPagamento: TEdit;
    MECodigoPagamentoERP: TEdit;
    MECodigoLojaPagamento: TEdit;
    MECodigoTerminalPagamento: TEdit;
    MECodigoPagamentoAPIRespostaPagamento: TEdit;
    MECodigoPagamentoERPRespostaPagamento: TEdit;
    MEQrCodeURLRespostaPagamento: TEdit;
    MECodigoPagamentoAPIConsultaPagamentos: TEdit;
    MECodigoPagamentoERPConsultaPagamentos: TEdit;
    MEQRCodeConsultaPagamentos: TEdit;
    MEStatusPagamentoConsultaPagamentos: TEdit;
    MEQuantidadeItemPagamento: TSpinEdit;
    MEValorItemPagamento: TSpinEdit;
    METotalItensPagamento: TSpinEdit;
    MEValorPagamento: TSpinEdit;
    MEDescricaoItemPagamento: TEdit;
    GbQrCode: TGroupBox;
    WebBrowserQrCode: TWebBrowser;
    PnlQrCode: TPanel;
    BtExibeQrCode: TBitBtn;
    BtLimpaQrcodeTela: TBitBtn;
    PgcPrincipal: TPageControl;
    TSPenseApi: TTabSheet;
    TSPenseBank: TTabSheet;
    PgcPenseBank: TPageControl;
    TSBancConfiguracoes: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    MEBankBaseURLConfiguracao: TEdit;
    TSBancPix: TTabSheet;
    GroupBox4: TGroupBox;
    Label21: TLabel;
    BtBankEnviarPix: TButton;
    TSBancConsultaPix: TTabSheet;
    Label4: TLabel;
    MEBankAliasConfiguracao: TEdit;
    MEBankBearerConfiguracao: TMemo;
    BtBankEnviarPixAgendado: TButton;
    Label3: TLabel;
    MeBankDataAgendamento: TEdit;
    MEBankValorPix: TEdit;
    GroupBox6: TGroupBox;
    Label27: TLabel;
    MEBankHashAPIRespostaPix: TEdit;
    PageControl1: TPageControl;
    TsStatus: TTabSheet;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    LbBankUltimaAtualizacao: TLabel;
    Label32: TLabel;
    MEBankStatusPagamentoRespostaPix: TEdit;
    BTBankAtualizarStatusRespostaPix: TBitBtn;
    MEBanckCodigoPagamentoERPRespostaPix: TEdit;
    MEBankQrCodeURLRespostaPix: TEdit;
    MeStatusRespostaPix: TMemo;
    TsQrCode: TTabSheet;
    ImgQrCode: TImage;
    BTBanckAbrirQRCodeRespostaPixNavegador: TBitBtn;
    Label5: TLabel;
    MeBankPercentualJuros: TEdit;
    Label6: TLabel;
    MeBankPercentualMulta: TEdit;
    Label7: TLabel;
    MeBankPercentualDesconto: TEdit;
    MeBankValidadeDesconto: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    MEBankNome: TEdit;
    MeBankLogradouro: TEdit;
    MeBankCpfCnpj: TEdit;
    MeBankUf: TEdit;
    MeBankCidade: TEdit;
    MeBankCep: TEdit;
    Label10: TLabel;
    Label14: TLabel;
    MeBankUrlRetorno: TEdit;
    Label16: TLabel;
    MENomeFantasia: TEdit;
    Label17: TLabel;
    MECNPJ: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BTAutenticarClienteConfiguracaoClick(Sender: TObject);
    procedure BTEnviarLojaClick(Sender: TObject);
    procedure BTEnviarTerminalClick(Sender: TObject);
    procedure BTListarCarteirasClick(Sender: TObject);
    procedure BTAdicionarItemPagamentoClick(Sender: TObject);
    procedure BTLimparItensPagamentoClick(Sender: TObject);
    procedure BTEnviarPagamentoClick(Sender: TObject);
    procedure BTAtualizarStatusRespostaPagamentoClick(Sender: TObject);
    procedure BTConsultarPagamentoCodigoAPIClick(Sender: TObject);
    procedure BTConsultarPagamentoCodigoERPClick(Sender: TObject);
    procedure BTAbrirQRCodeConsultaPagamentosNavegadorClick(Sender: TObject);
    procedure BTAbrirQRCodeRespostaPagamentosNavegadorClick(Sender: TObject);
    procedure BTDeletarPagamentoClick(Sender: TObject);
    procedure WebBrowserQrCodeDocumentComplete(ASender: TObject;
      const pDisp: IDispatch; const URL: OleVariant);
    procedure BtExibeQrCodeClick(Sender: TObject);
    procedure BtLimpaQrcodeTelaClick(Sender: TObject);
    procedure PgcPenseBankChanging(Sender: TObject; var AllowChange: Boolean);
    procedure BtBankEnviarPixClick(Sender: TObject);
    procedure BTBankAtualizarStatusRespostaPixClick(Sender: TObject);
    procedure BTBanckAbrirQRCodeRespostaPixNavegadorClick(Sender: TObject);
    procedure BtBankEnviarPixAgendadoClick(Sender: TObject);

  private
    FClientePense: IClientePense;
    FNotification: INotification;
    FItensPagamento: IList<TItemPagamento>;

    procedure InicializarClientePense(const BaseUrl : String; const NomeApi : String = PENSE_API; const BearerToken : String = '');
    procedure Autenticar;
    procedure EnviarLoja;
    procedure EnviarPagamento;
    procedure EnviarTerminal;
    procedure ListarEPreencherComboCarteiras;
    procedure EnviarPixBank;
    procedure EnviarPixAgendadoBank;

    procedure TratarRetornoAutenticacao(const RespostaAutenticacao: TDadosRespostaAutenticacao);
    procedure AtualizarDadosRetornoPagamento(const RespostaPagamento: TDadosRespostaPagamento);
    procedure AtualizarDadosRetornoPixBank(const RespostaPagamento: TDadosBankRespostaPix);
    procedure AtualizarDadosConsultaPagamento(const RespostaPagamento: TDadosRespostaPagamento);
    procedure AtualizarDadosConsultaPixBank(const RespostaPagamento: TDadosBankRespostaConsultaPix);
    procedure AtivarDesativarOpcoesAPI(const Value: Boolean);
    procedure AtivarDesativarOpcoesBank(const Value: Boolean);

    procedure AdicionarItensPagamento;
    procedure LimparItensPagamento;
    procedure AtualizarValorTotalItensPagamento;

    procedure AbrirURLNavegadorPadrao(const URL: string);
    procedure AbrirQrCodeNavegador(const QrCodeEdit: TEdit);
    procedure DeletarPagamento;

    procedure ValidarConfiguracao;
    procedure ValidarDadosPagamento;
    procedure ValidarItensPagamento;
    procedure ValidarLoja;
    procedure ValidarTerminal;

    procedure ExibeQrCode(const UrlQrCode : String);

    function ValidarConfiguracaoBank : boolean;
    procedure ValidarDadosPixBank;
    procedure ValidarDadosPixAgendadoBank;

  public
    { Public declarations }
  end;

const
  MSG_CAMPO_OBRIGATORIO = 'Campo de preenchimento obrigatorio!';
  MSG_VALOR_ITENS_DIFERE_TOTAL = 'Valor do pagamento deve ser igual ao total dos itens!';

var
  Main: TMain;

implementation

{$R *.dfm}

procedure TMain.FormCreate(Sender: TObject);
begin

  FNotification := GlobalContainer.Resolve<INotification>;

  MEBankBearerConfiguracao.Text := EmptyStr;
  MeStatusRespostaPix.Text := EmptyStr;

  PgcPrincipal.ActivePage := TSPenseApi;
  PgcPenseAPI.ActivePage  := TSConfiguracoes;
  PgcPenseBank.ActivePage := TSBancConfiguracoes;


  MEBankAliasConfiguracao.Text  := '2021/000';
  MEBankValorPix.Text := '10,00';
  MEBankBearerConfiguracao.Text :=
     'eyJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE2MjY5NzI3NzIsImlzcyI6IntcImlk'+
     'Y29ycmVudGlzdGFcIjo4NDAsXCJ1c3VhcmlvXCI6XCI0NC45NDQuNjc2LzAwM'+
     'DEtMDlcIn0iLCJleHAiOjkwOTE5MzI3NzJ9.Eh9pM3AyGh99QuGihHMKokvJP'+
     '6po2xNYsSfQrYJj8eQPbxqrURHtHsGwOXL3ZgB0IdjtVh7Xn0zi-DpJ4-syHA';
end;

procedure TMain.BTAutenticarClienteConfiguracaoClick(Sender: TObject);
begin
  Self.ValidarConfiguracao;
  Self.InicializarClientePense(MEBaseURLConfiguracao.Text);
  Self.Autenticar;
end;

procedure TMain.BtBankEnviarPixClick(Sender: TObject);
begin
  Self.ValidarDadosPixBank;
  if not Assigned(FClientePense) then
  begin
     Self.InicializarClientePense(MEBankBaseURLConfiguracao.Text,
                                  PENSE_BANK_API,
                                  MEBankBearerConfiguracao.Text);
  end;
  Self.EnviarPixBank;
  PgcPenseBank.ActivePage := TSBancConsultaPix;
end;

procedure TMain.BtBankEnviarPixAgendadoClick(Sender: TObject);
begin
  Self.ValidarDadosPixAgendadoBank;
  if not Assigned(FClientePense) then
  begin
     Self.InicializarClientePense(MEBankBaseURLConfiguracao.Text,
                                  PENSE_BANK_API,
                                  MEBankBearerConfiguracao.Text);
  end;
  Self.EnviarPixAgendadoBank;
  PgcPenseBank.ActivePage := TSBancConsultaPix;
end;

procedure TMain.BTEnviarLojaClick(Sender: TObject);
begin
  Self.ValidarLoja;
  Self.EnviarLoja;
end;

procedure TMain.BTEnviarTerminalClick(Sender: TObject);
begin
  Self.ValidarTerminal;
  Self.EnviarTerminal;
end;


procedure TMain.BTListarCarteirasClick(Sender: TObject);
begin
  Self.ListarEPreencherComboCarteiras;
end;

procedure TMain.BTAdicionarItemPagamentoClick(Sender: TObject);
begin
  Self.ValidarItensPagamento;
  Self.AdicionarItensPagamento;
  Self.AtualizarValorTotalItensPagamento;
end;

procedure TMain.BTLimparItensPagamentoClick(Sender: TObject);
begin
  Self.LimparItensPagamento;
  Self.AtualizarValorTotalItensPagamento;
end;

procedure TMain.BTEnviarPagamentoClick(Sender: TObject);
begin
  Self.ValidarDadosPagamento;
  Self.EnviarPagamento;
  Self.AbrirURLNavegadorPadrao(MEQrCodeURLRespostaPagamento.Text);
end;

procedure TMain.BTDeletarPagamentoClick(Sender: TObject);
var
  DadosRetornoPagamento: TDadosRespostaPagamento;
begin
  Self.DeletarPagamento;

  DadosRetornoPagamento := FClientePense.ConsultarPagamentoPeloCodigoAPI(string(MECodigoPagamentoAPIConsultaPagamentos.Text).ToInteger);

  Self.AtualizarDadosConsultaPagamento(DadosRetornoPagamento);
end;

procedure TMain.BTAbrirQRCodeRespostaPagamentosNavegadorClick(Sender: TObject);
begin
  Self.AbrirQrCodeNavegador(MEQrCodeURLRespostaPagamento);
end;

procedure TMain.BTBanckAbrirQRCodeRespostaPixNavegadorClick(Sender: TObject);
var
  QrCode: TMemoryStream;
begin
  if string(MEBankHashAPIRespostaPix.Text).IsEmpty then
  begin
    FNotification.BalloonWarning(MEBankHashAPIRespostaPix, MSG_CAMPO_OBRIGATORIO);
    Abort;
  end;

  if not Assigned(FClientePense) then
  begin
     Self.InicializarClientePense(MEBankBaseURLConfiguracao.Text,
                                  PENSE_BANK_API,
                                  MEBankBearerConfiguracao.Text);
  end;
  try
    QrCode := FClientePense.BanckConsultarQrcodePeloHash(MEBankHashAPIRespostaPix.Text);

    QrCode.Position := 0;

    ImgQrCode.Picture.LoadFromStream(QrCode);
  finally
     QrCode.Free;
  end;
end;

procedure TMain.BTBankAtualizarStatusRespostaPixClick(Sender: TObject);
var
  DadosBankRespostaConsultaPix: TDadosBankRespostaConsultaPix;
begin
  if string(MEBankHashAPIRespostaPix.Text).IsEmpty then
  begin
    FNotification.BalloonWarning(MEBankHashAPIRespostaPix, MSG_CAMPO_OBRIGATORIO);
    Abort;
  end;

  if not Assigned(FClientePense) then
  begin
     Self.InicializarClientePense(MEBankBaseURLConfiguracao.Text,
                                  PENSE_BANK_API,
                                  MEBankBearerConfiguracao.Text);
  end;

  DadosBankRespostaConsultaPix := FClientePense.BanckConsultarPixPeloHash(MEBankHashAPIRespostaPix.Text);

  Self.AtualizarDadosConsultaPixBank(DadosBankRespostaConsultaPix);
end;

procedure TMain.BTAbrirQRCodeConsultaPagamentosNavegadorClick(Sender: TObject);
begin
  Self.AbrirQrCodeNavegador(MEQRCodeConsultaPagamentos);
end;

procedure TMain.BTConsultarPagamentoCodigoAPIClick(Sender: TObject);
var
  DadosRetornoPagamento: TDadosRespostaPagamento;
begin
  if string(MECodigoPagamentoAPIConsultaPagamentos.Text).IsEmpty then
  begin
    FNotification.BalloonWarning(MECodigoPagamentoAPIConsultaPagamentos, MSG_CAMPO_OBRIGATORIO);
    Abort;
  end;

  DadosRetornoPagamento := FClientePense.ConsultarPagamentoPeloCodigoAPI(string(MECodigoPagamentoAPIConsultaPagamentos.Text).ToInteger);

  Self.AtualizarDadosConsultaPagamento(DadosRetornoPagamento);
end;

procedure TMain.BTConsultarPagamentoCodigoERPClick(Sender: TObject);
var
  DadosRetornoPagamento: TDadosRespostaPagamento;
begin
  if string(MECodigoPagamentoERPConsultaPagamentos.Text).IsEmpty then
  begin
    FNotification.BalloonWarning(MECodigoPagamentoERPConsultaPagamentos, MSG_CAMPO_OBRIGATORIO);
    Abort;
  end;

  DadosRetornoPagamento := FClientePense.ConsultarPagamentoPelaCodigoERP(string(MECodigoPagamentoERPConsultaPagamentos.Text));

  Self.AtualizarDadosConsultaPagamento(DadosRetornoPagamento);
end;

procedure TMain.BtLimpaQrcodeTelaClick(Sender: TObject);
begin
   PnlQrCode.Visible := False;
   WebBrowserQrCode.Visible := False;
end;

procedure TMain.BTAtualizarStatusRespostaPagamentoClick(Sender: TObject);
var
  DadosRetornoPagamento: TDadosRespostaPagamento;
begin  if string(MECodigoPagamentoAPIRespostaPagamento.Text).IsEmpty then
  begin
    FNotification.BalloonWarning(MECodigoPagamentoAPIRespostaPagamento, MSG_CAMPO_OBRIGATORIO);
    Abort;
  end;

  DadosRetornoPagamento := FClientePense.ConsultarPagamentoPeloCodigoAPI(string(MECodigoPagamentoAPIRespostaPagamento.Text).ToInteger);
  Self.AtualizarDadosRetornoPagamento(DadosRetornoPagamento);
end;

procedure TMain.InicializarClientePense(const BaseUrl : String; const NomeApi : String = PENSE_API; const BearerToken : String = '');
begin
  FClientePense := GlobalContainer.Resolve<IClientePense>([BaseUrl,NomeApi,BearerToken]);
end;

procedure TMain.Autenticar;
var
  DadosRequisicaoAutenticacao: TDadosRequisicaoAutenticacao;
  DadosRespostaAutenticacao: TDadosRespostaAutenticacao;
begin
  DadosRequisicaoAutenticacao := TDadosRequisicaoAutenticacao.Create;

  try
    DadosRequisicaoAutenticacao.IdentificadorCliente := MEClientIDConfiguracao.Text;
    DadosRequisicaoAutenticacao.ChaveAcesso := MEAccessKeyConfiguracao.Text;

    DadosRespostaAutenticacao := FClientePense.RealizarAutenticacaoCliente(DadosRequisicaoAutenticacao);
  finally
    Self.TratarRetornoAutenticacao(DadosRespostaAutenticacao);
    DadosRequisicaoAutenticacao.Free;
    DadosRespostaAutenticacao.Free;
  end;

end;

procedure TMain.TratarRetornoAutenticacao(const RespostaAutenticacao: TDadosRespostaAutenticacao);
begin
  if not(Assigned(RespostaAutenticacao)) or not(RespostaAutenticacao.Autenticado) then
  begin
    FNotification.MessageWarning('Cliente não autenticado, funções da API não serão ativadas!');
    MMApiTokenConfiguracao.Text := EmptyStr;
    Self.AtivarDesativarOpcoesAPI(False);
    Abort;
  end;

  MMApiTokenConfiguracao.Text := RespostaAutenticacao.TokenAcesso;
  FNotification.MessageInformation('Cliente autenticado com sucesso, funções da API Liberadas!');
  Self.AtivarDesativarOpcoesAPI(True);
end;

procedure TMain.AtivarDesativarOpcoesAPI(const Value: Boolean);
begin
  TSPagamentosDigitais.Enabled := Value;
  TSCadastros.Enabled := Value;
  TSConsultaPagamentos.Enabled := Value;
end;

procedure TMain.AtivarDesativarOpcoesBank(const Value: Boolean);
begin
  TSBancPix.Enabled := Value;
  TSBancConsultaPix.Enabled := Value;
end;

procedure TMain.EnviarLoja;
var
  Loja: TDadosRequisicaoLoja;
begin
  Loja := TDadosRequisicaoLoja.Create;
  Loja.HorarioFuncionamento := THorarioFuncionamentoLoja.Create;
  Loja.Endereco := TEnderecoLoja.Create;

  try
    Loja.Nome := MENomeLoja.Text;
    Loja.CodigoLoja := MEIdentificadorLoja.Text;

    Loja.NomeComercial := MENomeFantasia.Text;
    Loja.Documento := MECNPJ.Text;

    Loja.Endereco.Numero := MENumeroLoja.Text;
    Loja.Endereco.Logradouro := MELogradouroLoja.Text;
    Loja.Endereco.Cidade := MECidadeLoja.Text;
    Loja.Endereco.Referencia := MERefernciaLoja.Text;
    Loja.Endereco.NomeEstado := MENomeEstadoLoja.Text;
    Loja.Endereco.Latitude := string(MELatitude.Text).ToDouble;
    Loja.Endereco.Longitude := string(MELongitude.Text).ToDouble;

    FClientePense.EnviarLoja(Loja);

    FNotification.MessageInformation('Loja "' + MENomeLoja.Text + '" com o identificador "' + MEIdentificadorLoja.Text + '" cadastrada com sucesso!');
  finally
    Loja.Endereco.Free;
    Loja.HorarioFuncionamento.Free;
    Loja.Free;
  end;
end;

procedure TMain.EnviarTerminal;
var
  Terminal: TDadosRequisicaoTerminal;
begin
  Terminal := TDadosRequisicaoTerminal.Create;

  try
    Terminal.Nome := MeTerminalNome.Text;
    Terminal.CodigoTerminalERP := METerminalIdentificador.Text;
    Terminal.CodigoTerminalLoja := METerminalIdentificadorLoja.Text;

    FClientePense.EnviarTerminal(Terminal);

    FNotification.MessageInformation('Terminal "' + MeTerminalNome.Text + '" com o identificador "' + METerminalIdentificador.Text + '" cadastrado com sucesso!');
  finally
    Terminal.Free;
  end;
end;

procedure TMain.ListarEPreencherComboCarteiras;
var
  CarteirasString, Carteira: string;
  CarteirasArray: TArray<string>;
begin
  CBCarteiraDigitalPagamento.Clear;

  CarteirasString := FClientePense.ListarCarteiras;

  if CarteirasString.IsEmpty then
  begin
    FNotification.MessageWarning('Nenhuma carteira digital encontrada!');
    Exit
  end;

  CarteirasArray := CarteirasString.Replace('"', '').Replace('[', '').Replace(']', '').Split([',']);

  for Carteira in CarteirasArray do
    CBCarteiraDigitalPagamento.AddItem(Carteira, TObject(IndexStr(Carteira, CarteirasArray)));
end;

procedure TMain.PgcPenseBankChanging(Sender: TObject; var AllowChange: Boolean);
begin
   if PgcPenseBank.ActivePage = TSBancConfiguracoes then
   begin
      AllowChange := Self.ValidarConfiguracaoBank;
      Self.AtivarDesativarOpcoesBank(AllowChange);
   end;
end;

procedure TMain.AdicionarItensPagamento;
var
  ItemPagamento: TItemPagamento;
begin
  if not(Assigned(FItensPagamento)) then
    FItensPagamento := TCollections.CreateList<TItemPagamento>;

  ItemPagamento := TItemPagamento.Create;
  ItemPagamento.Descricao := MEDescricaoItemPagamento.Text;
  ItemPagamento.Quantidade := string(MEQuantidadeItemPagamento.Text).ToDouble;
  ItemPagamento.Valor := string(MEValorItemPagamento.Text).ToDouble;

  FItensPagamento.Add(ItemPagamento);

  FNotification.MessageInformation('Item "' + ItemPagamento.Descricao + '" adicionado com sucesso!');

  MEDescricaoItemPagamento.Clear;
  MEQuantidadeItemPagamento.Clear;
  MEValorItemPagamento.Clear;

end;

procedure TMain.AtualizarDadosConsultaPagamento(const RespostaPagamento: TDadosRespostaPagamento);
begin
  if not Assigned(RespostaPagamento) then
    Exit;

  MECodigoPagamentoAPIConsultaPagamentos.Text := RespostaPagamento.Codigo.ToString;
  MECodigoPagamentoERPConsultaPagamentos.Text := RespostaPagamento.ReferenciaExterna;
  MEQRCodeConsultaPagamentos.Text := RespostaPagamento.QrCodeURL;
  MEStatusPagamentoConsultaPagamentos.Text := RespostaPagamento.Status;

  if RespostaPagamento.UltimaAtualizacao.Contains('.') then
    LBUltimaAtualizacaoDataConsultaPagamentos.Caption := RespostaPagamento.UltimaAtualizacao.Replace('T', ' ').Split(['.'])[0];
end;

procedure TMain.AtualizarDadosConsultaPixBank(const RespostaPagamento: TDadosBankRespostaConsultaPix);
begin
  if not Assigned(RespostaPagamento) then
    Exit;

  if RespostaPagamento.Sucesso then
  begin
     LbBankUltimaAtualizacao.Caption := 'Sucesso';
     MEBankHashAPIRespostaPix.Text := RespostaPagamento.DadosBankMenssagem.Hash;
     MEBankQrCodeURLRespostaPix.Text := RespostaPagamento.DadosBankMenssagem.Qrcode;
     MEBanckCodigoPagamentoERPRespostaPix.Text := RespostaPagamento.DadosBankMenssagem.Alias;

     MeStatusRespostaPix.Clear;

     MeStatusRespostaPix.Lines.Add('idpagamento: ' +
        IntToStr(RespostaPagamento.DadosBankMenssagem.Idpagamento));

     MeStatusRespostaPix.Lines.Add('idcorrentista: ' +
        IntToStr(RespostaPagamento.DadosBankMenssagem.iIdcorrentista));

     MeStatusRespostaPix.Lines.Add('alias: ' +
        RespostaPagamento.DadosBankMenssagem.Alias);

     MeStatusRespostaPix.Lines.Add('cpfCpnj: ' +
        RespostaPagamento.DadosBankMenssagem.CpfCpnj);

     MeStatusRespostaPix.Lines.Add('nome: ' +
        RespostaPagamento.DadosBankMenssagem.Nome);

     MeStatusRespostaPix.Lines.Add('endereco: ' +
        RespostaPagamento.DadosBankMenssagem.Endereco);

     MeStatusRespostaPix.Lines.Add('cidade: ' +
        RespostaPagamento.DadosBankMenssagem.Cidade);

     MeStatusRespostaPix.Lines.Add('uf: ' +
        RespostaPagamento.DadosBankMenssagem.UF);

     MeStatusRespostaPix.Lines.Add('cep: ' +
        RespostaPagamento.DadosBankMenssagem.Cep);

     MeStatusRespostaPix.Lines.Add('email: ' +
        RespostaPagamento.DadosBankMenssagem.Email);

     MeStatusRespostaPix.Lines.Add('valor: ' +
        FloatToStr(RespostaPagamento.DadosBankMenssagem.Valor));

     MeStatusRespostaPix.Lines.Add('vencimento: ' +
        RespostaPagamento.DadosBankMenssagem.Vencimento);

     MeStatusRespostaPix.Lines.Add('multaPerc: ' +
        FloatToStr(RespostaPagamento.DadosBankMenssagem.MultaPerc));

     MeStatusRespostaPix.Lines.Add('jurosPerc: ' +
        FloatToStr(RespostaPagamento.DadosBankMenssagem.JurosPerc));

     MeStatusRespostaPix.Lines.Add('descontoPerc: ' +
        FloatToStr(RespostaPagamento.DadosBankMenssagem.DescontoPerc));

     MeStatusRespostaPix.Lines.Add('descontoData: ' +
        RespostaPagamento.DadosBankMenssagem.DescontoData);

     MeStatusRespostaPix.Lines.Add('callbackAddress: ' +
        RespostaPagamento.DadosBankMenssagem.CallBackAddress);

     MeStatusRespostaPix.Lines.Add('qrcode: ' +
        RespostaPagamento.DadosBankMenssagem.Qrcode);

     MeStatusRespostaPix.Lines.Add('dataPagamento: ' +
        RespostaPagamento.DadosBankMenssagem.DataPagamento);

     MeStatusRespostaPix.Lines.Add('valorPago: ' +
        FloatToStr(RespostaPagamento.DadosBankMenssagem.ValorPago));

     MeStatusRespostaPix.Lines.Add('tipo: ' +
        RespostaPagamento.DadosBankMenssagem.Tipo);

     MeStatusRespostaPix.Lines.Add('hash: ' +
        RespostaPagamento.DadosBankMenssagem.Hash);

     MeStatusRespostaPix.Lines.Add('materaTransactionId: ' +
        RespostaPagamento.DadosBankMenssagem.MateraTransactionId);

     MeStatusRespostaPix.Lines.Add('materaReference: ' +
        RespostaPagamento.DadosBankMenssagem.MateraReference);

     if RespostaPagamento.DadosBankMenssagem.Pago then
     begin
        MeStatusRespostaPix.Lines.Add('pago: SIM');
        MEBankStatusPagamentoRespostaPix.Text := 'Pago';
     end
     else
     begin
        MeStatusRespostaPix.Lines.Add('pago: NÂO');
        MEBankStatusPagamentoRespostaPix.Text := 'Pendente';
     end;
  end
  else
  begin
     LbBankUltimaAtualizacao.Caption := 'Sem Sucesso';
  end;
end;

procedure TMain.AtualizarValorTotalItensPagamento;
var
  ValorTotalItens: Double;
begin
  ValorTotalItens := 0.00;

  if Assigned(FItensPagamento) then
    FItensPagamento.ForEach(
      procedure(const Item: TItemPagamento)
      begin
        ValorTotalItens := ValorTotalItens + Item.Valor;
      end);

  METotalItensPagamento.Text := ValorTotalItens.ToString;
end;

procedure TMain.EnviarPagamento;
var
  DadosRequisicaoPagamento: TDadosRequisicaoPagamento;
  DadosRetornoPagamento: TDadosRespostaPagamento;
begin
  DadosRequisicaoPagamento := TDadosRequisicaoPagamento.Create;

  try
    DadosRequisicaoPagamento.Descricao := MEDescricaoPagamento.Text;
    DadosRequisicaoPagamento.CodigoPagamentoERP := MECodigoPagamentoERP.Text;

    if Assigned(FItensPagamento) then
      DadosRequisicaoPagamento.ItensPagamento := FItensPagamento.ToArray;

    DadosRequisicaoPagamento.Valor := string(MEValorPagamento.Text).ToDouble;
    DadosRequisicaoPagamento.CodigoLoja := MECodigoLojaPagamento.Text;
    DadosRequisicaoPagamento.CodigoTerminal := MECodigoTerminalPagamento.Text;
    DadosRequisicaoPagamento.CarteiraDigital := CBCarteiraDigitalPagamento.Items[CBCarteiraDigitalPagamento.ItemIndex];
    try
       DadosRetornoPagamento := FClientePense.EnviarPagamento(DadosRequisicaoPagamento);

       Self.AtualizarDadosRetornoPagamento(DadosRetornoPagamento);
       FNotification.MessageInformation('Solicitação de pagamento realizada com sucesso, um QRCode para realizar o pagamento será aberto no navegador!');
    finally
       DadosRetornoPagamento.Free;
    end;
  finally
    DadosRequisicaoPagamento.Free;
  end;
end;

procedure TMain.EnviarPixBank;
var
  DadosBankRequisicaoPix: TDadosBankRequisicaoPix;
  DadosBankRespostaPix: TDadosBankRespostaPix;
  Valor : String;
begin
  DadosBankRequisicaoPix := TDadosBankRequisicaoPix.Create;

  try
    DadosBankRequisicaoPix.CodigoERP := MEBankAliasConfiguracao.Text;

    Valor := StringReplace(MEBankValorPix.Text, ',', '.', [rfReplaceAll]);

    DadosBankRequisicaoPix.Valor := Valor;

    DadosBankRequisicaoPix.UrlRetorno := MeBankUrlRetorno.Text;
      //'https://crudcrud.com/api/9e80ceb265a34890873aad70616b5c98/teste';
    try
       DadosBankRespostaPix := FClientePense.BankEnviarPix(DadosBankRequisicaoPix);

       Self.AtualizarDadosRetornoPixBank(DadosBankRespostaPix);
       FNotification.MessageInformation('Solicitação de pagamento realizada com sucesso, um QRCode para realizar o pagamento será aberto no navegador!');
    finally
       DadosBankRespostaPix.Free;
    end;
  finally
    DadosBankRequisicaoPix.Free;
  end;
end;



procedure TMain.EnviarPixAgendadoBank;
var
  DadosBankRequisicaoPixAgendado: TDadosBankRequisicaoPixAgendado;
  DadosBankRespostaPix: TDadosBankRespostaPix;
  Valor : String;
begin
  DadosBankRequisicaoPixAgendado := TDadosBankRequisicaoPixAgendado.Create;

  try
    DadosBankRequisicaoPixAgendado.CodigoERP := MEBankAliasConfiguracao.Text;

    Valor := StringReplace(MEBankValorPix.Text, ',', '.', [rfReplaceAll]);

    DadosBankRequisicaoPixAgendado.Valor := Valor;

    DadosBankRequisicaoPixAgendado.DataAgendamento := MeBankDataAgendamento.Text;

    Valor := StringReplace(MeBankPercentualJuros.Text, ',', '.', [rfReplaceAll]);
    DadosBankRequisicaoPixAgendado.PercentualJuros := Valor;
    Valor := StringReplace(MeBankPercentualMulta.Text, ',', '.', [rfReplaceAll]);
    DadosBankRequisicaoPixAgendado.PercentualMulta := Valor;
    Valor := StringReplace(MeBankPercentualDesconto.Text, ',', '.', [rfReplaceAll]);

    DadosBankRequisicaoPixAgendado.DadosBankDesconto.DataLimite := MeBankValidadeDesconto.Text;
    DadosBankRequisicaoPixAgendado.DadosBankDesconto.Percentual := Valor;

    DadosBankRequisicaoPixAgendado.DadosBankPagador.Nome := MEBankNome.Text;
    DadosBankRequisicaoPixAgendado.DadosBankPagador.CpfCpnj :=MeBankCpfCnpj.Text;
    DadosBankRequisicaoPixAgendado.DadosBankPagador.DadosBankEndereco.Logradouro := MeBankLogradouro.Text;
    DadosBankRequisicaoPixAgendado.DadosBankPagador.DadosBankEndereco.Cidade := MeBankCidade.Text;
    DadosBankRequisicaoPixAgendado.DadosBankPagador.DadosBankEndereco.Cep := MeBankCep.Text;
    DadosBankRequisicaoPixAgendado.DadosBankPagador.DadosBankEndereco.Uf := MeBankUf.Text;

    DadosBankRequisicaoPixAgendado.UrlRetorno := MeBankUrlRetorno.Text;
      //'https://crudcrud.com/api/9e80ceb265a34890873aad70616b5c98/teste';
    try
       DadosBankRespostaPix := FClientePense.BankEnviarPixAgendado(DadosBankRequisicaoPixAgendado);

       Self.AtualizarDadosRetornoPixBank(DadosBankRespostaPix);
       FNotification.MessageInformation('Solicitação de pagamento realizada com sucesso, um QRCode para realizar o pagamento será aberto no navegador!');
    finally
       DadosBankRespostaPix.Free;
    end;
  finally
    DadosBankRequisicaoPixAgendado.Free;
  end;
end;

procedure TMain.AtualizarDadosRetornoPagamento(const RespostaPagamento: TDadosRespostaPagamento);
begin
  if not Assigned(RespostaPagamento) then
    Exit;

  MECodigoPagamentoAPIRespostaPagamento.Text := RespostaPagamento.Codigo.ToString;
  MECodigoPagamentoERPRespostaPagamento.Text := RespostaPagamento.ReferenciaExterna;
  MEQrCodeURLRespostaPagamento.Text := RespostaPagamento.QrCodeURL;
  MEStatusPagamentoRespostaPagamento.Text := RespostaPagamento.Status;

  if RespostaPagamento.UltimaAtualizacao.Contains('.') then
    LBUltimaAtualizacaoPagamentoRespostaData.Caption := RespostaPagamento.UltimaAtualizacao.Replace('T', ' ').Split(['.'])[0];
end;


procedure TMain.AtualizarDadosRetornoPixBank(const RespostaPagamento: TDadosBankRespostaPix);
begin
  if not Assigned(RespostaPagamento) then
    Exit;

  if RespostaPagamento.Sucesso then
  begin
     LbBankUltimaAtualizacao.Caption := 'Sucesso';
     MEBankHashAPIRespostaPix.Text := RespostaPagamento.DadosBankMenssagem.Hash;
     MEBankQrCodeURLRespostaPix.Text := RespostaPagamento.DadosBankMenssagem.Qrcode;
  end
  else
  begin
     LbBankUltimaAtualizacao.Caption := 'Sem Sucesso';
  end;
end;


procedure TMain.DeletarPagamento;
begin
  if string(MECodigoPagamentoAPIConsultaPagamentos.Text).IsEmpty then
  begin
    FNotification.BalloonWarning(MECodigoPagamentoAPIConsultaPagamentos, MSG_CAMPO_OBRIGATORIO);
    Abort;
  end;

  if not(FNotification.ShowQuestion('Deseja deletar o pagamento com código de API: ' + string(MECodigoPagamentoAPIConsultaPagamentos.Text))) then
    Exit;

  FClientePense.DeletarPagamento(string(MECodigoPagamentoAPIConsultaPagamentos.Text).ToInteger);
end;

procedure TMain.LimparItensPagamento;
begin
  if not Assigned(FItensPagamento) then
    Exit;

  FItensPagamento.Clear;
  FItensPagamento := nil;
end;

procedure TMain.AbrirQrCodeNavegador(const QrCodeEdit: TEdit);
begin
  if string(QrCodeEdit.Text).IsEmpty then
  begin
    FNotification.MessageWarning('Link do QrCode não preenchido!');
    Abort;
  end;

  Self.AbrirURLNavegadorPadrao(QrCodeEdit.Text);
end;

procedure TMain.AbrirURLNavegadorPadrao(const URL: string);
begin
  ShellExecute(Handle, 'open', PWideChar(URL), nil, nil, SW_SHOWNORMAL);
end;

procedure TMain.ValidarConfiguracao;
begin
  if string(MEBaseURLConfiguracao.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MEBaseURLConfiguracao);

  if string(MEClientIDConfiguracao.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MEClientIDConfiguracao);

  if string(MEAccessKeyConfiguracao.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MEAccessKeyConfiguracao);

  if FNotification.WhenHasNotificationShowAndClear then
    Abort;
end;

function TMain.ValidarConfiguracaoBank : Boolean;
begin
  result := False;

  if string(MEBankBaseURLConfiguracao.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MEBankBaseURLConfiguracao);

  if string(MEBankBearerConfiguracao.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MEBankBearerConfiguracao);

  if FNotification.WhenHasNotificationShowAndClear then
    exit;

  Result := True;
end;

procedure TMain.ValidarDadosPagamento;
begin
  if string(MEDescricaoPagamento.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MEDescricaoPagamento);

  if string(MECodigoPagamentoERP.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MECodigoPagamentoERP);

  if string(MECodigoLojaPagamento.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MECodigoLojaPagamento);

  if string(MECodigoTerminalPagamento.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MECodigoTerminalPagamento);

  if string(MEValorPagamento.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MEValorPagamento);

  if not(string(MEValorPagamento.Text).IsEmpty) then
    if string(MEValorPagamento.Text).ToDouble <= 0 then
      FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MEValorPagamento);

  if Assigned(FItensPagamento) then
    if string(METotalItensPagamento.Text).ToDouble <> string(MEValorPagamento.Text).ToDouble then
      FNotification.AddNotification(MSG_VALOR_ITENS_DIFERE_TOTAL, MEValorPagamento);

  if CBCarteiraDigitalPagamento.Items[CBCarteiraDigitalPagamento.ItemIndex].IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, CBCarteiraDigitalPagamento);

  if FNotification.WhenHasNotificationShowAndClear then
    Abort;
end;

procedure TMain.ValidarDadosPixBank;
begin
  if string(MEBankAliasConfiguracao.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MEBankAliasConfiguracao);

  if not(string(MEBankValorPix.Text).IsEmpty) then
    if string(MEBankValorPix.Text).ToDouble <= 0 then
      FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MEBankValorPix);

  if FNotification.WhenHasNotificationShowAndClear then
    Abort;
end;

procedure TMain.ValidarDadosPixAgendadoBank;
begin
  if string(MEBankAliasConfiguracao.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MEBankAliasConfiguracao);

  if not(string(MEBankValorPix.Text).IsEmpty) then
    if string(MEBankValorPix.Text).ToDouble <= 0 then
      FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MEBankValorPix);

  if string(MeBankDataAgendamento.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MeBankDataAgendamento);

  if not(string(MeBankPercentualJuros.Text).IsEmpty) then
    if string(MeBankPercentualJuros.Text).ToDouble <= 0 then
      FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MeBankPercentualJuros);

  if not(string(MeBankPercentualMulta.Text).IsEmpty) then
    if string(MeBankPercentualMulta.Text).ToDouble <= 0 then
      FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MeBankPercentualMulta);

  if not(string(MeBankPercentualDesconto.Text).IsEmpty) then
    if string(MeBankPercentualDesconto.Text).ToDouble <= 0 then
      FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MeBankPercentualDesconto);

  if string(MeBankValidadeDesconto.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MeBankValidadeDesconto);

  if string(MEBankNome.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MEBankNome);

  if string(MeBankCpfCnpj.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MeBankCpfCnpj);

  if string(MeBankLogradouro.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MeBankLogradouro);

  if string(MeBankCidade.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MeBankCidade);

  if string(MeBankCep.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MeBankCep);

  if string(MeBankUf.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MeBankUf);

  if FNotification.WhenHasNotificationShowAndClear then
    Abort;
end;



procedure TMain.ValidarItensPagamento;
begin
  if string(MEDescricaoItemPagamento.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MEDescricaoItemPagamento);

  if string(MEValorItemPagamento.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MEValorItemPagamento);

  if not(string(MEValorItemPagamento.Text).IsEmpty) then
    if string(MEValorItemPagamento.Text).ToDouble <= 0 then
      FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MEValorItemPagamento);

  if string(MEQuantidadeItemPagamento.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MEQuantidadeItemPagamento);

  if not(string(MEQuantidadeItemPagamento.Text).IsEmpty) then
    if string(MEQuantidadeItemPagamento.Text).ToDouble <= 0 then
      FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MEQuantidadeItemPagamento);

  if FNotification.WhenHasNotificationShowAndClear then
    Abort;
end;

procedure TMain.ValidarLoja;
begin
  if string(MENomeLoja.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MENomeLoja);

  if string(MEIdentificadorLoja.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MEIdentificadorLoja);

  if string(MENumeroLoja.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MENumeroLoja);

  if string(MENomeFantasia.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MENomeFantasia);

  if string(MECNPJ.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MECNPJ);

  if string(MELogradouroLoja.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MELogradouroLoja);

  if string(MECidadeLoja.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MECidadeLoja);

  if string(MERefernciaLoja.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MERefernciaLoja);

  if string(MENomeEstadoLoja.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MENomeEstadoLoja);

  if string(MELatitude.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MELatitude);

  if not(string(MELatitude.Text).IsEmpty) then
    if string(MELatitude.Text).ToDouble = 0 then
      FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MELatitude);

  if string(MELongitude.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MELongitude);

  if not(string(MELongitude.Text).IsEmpty) then
    if string(MELongitude.Text).ToDouble = 0 then
      FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, MELongitude);

  if FNotification.WhenHasNotificationShowAndClear then
    Abort;
end;

procedure TMain.ValidarTerminal;
begin
  if string(METerminalNome.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, METerminalNome);

  if string(METerminalIdentificador.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, METerminalIdentificador);

  if string(METerminalIdentificadorLoja.Text).IsEmpty then
    FNotification.AddNotification(MSG_CAMPO_OBRIGATORIO, METerminalIdentificadorLoja);

  if FNotification.WhenHasNotificationShowAndClear then
    Abort;
end;

procedure TMain.BtExibeQrCodeClick(Sender: TObject);
begin
  if string(MEQRCodeConsultaPagamentos.Text).IsEmpty then
  begin
    FNotification.BalloonWarning(MEQRCodeConsultaPagamentos, MSG_CAMPO_OBRIGATORIO);
    Abort;
  end;
  ExibeQrCode(MEQRCodeConsultaPagamentos.Text);
end;

procedure TMain.WebBrowserQrCodeDocumentComplete(ASender: TObject;
  const pDisp: IDispatch; const URL: OleVariant);
begin
  WebBrowserQrCode.OleObject.document.body.style.overflowX := 'hidden';
  WebBrowserQrCode.OleObject.document.body.style.overflowY := 'hidden';
end;

procedure TMain.ExibeQrCode(const UrlQrCode : String);
var PaginaHtml : TStringList;
    Url : String;
begin
   PaginaHtml := TStringList.Create;
   try
      WebBrowserQrCode.Navigate('');
      DeleteFile('c:\BaseQrCode.Html');
      //PaginaHtml.Add('<!DOCTYPE html>');
      PaginaHtml.Add('<html">');
      //PaginaHtml.Add('<head>');
      //PaginaHtml.Add('<meta charset="UTF-8"/>');
      //PaginaHtml.Add('<title>Document</title>');
      //PaginaHtml.Add('</head>');
      //PaginaHtml.Add('<body width="241px" height="241px" >');
      PaginaHtml.Add('<body>');
      //PaginaHtml.Add('<!-- Conteúdo -->');
      if trim(UrlQrCode) <> '' then
      begin
         PaginaHtml.Add('<img width="230px" height="230px" src="EnderecoPagina">');
      end;
      PaginaHtml.Add('</img>');
      PaginaHtml.Add('</body>');
      PaginaHtml.Add('</html>');
      //
      PaginaHtml.Text := StringReplace(PaginaHtml.Text,'EnderecoPagina',UrlQrCode,[rfReplaceAll]);
      PaginaHtml.SaveToFile('c:\BaseQrCode.Html');
      Sleep(200);
      //
      Url := 'c:\BaseQrCode.Html';
      WebBrowserQrCode.Visible := True;
      WebBrowserQrCode.Navigate(Url);
      PnlQrCode.Visible := True;
   finally
      PaginaHtml.Clear;
      PaginaHtml.Free;
   end;
end;


end.




procedure TMain.Button1Click(Sender: TObject);
//const
//  CAMINHOIMAGEM = 'http://www.chart.com.br/imagens/bkgrnd_greydots.jpg';
//var
//  LJsonObj,AJsonSubObj : TJSONObject;
//  AJsonPair, AJsonSubPair: TJSONPair;
//  AJsonArray: TJSONArray;
//  J, I, nC: Integer;
//  StringJSON,imgURL: String;
//  LItem: TListBoxItem;
//  TM: TMemoryStream;
//  HTTP : TIdHttp;
//  imgItem: TImage;
//  lTexto: TLabel;
begin
//  imgURL := CAMINHOIMAGEM;
//  nC := Length(Trim(imgURL));
//  if (nC > 4) then
//  begin
//    try
//      TM := TMemoryStream.Create;
//      TM.Clear;
//      try
//        imgHttp.Get(imgURL,TM);
//      except
//        on E: EIdHTTPProtocolException do
//          if E.Message <> 'HTTP/1.1 404 Not Found' then
//            ShowMessage(E.Message);
//      end;
//      {LItem.ItemData.Bitmap.LoadFromStream(TM);
//      LItem.ItemData.Bitmap.Resize(120,72);  }
//      imgItem := TImage.Create(lstPorCidade);
//      imgItem.Name := 'img'+IntToStr(J)+'n'+IntToStr(I);
//      imgItem.Parent := LItem;
//      imgItem.Height := 72;
//      imgItem.Width  := 120;
//      imgItem.Position.X := 5;
//      imgItem.Bitmap.LoadFromStream(TM);
//      LItem.Height := 75;
//    finally
//      TM.Free;
//    end;
//  end;
end;

