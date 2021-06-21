unit Mqp.View.Notification;

interface

uses Vcl.Controls;

Type

INotification = interface(IInvokable)
 ['{8B6ED7AA-DB21-4D8F-88B7-73563F264904}']
  procedure BalloonWarning(Controle : TControl; Mensagem : String);
  procedure MessageWarning(Mensagem : String);
  procedure MessageInformation(Mensagem : String);
  function ShowQuestion(Pergunta : string) : Boolean;
  procedure AddNotification(Mensagem : String; Controle : TControl);
  function WhenHasNotificationShowAndClear : Boolean;
End;



implementation

end.
