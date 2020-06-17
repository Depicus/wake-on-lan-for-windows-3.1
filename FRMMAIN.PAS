unit Frmmain;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Buttons, wol;

type
  TMain = class(TForm)
    SpeedButton1: TSpeedButton;
    edtMacAddress: TEdit;
    edtInternetAddress: TEdit;
    edtSubnetMask: TEdit;
    edtPort: TEdit;
    cbType: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure cbTypeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;
  WakeOnLan:TWakeOnLan;

implementation

{$R *.DFM}

procedure TMain.FormCreate(Sender: TObject);
begin
WakeOnLan:=TWakeOnLan.Create(Self);
cbType.ItemIndex:= 0;
WakeOnLan.BroadcastType:=dwInternet;
end;

procedure TMain.FormDestroy(Sender: TObject);
begin
WakeOnLan.Free;
end;

procedure TMain.SpeedButton1Click(Sender: TObject);
begin
WakeOnLan.InternetAddress:= edtInternetAddress.Text;
WakeOnLan.MacAddress:=edtMacAddress.Text;
WakeOnLan.SubnetMask:=edtSubnetMask.Text;
WakeOnLan.PortNumber:=StrToInt(edtPort.Text);
WakeOnLan.SendMagicPacket;
end;

procedure TMain.cbTypeChange(Sender: TObject);
begin
if cbType.ItemIndex = 0 then
WakeOnLan.BroadcastType:=dwInternet
else
WakeOnLan.BroadcastType:=dwLocalSubnet;
end;

end.
