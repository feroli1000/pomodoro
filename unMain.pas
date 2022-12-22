unit unMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ButtonGroup, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.MPlayer, Vcl.AppEvnts;

type
  TFormMain = class(TForm)
    Timer1: TTimer;
    lblDisplay: TLabel;
    lblDisplay2: TLabel;
    upDownMinutes: TUpDown;
    edtMinutes: TEdit;
    btnStartStop: TBitBtn;
    MediaPlayer1: TMediaPlayer;
    lblInit: TLabel;
    lblDone: TLabel;
    TrayIcon1: TTrayIcon;
    ApplicationEvents1: TApplicationEvents;
    procedure FormCreate(Sender: TObject);
    procedure btnStartStopClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure edtMinutesDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    DoneTime: TDateTime;
    InitTime: TDateTime;
  public
    { Public declarations }
  end;

const
  FORM_TITLE = 'POMODORO'; // Should be assigned to onShow form event

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

function OneMinute: Double;
begin
  Result := 1 / (24 * 60);
end;

function OneSecond: Double;
begin
  Result := 1 / (24 * 60 * 60);
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  Timer1.Enabled := false;
  MediaPlayer1.FileName := './alarm.mp3';
  MediaPlayer1.Open;
  lblInit.Caption := '';
  lblDone.Caption := '';
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
  Self.Caption := FORM_TITLE;
end;

procedure TFormMain.btnStartStopClick(Sender: TObject);
begin
  if not Timer1.Enabled then
  begin
    Timer1.Enabled := True;
    btnStartStop.Caption := 'Stop';
    upDownMinutes.Enabled := false;
    edtMinutes.Enabled := false;
    InitTime := Time;
    DoneTime := Time + upDownMinutes.Position * OneMinute;
    lblInit.Caption := TimeToStr(InitTime);
    lblDone.Caption := TimeToStr(DoneTime);
    Exit;
  end;

  Timer1.Enabled := false;
  btnStartStop.Caption := 'Start';
  upDownMinutes.Enabled := True;
  edtMinutes.Enabled := True;
end;

procedure TFormMain.edtMinutesDblClick(Sender: TObject);
begin
  case upDownMinutes.Position of
    15:
      upDownMinutes.Position := 45;
    45:
      upDownMinutes.Position := 15;
  end;

end;

procedure TFormMain.Timer1Timer(Sender: TObject);
var
  elapsed, remaining: Double;
begin
  elapsed := Time - InitTime;
  remaining := DoneTime - Time + OneSecond;
  lblDisplay.Caption := TimeToStr(elapsed);
  lblDisplay2.Caption := TimeToStr(remaining);
  if Time > DoneTime then
  begin
    btnStartStopClick(nil); // Disable timer
    MediaPlayer1.Play;
    TrayIcon1DblClick(nil);
  end;
end;

procedure TFormMain.TrayIcon1DblClick(Sender: TObject);
begin
  { Hide the tray icon and show the window,
    setting its state property to wsNormal. }
  TrayIcon1.Visible := false;
  Show();
  WindowState := wsNormal;
  Application.BringToFront();
end;

procedure TFormMain.ApplicationEvents1Minimize(Sender: TObject);
begin
  { Hide the window and set its state variable to wsMinimized. }
  Hide();
  WindowState := wsMinimized;

  { Show the animated tray icon and also a hint balloon. }
  TrayIcon1.Visible := True;
  TrayIcon1.Animate := True;
  TrayIcon1.ShowBalloonHint;
end;

end.
