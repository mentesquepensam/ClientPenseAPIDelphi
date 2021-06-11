unit Eagle.ClientePenseAPI.Util.GeradorLog;

interface

uses
  System.SysUtils;

type
  TGeradorLog = class
    class procedure AdicionarLog(const Mensagem: string);
  end;

implementation

{ TGeradorLog }

class procedure TGeradorLog.AdicionarLog(const Mensagem: string);
const
  ARQUIVO_LOG = 'ClientePenseAPILog.txt';
var
  Arquivo: TextFile;
begin
  AssignFile(Arquivo, ARQUIVO_LOG);

  if FileExists(ARQUIVO_LOG) then
    Append(Arquivo)
  else
    Rewrite(Arquivo);

  try
    Writeln(Arquivo, '#< ' + DateTimeToStr(Now) + ' - ' + Mensagem + ' >#');
  finally
    CloseFile(Arquivo);
  end;

end;

end.
