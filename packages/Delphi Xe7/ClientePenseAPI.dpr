program ClientePenseAPI;

uses
  Vcl.Forms,
  Spring.Container,
  CodeSiteLogging,
  //
  //Eagle.Core.View.Impl.Notification,
  //
  XSuperJSON in '..\..\dependencias\x-superobject\XSuperJSON.pas',
  XSuperObject in '..\..\dependencias\x-superobject\XSuperObject.pas',
  Mqp.View.Impl.Notification in '..\..\src\view\impl\Mqp.View.Impl.Notification.pas',
  Mqp.View.Notification in '..\..\src\view\Mqp.View.Notification.pas',
  Eagle.ClientePenseAPI.Main in '..\..\src\main\Eagle.ClientePenseAPI.Main.pas' {Main},
  Eagle.ClientePenseAPI.Service.Impl.ClientePense in '..\..\src\service\impl\Eagle.ClientePenseAPI.Service.Impl.ClientePense.pas',
  Eagle.ClientePenseAPI.Service.ClientePense in '..\..\src\service\Eagle.ClientePenseAPI.Service.ClientePense.pas',
  Eagle.ClientePenseAPI.Model.Requisicao.DadosAutenticacao in '..\..\src\model\requisicao\Eagle.ClientePenseAPI.Model.Requisicao.DadosAutenticacao.pas',
  Eagle.ClientePenseAPI.Model.Requisicao.DadosLoja in '..\..\src\model\requisicao\Eagle.ClientePenseAPI.Model.Requisicao.DadosLoja.pas',
  Eagle.ClientePenseAPI.Model.Resposta.DadosAutenticacao in '..\..\src\model\resposta\Eagle.ClientePenseAPI.Model.Resposta.DadosAutenticacao.pas',
  Eagle.ClientePenseAPI.Model.HorarioFuncionamentoLoja in '..\..\src\model\Eagle.ClientePenseAPI.Model.HorarioFuncionamentoLoja.pas',
  Eagle.ClientePenseAPI.Model.EnderecoLoja in '..\..\src\model\Eagle.ClientePenseAPI.Model.EnderecoLoja.pas',
  Eagle.ClientePenseAPI.Model.Requisicao.DadosTerminal in '..\..\src\model\requisicao\Eagle.ClientePenseAPI.Model.Requisicao.DadosTerminal.pas',
  Eagle.ClientePenseAPI.Model.Requisicao.DadosPagamento in '..\..\src\model\requisicao\Eagle.ClientePenseAPI.Model.Requisicao.DadosPagamento.pas',
  Eagle.ClientePenseAPI.Model.Resposta.DadosPagamento in '..\..\src\model\resposta\Eagle.ClientePenseAPI.Model.Resposta.DadosPagamento.pas',
  Eagle.ClientePenseAPI.Model.Resposta.DadosErro in '..\..\src\model\resposta\Eagle.ClientePenseAPI.Model.Resposta.DadosErro.pas',
  Eagle.ClientePenseAPI.Util.GeradorLog in '..\..\src\utils\Eagle.ClientePenseAPI.Util.GeradorLog.pas',
  Eagle.Core.Http.HttpResponse in '..\..\src\http\Eagle.Core.Http.HttpResponse.pas',
  Eagle.Core.Http.RestClient in '..\..\src\http\Eagle.Core.Http.RestClient.pas',
  Eagle.Core.Http.Impl.HttpResponse in '..\..\src\http\impl\Eagle.Core.Http.Impl.HttpResponse.pas',
  Eagle.Core.Http.Impl.RestClient in '..\..\src\http\impl\Eagle.Core.Http.Impl.RestClient.pas';

{$R *.res}

begin
  CodeSite.Enabled := False;

{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  CodeSite.Enabled := CodeSite.Installed;
{$ENDIF}
  GlobalContainer.Build;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.Run;

end.



