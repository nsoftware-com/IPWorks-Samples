unit loginf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TFormLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EditUser: TEdit;
    EditPassword: TEdit;
    EditPOPServer: TEdit;
    EditSMTPServer: TEdit;
    ButtonOK: TButton;
    ButtonCancel: TButton;
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.DFM}

end.

