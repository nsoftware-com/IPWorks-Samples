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

unit tftpclientf;
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ipwcore, ipwtypes,ipwtftpclient;

type
  TFormTftpclient = class(TForm)
    ipwTFTPClient1: TipwTFTPClient;
    Button1: TButton;
    Label1: TLabel;
    serverAddress: TEdit;
    Label2: TLabel;
    remoteFileForm: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    localFileForm: TEdit;
    Label6: TLabel;
    portForm: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  procedure TFTPClientEndTransfer(Sender: TObject; Direction: Integer);

  public
    { Public declarations }
  end;

var
  FormTftpclient: TFormTftpclient;

implementation

{$R *.dfm}




procedure TFormTftpclient.Button1Click(Sender: TObject);
begin
  // Validate input fields
  if (Trim(serverAddress.Text) = '') or (Trim(portForm.Text) = '') then
  begin
    ShowMessage('Server address and port are required.');
    Exit;
  end;

  if (Trim(localFileForm.Text) = '') or (Trim(remoteFileForm.Text) = '') then
  begin
    ShowMessage('Local and remote filenames are required.');
    Exit;
  end;

  try
    ipwTFTPClient1.TFTPServer := Trim(serverAddress.Text);
    ipwTFTPClient1.TFTPPort := StrToInt(Trim(portForm.Text));
    ipwTFTPClient1.LocalFile := Trim(localFileForm.Text);
    ipwTFTPClient1.RemoteFile := Trim(remoteFileForm.Text);
    ipwTFTPClient1.OnEndTransfer := TFTPClientEndTransfer;
    ipwTFTPClient1.GetFile();
  except
    on E: Exception do
      ShowMessage('Error: ' + E.Message);
  end;
end;


procedure TFormTftpclient.TFTPClientEndTransfer(Sender: TObject; Direction: Integer);
begin

    ShowMessage('File Downloaded Successfully!');

end;

end.

