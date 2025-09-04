unit converterf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFormConverter = class(TForm)
    Label1: TLabel;
    EditFilename: TEdit;
    Button1: TButton;
    Button2: TButton;
  end;

var
  FormConverter: TFormConverter;

implementation

{$R *.DFM}

end.
