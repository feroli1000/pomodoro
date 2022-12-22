program pomodoro;

uses
  Vcl.Forms, Winapi.Windows, Vcl.Dialogs, System.UITypes,
  unMain in 'unMain.pas' {FormMain};

{$R *.res}

var
  Semafor: THandle;

procedure RestoreWindow(aFormName: string);
var
  Wnd, App: HWND;
begin
  Wnd := FindWindow(PChar(aFormName), nil);
  if (Wnd <> 0) then
  begin { Set Window to foreground }
    App := GetWindowLong(Wnd, GWL_HWNDPARENT);
    if IsIconic(App) then
    begin
      ShowWindow(App, SW_RESTORE);
    end;
    SetForegroundwindow(App);
  end;
end;

begin

  { Don't start twice ... if already running bring this instance to front }
  Semafor := CreateSemaphore(nil, 0, 1, 'MY_POMODORO_APPLICATION_IS_RUNNING');
  if ((Semafor <> 0) and { application is already running }
    (GetLastError = ERROR_ALREADY_EXISTS)) then
  begin
    MessageDlg('Programa POMODORO já está em uso - Deveria restaurar a janela...', mtInformation, [mbOK], 0);
    RestoreWindow('TFormMain');
    CloseHandle(Semafor);
    Halt;
  end;

  Application.Initialize;
  Application.Title := 'Pomodoro';
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
  CloseHandle(Semafor);

end.
