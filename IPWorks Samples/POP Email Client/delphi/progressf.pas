unit progressf;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TFormProgress = class(TForm)
    ListBoxPITrail: TListBox;
  end;

var
  FormProgress: TFormProgress;

implementation

{$R *.DFM}

end.
