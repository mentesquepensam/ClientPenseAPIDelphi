unit Mqp.View.Impl.Notification;

interface

uses Vcl.Controls,
     Vcl.Dialogs,
     Mqp.View.Notification,

     System.SysUtils, System.Classes,

     XSuperObject, XSuperJSON,

     Spring.Container,
     Spring.Collections,
     Spring.Container.Common,

     Vcl.StdCtrls,
     Winapi.Windows;

const

    ECM_FIRST = $1500;
    EM_SHOWBALLOONTIP = (ECM_FIRST + 3);
    EM_HIDEBALLOONTIP = (ECM_FIRST + 4);
    TTI_NONE = 0;
    TTI_INFO = 1;
    TTI_WARNING = 2;
    TTI_ERROR = 3;



Type

  TEditBalloonTip = packed record
     cbStruct: DWORD ;
     pszTitle: LPCWSTR;
     pszText: LPCWSTR;
     ttiIcon: Integer;
  end;

TNotification = class(TInterfacedObject, INotification)
private
  FListaNotificacoes : TStringlist;
public
  constructor Create;
  destructor Destroy;
  procedure BalloonWarning(Controle : TControl; Mensagem : String);
  procedure MessageWarning(Mensagem : String);
  procedure MessageInformation(Mensagem : String);
  function ShowQuestion(Pergunta : string) : Boolean;
  procedure AddNotification(Mensagem : String; Controle : TControl);
  function WhenHasNotificationShowAndClear : Boolean;
End;


implementation

{ TNotification }
constructor TNotification.Create;
begin
    FListaNotificacoes := TStringlist.Create;
end;


destructor TNotification.Destroy;
begin
    FListaNotificacoes.Free;
end;

procedure TNotification.AddNotification(Mensagem: String; Controle: TControl);
begin
   //FListaNotificacoes.Add(Controle.Name + ':' + Mensagem);
   FListaNotificacoes.AddObject(Mensagem,Controle);
end;

procedure TNotification.BalloonWarning(Controle: TControl; Mensagem: String);
var  EditBalloonTip : TEditBalloonTip;
begin
   EditBalloonTip.cbStruct := SizeOf(TEditBalloonTip);
   EditBalloonTip.pszText := PWideChar(Mensagem);
   EditBalloonTip.pszTitle := 'Alerta';
   EditBalloonTip.ttiIcon := TTI_INFO;
   EditBalloonTip.ttiIcon := 2;
   SendMessageW(TEdit(Controle).Handle, EM_SHOWBALLOONTIP, 0,Integer(@EditBalloonTip));
   Sleep(1000);
   SendMessageW(TEdit(Controle).Handle, EM_HIDEBALLOONTIP, 0, 0);
end;


procedure TNotification.MessageInformation(Mensagem: String);
begin
   MessageDlg( Mensagem, mtInformation, [mbOk], 0 );
end;

procedure TNotification.MessageWarning(Mensagem: String);
begin
   MessageDlg( Mensagem, mtWarning, [mbOk], 0 );
end;

function TNotification.ShowQuestion(Pergunta: string): Boolean;
 var
  Resultado: Integer;
begin
  Resultado := MessageDlg(Pergunta, mtConfirmation, [mbYes, mbNo], 0);
  Result := (Resultado =  mrYes);
end;

function TNotification.WhenHasNotificationShowAndClear: Boolean;
var i : integer;
begin
   Result := False;
   for i:= 0 to FListaNotificacoes.Count - 1 do
   begin
      BalloonWarning(TEdit(FListaNotificacoes.Objects[i]),FListaNotificacoes.Strings[i]);
      Result := True;
   end;
   if Result then
   begin
      FListaNotificacoes.Clear;
   end;
end;


initialization

GlobalContainer.RegisterType<TNotification>.Implements<INotification>;

end.
