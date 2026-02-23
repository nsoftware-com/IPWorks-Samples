(*
 * IPWorks 2024 Delphi Edition - Sample Project
 *
 * This sample project demonstrates the usage of IPWorks in a 
 * simple, straightforward way. It is not intended to be a complete 
 * application. Error handling and other checks are simplified for clarity.
 *
 * www.nsoftware.com/ipworks
 *
 * This code is subject to the terms and conditions specified in the 
 * corresponding product license agreement which outlines the authorized 
 * usage and restrictions.
 *)
unit jabberf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ipwcore, ipwtypes, ipwxmpp;

type
  TFormJabber = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    tbUser: TEdit;
    tbPass: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    cbContacts: TComboBox;
    bConnect: TButton;
    bSend: TButton;
    tbHistory: TMemo;
    tbInput: TMemo;
    XMPP1: TipwXMPP;
    tbServer: TEdit;
    Label5: TLabel;
    procedure bConnectClick(Sender: TObject);
    procedure bSendClick(Sender: TObject);
    procedure XMPP1Connected(Sender: TObject; StatusCode: Integer;
      const Description: String);
    procedure XMPP1Disconnected(Sender: TObject; StatusCode: Integer;
      const Description: String);
    procedure XMPP1Presence(Sender: TObject; const User, Domain,
      Resource: String; Availability: Integer; const Status: String);
    procedure XMPP1MessageIn(Sender: TObject; const MessageId, From,
      Domain, Resource: String; MessageType: Integer; const Subject,
      MessageThread, MessageText, MessageHTML, Other: String);
    procedure XMPP1SSLServerAuthentication(Sender: TObject; CertEncoded: string; CertEncodedB: TBytes;
      const CertSubject, CertIssuer, Status: string; var Accept: Boolean);
  end;

var
  FormJabber: TFormJabber;

implementation

{$R *.DFM}

procedure TFormJabber.bConnectClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if bConnect.Caption = 'Connect' then
    begin
      XMPP1.IMServer := tbServer.Text;
      XMPP1.SSLStartMode:=sslExplicit;
      XMPP1.User := tbUser.Text;
      XMPP1.Password := tbPass.Text;
      XMPP1.Connect;
    end
    else
      XMPP1.Disconnect;
  except
    on E:Exception do
    begin
      ShowMessage(E.Message);
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFormJabber.bSendClick(Sender: TObject);
begin
  tbHistory.Lines.Append(tbUser.Text + ': ' + tbInput.Text);
  XMPP1.MessageText := tbInput.Text;
  XMPP1.SendMessage(cbContacts.Text);
end;

procedure TFormJabber.XMPP1Connected(Sender: TObject; StatusCode: Integer;
  const Description: String);
begin
  if StatusCode = 0 then
    bConnect.Caption := 'Disconnect'
  else
    ShowMessage('Connection Error (' + IntToStr(StatusCode) + '): ' + Description);
  FormJabber.Caption := 'Now logged on as "' + XMPP1.User + '"';
  Screen.Cursor := crDefault;
end;

procedure TFormJabber.XMPP1Disconnected(Sender: TObject; StatusCode: Integer;
  const Description: String);
begin
  if StatusCode <> 0 then
    ShowMessage('Disconnected (' + IntToStr(StatusCode) + '): ' + Description);
  bConnect.Caption := 'Connect';
  FormJabber.Caption := 'Not yet logged in';
  Screen.Cursor := crDefault;
end;

procedure TFormJabber.XMPP1Presence(Sender: TObject; const User, Domain,
  Resource: String; Availability: Integer; const Status: String);
begin
  if Availability <> 0 then
  begin //if not offline
    if cbContacts.Items.IndexOf(User) < 0 then
      cbContacts.Items.Add(User + '@' + Domain);
    cbContacts.Text := User + '@' + Domain;
  end;
end;

procedure TFormJabber.XMPP1SSLServerAuthentication(Sender: TObject;
  CertEncoded: string; CertEncodedB: TBytes; const CertSubject, CertIssuer, Status: string;
  var Accept: Boolean);
begin
  Accept := True;
end;

procedure TFormJabber.XMPP1MessageIn(Sender: TObject; const MessageId, From,
  Domain, Resource: String; MessageType: Integer; const Subject,
  MessageThread, MessageText, MessageHTML, Other: String);
begin
  tbHistory.Lines.Append(From + ': ' + MessageText);
end;

end.

