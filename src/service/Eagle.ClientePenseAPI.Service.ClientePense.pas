unit Eagle.ClientePenseAPI.Service.ClientePense;

interface

uses
  System.SysUtils,

  Eagle.ClientePenseAPI.Model.Requisicao.DadosAutenticacao,
  Eagle.ClientePenseAPI.Model.Requisicao.DadosPagamento,
  Eagle.ClientePenseAPI.Model.Requisicao.DadosLoja,
  Eagle.ClientePenseAPI.Model.Requisicao.DadosTerminal,

  Eagle.ClientePenseAPI.Model.Resposta.DadosAutenticacao,
  Eagle.ClientePenseAPI.Model.Resposta.DadosPagamento;

type
  EClientePenseException = class(Exception);

  IClientePense = interface(IInvokable)
    ['{1620EFA5-F78D-4E89-805C-FAA3E6D27F42}']

    function GetBearerToken: string;

    function RealizarAutenticacaoCliente(const DadosAutenticacao: TDadosRequisicaoAutenticacao): TDadosRespostaAutenticacao;

    function EnviarPagamento(const Pagamento: TDadosRequisicaoPagamento): TDadosRespostaPagamento;
    function EnviarLoja(const Loja: TDadosRequisicaoLoja): string;
    function EnviarTerminal(const Terminal: TDadosRequisicaoTerminal): string;

    function ListarCarteiras: string;
    function ConsultarPagamentoPeloCodigoAPI(const CodigoAPI: Integer): TDadosRespostaPagamento;
    function ConsultarPagamentoPelaCodigoERP(const CodigoERP: string): TDadosRespostaPagamento;

    procedure DeletarPagamento(const CodigoPagamentoAPI: Integer);

    property BearerToken: string read GetBearerToken;

  end;

implementation

end.
