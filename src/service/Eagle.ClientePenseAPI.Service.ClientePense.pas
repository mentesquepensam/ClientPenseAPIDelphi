unit Eagle.ClientePenseAPI.Service.ClientePense;

interface

uses
  System.SysUtils,

  System.Classes,

  Eagle.ClientePenseAPI.Model.Requisicao.DadosAutenticacao,
  Eagle.ClientePenseAPI.Model.Requisicao.DadosPagamento,
  Eagle.ClientePenseAPI.Model.Requisicao.DadosLoja,
  Eagle.ClientePenseAPI.Model.Requisicao.DadosTerminal,
  Eagle.ClientePenseAPI.Model.Requisicao.BankDadosPix,

  Eagle.ClientePenseAPI.Model.Resposta.DadosAutenticacao,
  Eagle.ClientePenseAPI.Model.Resposta.DadosPagamento,
  Eagle.ClientePenseAPI.Model.Resposta.BankDadosPix,
  Eagle.ClientePenseAPI.Model.Resposta.BankDadosConsultaPix;

type
  EClientePenseException = class(Exception);

  IClientePense = interface(IInvokable)
    ['{1620EFA5-F78D-4E89-805C-FAA3E6D27F42}']

    function GetBearerToken: string;

    function RealizarAutenticacaoCliente(const DadosAutenticacao: TDadosRequisicaoAutenticacao): TDadosRespostaAutenticacao;

    function EnviarPagamento(const Pagamento: TDadosRequisicaoPagamento): TDadosRespostaPagamento;
    function EnviarLoja(const Loja: TDadosRequisicaoLoja): string;
    function EnviarTerminal(const Terminal: TDadosRequisicaoTerminal): string;

    function BankEnviarPix(const Pix: TDadosBankRequisicaoPix): TDadosBankRespostaPix;
    function BankEnviarPixAgendado(const Pix: TDadosBankRequisicaoPixAgendado): TDadosBankRespostaPix;

    function ListarCarteiras: string;
    function ConsultarPagamentoPeloCodigoAPI(const CodigoAPI: Integer): TDadosRespostaPagamento;
    function ConsultarPagamentoPelaCodigoERP(const CodigoERP: string): TDadosRespostaPagamento;

    function BanckConsultarPixPeloHash(const CodigoHash: string): TDadosBankRespostaConsultaPix;
    function BanckConsultarQrcodePeloHash(const CodigoHash: string): TMemoryStream;

    procedure DeletarPagamento(const CodigoPagamentoAPI: Integer);

    property BearerToken: string read GetBearerToken;

  end;

implementation

end.
