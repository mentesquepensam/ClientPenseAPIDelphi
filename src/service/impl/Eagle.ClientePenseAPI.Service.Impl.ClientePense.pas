unit Eagle.ClientePenseAPI.Service.Impl.ClientePense;

interface

uses
  System.SysUtils, System.Classes,

  XSuperObject, XSuperJSON,

  Spring.Container,
  Spring.Collections,
  Spring.Container.Common,

  Eagle.Core.Http.RestClient,
  Eagle.Core.Http.HttpResponse,

  Eagle.ClientePenseAPI.Model.Requisicao.DadosAutenticacao,
  Eagle.ClientePenseAPI.Model.Requisicao.DadosLoja,
  Eagle.ClientePenseAPI.Model.Requisicao.DadosTerminal,
  Eagle.ClientePenseAPI.Model.Requisicao.DadosPagamento,
  Eagle.ClientePenseAPI.Model.Requisicao.BankDadosPix,

  Eagle.ClientePenseAPI.Model.Resposta.DadosAutenticacao,
  Eagle.ClientePenseAPI.Model.Resposta.DadosPagamento,
  Eagle.ClientePenseAPI.Model.Resposta.BankDadosPix,
  Eagle.ClientePenseAPI.Model.Resposta.DadosErro,
  Eagle.ClientePenseAPI.Model.Resposta.BankDadosErro,
  Eagle.ClientePenseAPI.Model.Resposta.BankDadosConsultaPix,

  Eagle.ClientePenseAPI.Util.GeradorLog,

  Eagle.ClientePenseAPI.Service.ClientePense,
  Eagle.ClientePenseAPI.Util.Tipos;

type
  TClientePense = class(TInterfacedObject, IClientePense)
  private

    FRestClient: IRestClient;
    FBearerToken: string;
    FNomeApi : string;

    function ConverterItensPagamentoVazioParaNull(const PagamentoJSON: string): string;
    procedure TratarError(const CodigoErro: Integer; const ErroMensage: string);

    function GetBearerToken: string;
    function GetNomeApi: string;

    function MontarHeadersDaRequisicao: IDictionary<string, string>;
  public
    constructor Create(const pBaseUrl : String; const pNomeApi : String = PENSE_API; const pBearerToken : String = '');

    function RealizarAutenticacaoCliente(const DadosAutenticacao: TDadosRequisicaoAutenticacao): TDadosRespostaAutenticacao;

    function EnviarLoja(const Loja: TDadosRequisicaoLoja): string;
    function EnviarTerminal(const Terminal: TDadosRequisicaoTerminal): string;
    function EnviarPagamento(const Pagamento: TDadosRequisicaoPagamento): TDadosRespostaPagamento;

    function BankEnviarPix(const Pix: TDadosBankRequisicaoPix): TDadosBankRespostaPix;
    function BankEnviarPixAgendado(const Pix: TDadosBankRequisicaoPixAgendado): TDadosBankRespostaPix;

    function ListarCarteiras: string;
    function ConsultarPagamentoPeloCodigoAPI(const CodigoPagamentoAPI: Integer): TDadosRespostaPagamento;
    function ConsultarPagamentoPelaCodigoERP(const CodigoPagamentoERP: string): TDadosRespostaPagamento;

    function BanckConsultarPixPeloHash(const CodigoHash: string): TDadosBankRespostaConsultaPix;
    function BanckConsultarQrcodePeloHash(const CodigoHash: string): TMemoryStream;

    procedure DeletarPagamento(const CodigoPagamentoAPI: Integer);

    property BearerToken: string read GetBearerToken;
    property NomeApi: string read GetNomeApi;
  end;

const
  INICIO_RETORNOS_COM_SUCESSO = '2';

implementation

constructor TClientePense.Create(const pBaseUrl : String; const pNomeApi : String = PENSE_API; const pBearerToken : String = '');
begin
  FRestClient := GlobalContainer.Resolve<IRestClient>([pBaseURL]);

  FNomeApi := pNomeApi;

  if not pBearerToken.IsEmpty then
  begin
     FBearerToken := pBearerToken;
     FRestClient.ConfigurarHeaders(Self.MontarHeadersDaRequisicao);
  end;

end;

function TClientePense.RealizarAutenticacaoCliente(const DadosAutenticacao: TDadosRequisicaoAutenticacao): TDadosRespostaAutenticacao;
const
  RECURSO_AUTENTICACAO = '/api/Auth';
var
  Resposta: IHttpResponse;
  CorpoRequisicao: string;
begin
  CorpoRequisicao := TJson.Stringify<TDadosRequisicaoAutenticacao>(DadosAutenticacao);
  TGeradorLog.AdicionarLog('Requisicao: Rota: ' + RECURSO_AUTENTICACAO + ' Corpo: ' + CorpoRequisicao);

  Resposta := FRestClient.Post(RECURSO_AUTENTICACAO, CorpoRequisicao);

  if Resposta.Codigo <> 200 then
    Self.TratarError(Resposta.Codigo, Resposta.ErrorMensage);

  TGeradorLog.AdicionarLog('Resposta: Codigo: ' + Resposta.Codigo.ToString + ' Corpo: ' + Resposta.Body);

  Result := TJson.Parse<TDadosRespostaAutenticacao>(Resposta.Body);

  FBearerToken := Result.TokenAcesso;

  FRestClient.ConfigurarHeaders(Self.MontarHeadersDaRequisicao);
end;

function TClientePense.EnviarLoja(const Loja: TDadosRequisicaoLoja): string;
const
  RECURSO_LOJA = '/api/Config/Store';
var
  Resposta: IHttpResponse;
  CorpoRequisicao: string;
begin
  CorpoRequisicao := TJson.Stringify<TDadosRequisicaoLoja>(Loja);

  TGeradorLog.AdicionarLog('Requisicao: Rota: ' + RECURSO_LOJA + ' Corpo: ' + CorpoRequisicao);

  Resposta := FRestClient.Post(RECURSO_LOJA, CorpoRequisicao);

  if Resposta.Codigo <> 200 then
    Self.TratarError(Resposta.Codigo, Resposta.ErrorMensage);

  TGeradorLog.AdicionarLog('Resposta: Codigo: ' + Resposta.Codigo.ToString + ' Corpo: ' + Resposta.Body);

  Result := Resposta.Body;
end;

function TClientePense.EnviarTerminal(const Terminal: TDadosRequisicaoTerminal): string;
const
  RECURSO_TERMINAL = '/api/Config/Pdv';
var
  Resposta: IHttpResponse;
  CorpoRequisicao: string;
begin
  CorpoRequisicao := TJson.Stringify<TDadosRequisicaoTerminal>(Terminal);

  TGeradorLog.AdicionarLog('Requisicao: Rota: ' + RECURSO_TERMINAL + ' Corpo: ' + CorpoRequisicao);

  Resposta := FRestClient.Post(RECURSO_TERMINAL, CorpoRequisicao);

  if Resposta.Codigo <> 200 then
    Self.TratarError(Resposta.Codigo, Resposta.ErrorMensage);

  TGeradorLog.AdicionarLog('Resposta: Codigo: ' + Resposta.Codigo.ToString + ' Corpo: ' + Resposta.Body);

  Result := Resposta.Body;
end;

function TClientePense.EnviarPagamento(const Pagamento: TDadosRequisicaoPagamento): TDadosRespostaPagamento;
const
  RECURSO_PAGAMENTO = '/api/Payment';
var
  Resposta: IHttpResponse;
  CorpoRequisicao: string;
begin
  CorpoRequisicao := TJson.Stringify<TDadosRequisicaoPagamento>(Pagamento);

  CorpoRequisicao := ConverterItensPagamentoVazioParaNull(CorpoRequisicao);

  TGeradorLog.AdicionarLog('Requisicao: Rota: ' + RECURSO_PAGAMENTO + ' Corpo: ' + CorpoRequisicao);

  Resposta := FRestClient.Post(RECURSO_PAGAMENTO, CorpoRequisicao);

  if Resposta.Codigo <> 201 then
    Self.TratarError(Resposta.Codigo, Resposta.ErrorMensage);

  TGeradorLog.AdicionarLog('Resposta: Codigo: ' + Resposta.Codigo.ToString + ' Corpo: ' + Resposta.Body);

  Result := TJson.Parse<TDadosRespostaPagamento>(Resposta.Body);
end;

function TClientePense.ConsultarPagamentoPeloCodigoAPI(const CodigoPagamentoAPI: Integer): TDadosRespostaPagamento;
const
  RECURSO_CONSULTA_PAGAMENTO = '/api/Payment/%d';
var
  Resposta: IHttpResponse;
  Requisicao: string;
begin

  Requisicao := Format(RECURSO_CONSULTA_PAGAMENTO, [CodigoPagamentoAPI]);

  TGeradorLog.AdicionarLog('Requisicao: Rota: ' + RECURSO_CONSULTA_PAGAMENTO + ' Requisicao: ' + Requisicao);

  Resposta := FRestClient.Get(Requisicao);

  if Resposta.Codigo <> 200 then
    Self.TratarError(Resposta.Codigo, Resposta.ErrorMensage);

  TGeradorLog.AdicionarLog('Resposta: Codigo: ' + Resposta.Codigo.ToString + ' Corpo: ' + Resposta.Body);

  Result := TJson.Parse<TDadosRespostaPagamento>(Resposta.Body);
end;

function TClientePense.BanckConsultarPixPeloHash(const CodigoHash: string): TDadosBankRespostaConsultaPix;
const
  RECURSO_CONSULTA_PAGAMENTO = '/Payment/';
var
  Resposta: IHttpResponse;
  Requisicao: string;
begin
  Requisicao := RECURSO_CONSULTA_PAGAMENTO+CodigoHash;
  TGeradorLog.AdicionarLog('Requisicao Bank Pix: Rota: ' + RECURSO_CONSULTA_PAGAMENTO + ' Requisicao: ' + Requisicao);
  Resposta := FRestClient.Get(Requisicao);

  if Resposta.Codigo <> 201 then
    Self.TratarError(Resposta.Codigo, Resposta.ErrorMensage);

  TGeradorLog.AdicionarLog('Resposta Bank Pix: Codigo: ' + Resposta.Codigo.ToString + ' Corpo: ' + Resposta.Body);

  Result := TJson.Parse<TDadosBankRespostaConsultaPix>(Resposta.Body);
end;

function TClientePense.BanckConsultarQrcodePeloHash(const CodigoHash: string): TMemoryStream;
const
  RECURSO_CONSULTA_PAGAMENTO = '/QRCode/';
var
  //Resposta: IHttpResponse;
  Requisicao: string;
begin
  Requisicao := RECURSO_CONSULTA_PAGAMENTO+CodigoHash;
  TGeradorLog.AdicionarLog('Requisicao Bank Pix: Rota: ' + RECURSO_CONSULTA_PAGAMENTO + ' Requisicao: ' + Requisicao);

  Result := FRestClient.GetImg(Requisicao);

  //if Resposta.Codigo <> 201 then
  //  Self.TratarError(Resposta.Codigo, Resposta.ErrorMensage);
  //
  TGeradorLog.AdicionarLog('Resposta Bank Pix: QRCode Lido: QtdBytes :'+ IntToStr(Result.Size));
  //
  //Result := TJson.Parse<TDadosBankRespostaConsultaPix>(Resposta.Body);
end;

function TClientePense.BankEnviarPix(const Pix: TDadosBankRequisicaoPix): TDadosBankRespostaPix;
const
  RECURSO_PAGAMENTO = '/Pix';
var
  Resposta: IHttpResponse;
  CorpoRequisicao: string;
begin
  CorpoRequisicao := TJson.Stringify<TDadosBankRequisicaoPix>(Pix);

  TGeradorLog.AdicionarLog('Requisicao Bank Pix: Rota: ' + RECURSO_PAGAMENTO + ' Corpo: ' + CorpoRequisicao);

  Resposta := FRestClient.Post(RECURSO_PAGAMENTO, CorpoRequisicao);

  if Resposta.Codigo <> 201 then
    Self.TratarError(Resposta.Codigo, Resposta.ErrorMensage);

  TGeradorLog.AdicionarLog('Resposta Bank Pix: Codigo: ' + Resposta.Codigo.ToString + ' Corpo: ' + Resposta.Body);

  Result := TJson.Parse<TDadosBankRespostaPix>(Resposta.Body);
end;

function TClientePense.BankEnviarPixAgendado(const Pix: TDadosBankRequisicaoPixAgendado): TDadosBankRespostaPix;
const
  RECURSO_PAGAMENTO = '/ScheduledPix';
var
  Resposta: IHttpResponse;
  CorpoRequisicao: string;
begin
  CorpoRequisicao := TJson.Stringify<TDadosBankRequisicaoPixAgendado>(Pix);

  TGeradorLog.AdicionarLog('Requisicao Bank Pix Agendado: Rota: ' + RECURSO_PAGAMENTO + ' Corpo: ' + CorpoRequisicao);

  Resposta := FRestClient.Post(RECURSO_PAGAMENTO, CorpoRequisicao);

  if Resposta.Codigo <> 201 then
    Self.TratarError(Resposta.Codigo, Resposta.ErrorMensage);

  TGeradorLog.AdicionarLog('Resposta Bank Pix Agendado: Codigo: ' + Resposta.Codigo.ToString + ' Corpo: ' + Resposta.Body);

  Result := TJson.Parse<TDadosBankRespostaPix>(Resposta.Body);
end;

function TClientePense.ConsultarPagamentoPelaCodigoERP(const CodigoPagamentoERP: string): TDadosRespostaPagamento;
const
  RECURSO_CONSULTA_PAGAMENTO = '/api/Payment/ByExternalReference/%s';
var
  Resposta: IHttpResponse;
  Requisicao: string;
begin
  Requisicao := Format(RECURSO_CONSULTA_PAGAMENTO, [CodigoPagamentoERP]);
  TGeradorLog.AdicionarLog('Requisicao: Rota: ' + RECURSO_CONSULTA_PAGAMENTO + ' Requisicao: ' + Requisicao);

  Resposta := FRestClient.Get(Requisicao);

  if Resposta.Codigo <> 200 then
    Self.TratarError(Resposta.Codigo, Resposta.ErrorMensage);

  TGeradorLog.AdicionarLog('Resposta: Codigo: ' + Resposta.Codigo.ToString + ' Corpo: ' + Resposta.Body);

  Result := TJson.Parse<TDadosRespostaPagamento>(Resposta.Body);
end;

procedure TClientePense.DeletarPagamento(const CodigoPagamentoAPI: Integer);
const
  RECURSO_DELETA_PAGAMENTO = '/api/Payment/%d';
var
  Resposta: IHttpResponse;
  Requisicao: string;
begin

  Requisicao := Format(RECURSO_DELETA_PAGAMENTO, [CodigoPagamentoAPI]);

  TGeradorLog.AdicionarLog('Requisicao: Rota: ' + RECURSO_DELETA_PAGAMENTO + ' Requisicao: ' + Requisicao);

  Resposta := FRestClient.Delete(Requisicao);

  if Resposta.Codigo <> 200 then
    Self.TratarError(Resposta.Codigo, Resposta.ErrorMensage);

  TGeradorLog.AdicionarLog('Resposta: Codigo: ' + Resposta.Codigo.ToString + ' Corpo: ' + Resposta.Body);
end;

function TClientePense.ListarCarteiras: string;
const
  RECURSO_CARTEIRAS = '/api/Wallet';
var
  Resposta: IHttpResponse;
begin
  TGeradorLog.AdicionarLog('Requisicao: Rota: ' + RECURSO_CARTEIRAS + ' Requisicao: ' + RECURSO_CARTEIRAS);

  Resposta := FRestClient.Get(RECURSO_CARTEIRAS);

  if Resposta.Codigo <> 200 then
    Self.TratarError(Resposta.Codigo, Resposta.ErrorMensage);

  TGeradorLog.AdicionarLog('Resposta: Codigo: ' + Resposta.Codigo.ToString + ' Corpo: ' + Resposta.Body);

  Result := Resposta.Body;
end;

function TClientePense.ConverterItensPagamentoVazioParaNull(const PagamentoJSON: string): string;
const
  ITENS_PAGAMENTO_VAZIO = '"items":[]';
  ITENS_PAGAMENTO_NULL = '"items":null';
begin
  if not(PagamentoJSON.Contains(ITENS_PAGAMENTO_VAZIO)) then
    Exit(PagamentoJSON);

  Result := PagamentoJSON.Replace(ITENS_PAGAMENTO_VAZIO, ITENS_PAGAMENTO_NULL);
end;

function TClientePense.MontarHeadersDaRequisicao: IDictionary<string, string>;
const
  BEARER = 'Bearer ';
var
  Chave : string;
  Headers: IDictionary<string, string>;
begin
  Chave := 'authorization';

  if FNomeApi.Equals(PENSE_BANK_API) then
  begin
     Chave := 'AUTHORIZATION';
  end;

  Headers := TCollections.CreateDictionary<string, string>;
  Headers.AddOrSetValue(Chave, BEARER + FBearerToken);
  Result := Headers;
end;

procedure TClientePense.TratarError(const CodigoErro: Integer; const ErroMensage: string);
const
  INICIO_CODIGOS_DE_SUCESSO = '2';
  MSG_ERRO_BASE = 'Ocorreu uma falha ao contatar o servidor MQP' + #13 + #13 + 'Código: %d' + #13 + 'Mensagem: %s';
  MSG_BASE = #13 + 'Tipo: %d - %s' + #13 + 'Titulo: %s' + #13 + 'Descrição: %s';
  MSG_BASE_BANK = #13 + 'Descrição: %s';
var
  Mensagem: string;
  DadosRespostaErro: TDadosRespostaErro;
  BanckDadosRespostaErro: TBanckDadosRespostaErro;
  //
  //testa se e´ a versao do delphi Xe7
  {$IFDEF VER280}
  function StartsText(const ASubText, AText: string): Boolean;
  const Empty = '';
  begin
     if ASubText = Empty then
        Result := True
     else
     begin
       if (AText.Length >= ASubText.Length) then
          Result := AnsiStrLIComp(PChar(ASubText), PChar(AText), ASubText.Length) = 0
       else
          Result := False;
     end;
  end;
  {$ENDIF}

begin
  TGeradorLog.AdicionarLog('Resposta: Codigo: ' + CodigoErro.ToString + ' Corpo: ' + ErroMensage);

  if {$IFNDEF VER280}CodigoErro.ToString.{$ENDIF}StartsText(INICIO_CODIGOS_DE_SUCESSO, CodigoErro.ToString) then
    Exit;

  BanckDadosRespostaErro := nil;
  DadosRespostaErro := nil;

  if FNomeApi.Equals(PENSE_BANK_API) then
  begin
     BanckDadosRespostaErro := TJson.Parse<TBanckDadosRespostaErro>(ErroMensage);
  end
  else
  begin
     DadosRespostaErro := TJson.Parse<TDadosRespostaErro>(ErroMensage);
  end;

  if Assigned(DadosRespostaErro) then
  begin
     Mensagem := Format(MSG_BASE, [DadosRespostaErro.Codigo, DadosRespostaErro.Tipo, DadosRespostaErro.Titulo, DadosRespostaErro.Descricao]);
  end
  else
  if Assigned(BanckDadosRespostaErro) then
  begin
     Mensagem := Format(MSG_BASE_BANK, [BanckDadosRespostaErro.Mensagem]);
  end
  else
  begin
    case CodigoErro of
      400:
        Mensagem := 'Bad Request - Requisição invalida, verifique os campos preenchidos!';

      401:
        Mensagem := 'Unauthorized - Cliente não autorizado verifique a validade das informações inseridas ou atualize o token de autenticação!';

      404:
        Mensagem := 'Not Found - O recurso da requisição não foi encontrado, contate o suporte!';

      500:
        Mensagem := 'Internal Server Error - Erro interno no servidor, verifique os campos preenchidos e contate o suporte!';
    else
      Mensagem := 'Erro não mapeado contate o suporte!';
    end;
  end;

  raise EClientePenseException.Create(Format(MSG_ERRO_BASE, [CodigoErro, Mensagem]));
end;

function TClientePense.GetBearerToken: string;
begin
  Result := FBearerToken;
end;

function TClientePense.GetNomeApi: string;
begin
  Result := FNomeApi;
end;

initialization

GlobalContainer.RegisterType<TClientePense>.Implements<IClientePense>;

end.
