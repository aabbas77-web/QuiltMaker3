{*******************************************************}
{                                                       }
{         MiTeC System Information Component            }
{                System Overview                        }
{           version 8.2 for Delphi 5,6,7                }
{                                                       }
{       Copyright © 1997,2003 Michal Mutl               }
{                                                       }
{*******************************************************}


{$INCLUDE MITEC_DEF.INC}

unit MSI_Overview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MSI_GUI, ComCtrls, StdCtrls, ExtCtrls, CheckLst,
  ImgList, Mask, Menus, Gauges, Buttons, MSI_CPUUsage, MSI_IDE;

type
  TPage = (pgWksta, pgOS, pgCPU, pgMem, pgDisplay, pgAPM, pgMedia, pgNet, pgDev,
           pgPrn, pgIDE, pgEng, pgDisk, pgTZ, pgStartup, pgSoftware, pgAbout);

  TPages = set of TPage;

const
  iiComputer      = 0;
  iiSystem        = 1;
  iiDisplay       = 2;
  iiMonitor       = 3;
  iiVolumes       = 4;
  iiFDD           = 5;
  iiHDD           = 6;
  iiCDROM         = 7;
  iiTape          = 8;
  iiAPM           = 9;
  iiImaging       = 10;
  iiKeyboard      = 11;
  iiMouse         = 12;
  iiModem         = 13;
  iiPort          = 14;
  iiAdapter       = 15;
  iiPackage       = 16;
  iiSCSI          = 17;
  iiDriver        = 18;
  iiSound         = 19;
  iiUSB           = 20;
  iiGame          = 21;
  iiNet           = 22;
  iiProcess       = 23;
  iiPCMCIA        = 24;
  iiChanger       = 25;
  iiHID           = 26;
  iiGPS           = 27;
  iiReader        = 28;
  iiInfrared      = 29;
  iiMIDI          = 30;
  iiWave          = 31;
  iiMixer         = 32;
  iiAUX           = 33;
  iiDirectX       = 34;
  iiPrinter       = 35;
  iiPrinterDef    = 36;
  iiNetPrinter    = 37;
  iiNetPrinterDef = 38;
  iiController    = 39;
  iiMemory        = 40;
  iiCPU           = 41;



  pgAll = [pgWksta, pgOS, pgCPU, pgMem, pgDisplay, pgAPM, pgMedia, pgNet, pgDev,
           pgPrn, pgEng, pgIDE, pgDisk, pgTZ, pgStartup, pgSoftware];


type
  TfrmMSI_Overview = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bRefresh: TButton;
    Panel3: TPanel;
    pc: TPageControl;
    tsWksta: TTabSheet;
    tsOS: TTabSheet;
    tsCPU: TTabSheet;
    pNumLock: TPanel;
    pCapsLock: TPanel;
    pScrollLock: TPanel;
    bOK: TButton;
    Image2: TImage;
    lVersion: TLabel;
    lVerNo: TLabel;
    Bevel1: TBevel;
    bEnvironment: TButton;
    Image3: TImage;
    lCPU: TLabel;
    tsMemory: TTabSheet;
    tsDisplay: TTabSheet;
    Image5: TImage;
    cbDisplay: TEdit;
    Label33: TLabel;
    tsAPM: TTabSheet;
    GroupBox13: TGroupBox;
    Label38: TLabel;
    Label39: TLabel;
    eAC: TEdit;
    eBat: TEdit;
    Image6: TImage;
    GroupBox14: TGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    eBatFull: TEdit;
    eBatLife: TEdit;
    tsMedia: TTabSheet;
    Label42: TLabel;
    Panel5: TPanel;
    img: TImageList;
    tsNetwork: TTabSheet;
    tsDevices: TTabSheet;
    psd: TPrinterSetupDialog;
    tsPrinters: TTabSheet;
    Label48: TLabel;
    Panel7: TPanel;
    lvPrinter: TListView;
    bPrint: TButton;
    tsEngines: TTabSheet;
    GroupBox17: TGroupBox;
    Image7: TImage;
    lODBC: TLabel;
    lBDE: TLabel;
    tsDrives: TTabSheet;
    Label54: TLabel;
    cbDrive: TComboBox;
    GroupBox19: TGroupBox;
    imgDrive: TImage;
    lDriveType: TLabel;
    clbFlags: TCheckListBox;
    Label55: TLabel;
    Label56: TLabel;
    eUNC: TEdit;
    eDSN: TEdit;
    Bevel3: TBevel;
    lCapacity: TLabel;
    lFree: TLabel;
    lBPS: TLabel;
    lSPC: TLabel;
    lTC: TLabel;
    lFC: TLabel;
    Bevel4: TBevel;
    bReport: TButton;
    ReportMenu: TPopupMenu;
    pmAll: TMenuItem;
    pmSelected: TMenuItem;
    Panel10: TPanel;
    gDisk: TGauge;
    Panel11: TPanel;
    gAPM: TGauge;
    tsTZ: TTabSheet;
    Panel12: TPanel;
    Image10: TImage;
    gbStd: TGroupBox;
    Label12: TLabel;
    Label73: TLabel;
    eStdStart: TEdit;
    eStdBias: TEdit;
    eTZ: TEdit;
    Label74: TLabel;
    gbDay: TGroupBox;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    edayStart: TEdit;
    eDayBias: TEdit;
    pcCPU: TPageControl;
    tsID: TTabSheet;
    tsFeatures: TTabSheet;
    GroupBox5: TGroupBox;
    lFamily: TLabel;
    lSerial: TLabel;
    lVendor: TLabel;
    GroupBox6: TGroupBox;
    Panel4: TPanel;
    clbCPU: TCheckListBox;
    lDAO: TLabel;
    tsAbout: TTabSheet;
    FooterPanel: TPanel;
    sbMail: TSpeedButton;
    TitlePanel: TPanel;
    imgIcon: TImage;
    Panel16: TPanel;
    Memo: TMemo;
    tsStartup: TTabSheet;
    tsSoftware: TTabSheet;
    tcStartup: TTabControl;
    bNTSpec: TButton;
    lvMedia: TListView;
    Panel18: TPanel;
    lvSound: TListView;
    Label14: TLabel;
    Panel20: TPanel;
    lvSW: TListView;
    Panel21: TPanel;
    lvStartup: TListView;
    lTitle: TLabel;
    lVer: TLabel;
    lADO: TLabel;
    lCSD: TLabel;
    lDVD: TLabel;
    pcOS: TPageControl;
    tsGeneral: TTabSheet;
    tsFolders: TTabSheet;
    tsInternet: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label15: TLabel;
    ePID: TEdit;
    eRegUser: TEdit;
    eRegOrg: TEdit;
    ePKey: TEdit;
    Panel15: TPanel;
    FolderList: TListView;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    eBrowser: TEdit;
    eProxy: TEdit;
    email: TEdit;
    lCT: TLabel;
    Bevel2: TBevel;
    eMachine: TEdit;
    pcEng: TPageControl;
    tsDirectX: TTabSheet;
    tsASPI: TTabSheet;
    Panel19: TPanel;
    lvDirectX: TListView;
    ilEng: TImageList;
    Panel22: TPanel;
    lvASPI: TListView;
    lASPI: TLabel;
    Bevel5: TBevel;
    lDirectX: TLabel;
    Bevel6: TBevel;
    tsLocale: TTabSheet;
    Panel17: TPanel;
    LocaleList: TListView;
    Panel23: TPanel;
    pcMem: TPageControl;
    tsmemGen: TTabSheet;
    GroupBox7: TGroupBox;
    Image4: TImage;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    ePT: TEdit;
    ePF: TEdit;
    eFT: TEdit;
    eFF: TEdit;
    eVT: TEdit;
    eVF: TEdit;
    GroupBox9: TGroupBox;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    eAG: TEdit;
    eAppAddr: TEdit;
    ePS: TEdit;
    tsmemMeas: TTabSheet;
    GroupBox8: TGroupBox;
    gMemory: TGauge;
    GroupBox1: TGroupBox;
    lGDI: TLabel;
    lSystem: TLabel;
    lUser: TLabel;
    pbGDI: TProgressBar;
    pbSystem: TProgressBar;
    pbUser: TProgressBar;
    Label13: TLabel;
    Label50: TLabel;
    gPhys: TGauge;
    Label49: TLabel;
    gPage: TGauge;
    Label51: TLabel;
    gVirt: TGauge;
    Panel24: TPanel;
    CPUGauge: TGauge;
    Label52: TLabel;
    pcMachine: TPageControl;
    tsMachineGeneral: TTabSheet;
    tsMachineSMBIOS: TTabSheet;
    gbMID: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    eWksta: TEdit;
    eUser: TEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    eLastBoot: TEdit;
    eSysTime: TEdit;
    Panel25: TPanel;
    Label60: TLabel;
    eSMVer: TEdit;
    Bevel7: TBevel;
    pcSM: TPageControl;
    tsSMSystem: TTabSheet;
    GroupBox4: TGroupBox;
    Label61: TLabel;
    Label62: TLabel;
    lSysVer: TLabel;
    lSysSer: TLabel;
    lSysID: TLabel;
    eSysMod: TEdit;
    eSysMan: TEdit;
    eSysVer: TEdit;
    eSysSer: TEdit;
    eSysID: TEdit;
    tsSMMB: TTabSheet;
    GroupBox15: TGroupBox;
    Label67: TLabel;
    Label68: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    eMBMod: TEdit;
    eMBMan: TEdit;
    eMBVer: TEdit;
    eMBSer: TEdit;
    tsSMCH: TTabSheet;
    GroupBox18: TGroupBox;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    eCHMod: TEdit;
    eCHMan: TEdit;
    eCHVer: TEdit;
    eCHSer: TEdit;
    tsSMCPU: TTabSheet;
    tsSMMem: TTabSheet;
    Panel26: TPanel;
    lvMem: TListView;
    tsSMPort: TTabSheet;
    Panel27: TPanel;
    lvPort: TListView;
    tsSMSlot: TTabSheet;
    Panel28: TPanel;
    lvSlot: TListView;
    tsSMTables: TTabSheet;
    Panel29: TPanel;
    lvTables: TListView;
    Label66: TLabel;
    eSMTables: TEdit;
    SpeedButton1: TSpeedButton;
    Panel6: TPanel;
    pcNet: TPageControl;
    tsNetGeneral: TTabSheet;
    Label47: TLabel;
    Panel13: TPanel;
    lvNetwork: TListView;
    GroupBox16: TGroupBox;
    Panel14: TPanel;
    Label69: TLabel;
    lbMAC: TListBox;
    Panel30: TPanel;
    Label64: TLabel;
    lbIP: TListBox;
    bProto: TButton;
    bServ: TButton;
    bCli: TButton;
    tsNetWinsock: TTabSheet;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    eWSDesc: TEdit;
    eWSVer: TEdit;
    eWSStat: TEdit;
    tsNetTCPIP: TTabSheet;
    Label72: TLabel;
    Label82: TLabel;
    eHost: TEdit;
    eDomain: TEdit;
    Panel31: TPanel;
    AdapterList: TListView;
    Bevel8: TBevel;
    cbxProxy: TCheckBox;
    cbxRouting: TCheckBox;
    cbxDNS: TCheckBox;
    cbAdapters: TComboBox;
    Label87: TLabel;
    tsSMCaches: TTabSheet;
    Panel32: TPanel;
    lvCache: TListView;
    ePA: TEdit;
    Label91: TLabel;
    cbxDHCP: TCheckBox;
    cbxWINS: TCheckBox;
    Label92: TLabel;
    eNode: TEdit;
    Label93: TLabel;
    eDNS: TEdit;
    Label94: TLabel;
    eAT: TEdit;
    DNSBox: TListBox;
    Label95: TLabel;
    Panel33: TPanel;
    lvProcs: TListView;
    tsCache: TTabSheet;
    GroupBox20: TGroupBox;
    Panel34: TPanel;
    lModel: TLabel;
    lStepping: TLabel;
    lnamestring: TLabel;
    lFriendlyname: TLabel;
    lType: TLabel;
    lLevel1: TLabel;
    lLevel2: TLabel;
    lLevel3: TLabel;
    CacheBox: TListBox;
    Label63: TLabel;
    lFreq: TLabel;
    sd: TSaveDialog;
    Image8: TImage;
    Image9: TImage;
    lCodename: TLabel;
    pcDisplay: TPageControl;
    tsDisplay1: TTabSheet;
    tsDisplay2: TTabSheet;
    GroupBox10: TGroupBox;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label65: TLabel;
    eChip: TEdit;
    eDAC: TEdit;
    eMem: TEdit;
    bModes: TButton;
    eBIOSString: TEdit;
    GroupBox12: TGroupBox;
    eBIOS: TEdit;
    Panel35: TPanel;
    lvDisp: TListView;
    GroupBox11: TPanel;
    bCurve: TButton;
    bLine: TButton;
    bPoly: TButton;
    bRaster: TButton;
    bText: TButton;
    Button1: TButton;
    Button2: TButton;
    tsIDE: TTabSheet;
    Label83: TLabel;
    cbIDE: TComboBox;
    Image11: TImage;
    gbIDE: TGroupBox;
    Label84: TLabel;
    eIDEModel: TEdit;
    Label85: TLabel;
    eIDESN: TEdit;
    Label86: TLabel;
    eIDERev: TEdit;
    Label88: TLabel;
    eIDECyls: TEdit;
    Label89: TLabel;
    eIDEHeads: TEdit;
    Label90: TLabel;
    eIDESecs: TEdit;
    Label96: TLabel;
    eIDECap: TEdit;
    tsBIOS: TTabSheet;
    GroupBox21: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label53: TLabel;
    eBIOSVendor: TEdit;
    eBIOSVer: TEdit;
    eBIOSDate: TEdit;
    eBIOSSize: TEdit;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    eSBCopy: TEdit;
    eSBName: TEdit;
    eSBDate: TEdit;
    Label100: TLabel;
    eSBExt: TEdit;
    Label101: TLabel;
    edate: TEdit;
    Label102: TLabel;
    Panel36: TPanel;
    pcDev: TPageControl;
    tsDevTree: TTabSheet;
    tsDevRes: TTabSheet;
    Panel8: TPanel;
    Tree: TTreeView;
    Panel9: TPanel;
    bProps: TButton;
    bRes: TButton;
    Panel37: TPanel;
    ResList: TListView;
    CPUUsage: TMCPUUsage;
    tsSMMC: TTabSheet;
    GroupBox22: TGroupBox;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    eMCI: TEdit;
    eMCSS: TEdit;
    eMCST: TEdit;
    eMCSV: TEdit;
    eMCMS: TEdit;
    Label108: TLabel;
    Label109: TLabel;
    eMCSC: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure cmRefresh(Sender: TObject);
    procedure cmClose(Sender: TObject);
    procedure cmEnvironment(Sender: TObject);
    procedure cmCaps(Sender: TObject);
    procedure cmPrintSetup(Sender: TObject);
    procedure cbDriveChange(Sender: TObject);
    procedure cmReportClick(Sender: TObject);
    procedure cmReportAll(Sender: TObject);
    procedure cmReportCurrent(Sender: TObject);
    procedure clbClickCheck(Sender: TObject);
    procedure cmModes(Sender: TObject);
    procedure cmProto(Sender: TObject);
    procedure cmServ(Sender: TObject);
    procedure cmCli(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TreeChange(Sender: TObject; Node: TTreeNode);
    procedure cmProps(Sender: TObject);
    procedure cmMail(Sender: TObject);
    procedure tcStartupChange(Sender: TObject);
    procedure cmNTSpec(Sender: TObject);
    procedure CPUUsageInterval(Sender: TObject; Value: Cardinal);
    procedure cmWeb(Sender: TObject);
    procedure cbAdaptersChange(Sender: TObject);
    procedure cbxClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbIDEChange(Sender: TObject);
    procedure cmRes(Sender: TObject);
  private
    FPages: TPages;
    FSysInfo: TMSystemInfo;
    FShowRepBut: Boolean;
    procedure SetPages(const Value: TPages);
    procedure SetShowRepBut(const Value: Boolean);
    procedure SetCaptionText(const Value: string);
  public
    Report :TStringList;

    property DisplayedPages: TPages read FPages write SetPages;
    property SysInfo: TMSystemInfo read FSysInfo write FSysInfo;
    property ShowReportButton: Boolean read FShowRepBut write SetShowRepBut;
    property CaptionText: string Write SetCaptionText;

    procedure GetInfo;

    procedure GetWkstaInfo;
    procedure GetOSInfo;
    procedure GetCPUInfo;
    procedure GetMemoryInfo;
    procedure GetDisplayInfo;
    procedure GetAPMInfo;
    procedure GetMediaInfo;
    procedure GetNetInfo;
    procedure GetDeviceInfo;
    procedure GetEngInfo;
    procedure GetDriveInfo;
    procedure GetTZInfo;
    procedure GetPrintInfo;
    procedure GetStartupInfo;
    procedure GetSWInfo;
    procedure GetIDEInfo;
  end;

var
  frmMSI_Overview: TfrmMSI_Overview;

implementation

uses ShellAPI, ShlObj, MiTeC_Routines, MSI_Devices, MSI_DetailDlg, MSI_OS, MSI_APM,
  MSI_Startup, MSI_Common, MiTeC_Datetime, MSI_SMBIOS,
  MSI_Network, MSI_CPU, MiTeC_StrUtils, MSI_Machine, MSI_ResourcesDlg, MiTeC_NTDDK;

{$R *.DFM}

const
  cDeviceImageIndex: array[TDeviceClass] of integer =
                      (iiAPM, iiSystem, iiVolumes, iiDisplay, iiCDROM, iiVolumes,
                       iiFDD, iiGPS, iiHID, iiVolumes, iiDriver, iiImaging,
                       iiInfrared, iiKeyboard, iiChanger, iiDriver, iiMouse, iiModem,
                       iiMonitor, iiReader, iiPort, iiAdapter, iiDriver,
                       iiPackage, iiDriver, iiAdapter, iiPort, iiPrinter, iiSCSI,
                       iiReader, iiSound, iiHDD, iiSystem, iiTape, iiController,
                       iiTape, iiUSB, iiCPU);

{ TfrmMSI_Overview }

procedure TfrmMSI_Overview.GetWkstaInfo;
var
  i: Integer;
begin
  with SysInfo.Machine do begin
    if Trim(Computer)<>'' then
      eMachine.Text:=' '+Computer+' ';
    eWksta.text:=Name;
    eUser.text:=User;
    eSBCopy.Text:=BIOS.Copyright;
    eSBName.Text:=BIOS.Name;
    eSBDate.Text:=BIOS.Date;
    eSBExt.Text:=BIOS.ExtendedInfo;
    eLastBoot.text:=datetimetostr(LastBoot);
    eSysTime.text:=formatseconds(SystemUpTime,true,false,false);
    if NumLock then
      pNumLock.color:=clLime
    else
      pNumLock.color:=clSilver;
    if CapsLock then
      pCapsLock.color:=clLime
    else
      pCapsLock.color:=clSilver;
    if ScrollLock then
      pScrollLock.color:=clLime
    else
      pScrollLock.color:=clSilver;

    with SMBIOS do begin
      eSMVer.Text:=Version;
      eSMTables.Text:=Format('%d',[Length(StructTables)]);

      if BIOSVendor='' then
        eBIOSVendor.Text:=BIOS.Copyright
      else
        eBIOSVendor.Text:=BIOSVendor;
      if BIOSVersion='' then
        eBIOSVer.Text:=BIOS.Name+' '+BIOS.ExtendedInfo
      else
        eBIOSVer.Text:=BIOSVersion;
      if BIOSDate='' then
        eBIOSDate.Text:=BIOS.Date
      else
        eBIOSDate.Text:=BIOSDate;
      eBIOSSize.Text:=Format('%d',[BIOSSize]);

      eSysMod.Text:=SystemModel;
      eSysMan.Text:=SystemManufacturer;
      eSysVer.Text:=SystemVersion;
      eSysSer.Text:=SystemSerial;
      eSysID.Text:=SystemUUID;

      eMBMod.Text:=MainBoardModel;
      eMBMan.Text:=MainBoardManufacturer;
      eMBVer.Text:=MainBoardVersion;
      eMBSer.Text:=MainBoardSerial;

      eCHMod.Text:=ChassisTypes[ChassisModel];
      eCHMan.Text:=ChassisManufacturer;
      eCHVer.Text:=ChassisVersion;
      eCHSer.Text:=ChassisSerial;

      eMCI.Text:=Format('%s / %s',[InterleaveSupports[MemCtrlCurrentInterleave],
                                   InterleaveSupports[MemCtrlSupportedInterleave]]);
      eMCSS.Text:=GetMemorySpeedStr(MemCtrlSupportedSpeeds);
      eMCST.Text:=GetMemoryTypeStr(MemCtrlSupportedTypes);
      eMCSV.Text:=GetMemoryVoltageStr(MemCtrlSupportedVoltages);
      eMCMS.Text:=Format('%d',[MemCtrlMaxSize]);
      eMCSC.Text:=Format('%d',[MemCtrlSlotCount]);

      lvProcs.Items.Clear;
      for i:=0 to ProcessorCount-1 do
        with lvProcs.Items.Add do begin
          Caption:=Processor[i].Manufacturer;
          SubItems.Add(Processor[i].Version);
          SubItems.Add(Processor[i].Socket);
          SubItems.Add(Upgrades[Processor[i].Upgrade]);
          SubItems.Add(Format('%1.1f V',[Processor[i].Voltage]));
          SubItems.Add(Format('%d MHz',[Processor[i].Frequency]));
          SubItems.Add(Format('%d MHz',[Processor[i].ExternalClock]));
          ImageIndex:=iiCPU;
        end;

      lvCache.Items.Clear;
      for i:=0 to CacheCount-1 do
        with lvCache.Items.Add do begin
          Caption:=Cache[i].Designation;
          SubItems.Add(CacheTypes[Cache[i].Typ]);
          SubItems.Add(CacheAssociativities[Cache[i].Associativity]);
          SubItems.Add(SRAMTypes[Cache[i].SRAMType]);
          SubItems.Add(Format('%d KB',[Cache[i].InstalledSize]));
          SubItems.Add(Format('%d KB',[Cache[i].MaxSize]));
          SubItems.Add(Format('%d ns',[Cache[i].Speed]));
          ImageIndex:=iiMemory;
        end;

      lvMem.Items.Clear;
      for i:=0 to MemorySlotCount-1 do
        with lvMem.Items.Add do begin
          Caption:=MemoryBank[i].Socket;
          SubItems.Add(MemoryFormFactors[MemoryBank[i].FormFactor]);
          SubItems.Add(GetMemoryTypeStr(MemoryBank[i].Types));
          SubItems.Add(MemoryDevices[MemoryBank[i].Device]);
          SubItems.Add(Format('%d MB',[MemoryBank[i].Size]));
          SubItems.Add(Format('%d ns',[MemoryBank[i].Speed]));
          ImageIndex:=iiMemory;
        end;

      lvPort.Items.Clear;
      for i:=0 to PortCount-1 do
        with lvPort.Items.Add do begin
          Caption:=PortTypes[Port[i].Typ];
          SubItems.Add(Port[i].InternalDesignator);
          SubItems.Add(ConnectorTypes[Port[i].InternalConnector]);
          SubItems.Add(Port[i].ExternalDesignator);
          SubItems.Add(ConnectorTypes[Port[i].ExternalConnector]);
          ImageIndex:=iiPort;
        end;

      lvSlot.Items.Clear;
      for i:=0 to SystemSlotCount-1 do
        with lvSlot.Items.Add do begin
          Caption:=SlotTypes[SystemSlot[i].Typ];
          SubItems.Add(DataBusTypes[SystemSlot[i].DataBus]);
          SubItems.Add(SlotUsages[SystemSlot[i].Usage]);
          SubItems.Add(SlotLengths[SystemSlot[i].Length]);
          ImageIndex:=iiAdapter;
        end;

      lvTables.Items.Clear;
      for i:=0 to High(StructTables) do
        with lvTables.Items.Add do begin
          Caption:=Format('Type %d: %s',[StructTables[i].Indicator,StructTables[i].Name]);
          SubItems.Add(Format('%d',[StructTables[i].Length]));
          SubItems.Add(Format('%4.4x',[StructTables[i].Handle]));
          ImageIndex:=-1;
        end;
    end;
  end;
end;

procedure TfrmMSI_Overview.GetOSInfo;
var
  i: integer;
  s: string;
begin
  with SysInfo.OS do begin
    s:=OSVersion;
    case Platform of
      opWin31: tsOS.Caption:='Windows 3.1x';
      opWin9x: tsOS.Caption:='Windows 9x';
      opWinNT: tsOS.Caption:='Windows NT';
    end;
    if IsNT then begin
      case NTSpecific.ProductType of
        ptWorkstation: s:=s+' - Workstation';
        ptServer: s:=s+' - Server';
        ptAdvancedServer: s:=s+' - Advanced Server';
      end;
      lCSD.caption:=CSD;
    end;

    lVersion.caption:=s;
    lVerNo.caption:=format('Version: %d.%d.%d',[MajorVersion,MinorVersion,BuildNumber]);

    bNTSpec.Enabled:=Is2K or IsXP;
    lCSD.caption:=CSDEx;
    ePID.text:=ProductID;
    ePKey.text:=ProductKey;
    eRegUser.text:=RegisteredUser;
    eRegOrg.text:=RegisteredOrg;
    lDVD.Caption:='DVD Region: '+DVDRegion;

    FolderList.Items.Clear;
    for i:=0 to Folders.Count-1 do
      if Folders.Values[Folders.Names[i]]<>'' then
        with FolderList.Items.Add do begin
          Caption:=Folders.Names[i];
          SubItems.Add(Folders.Values[Folders.Names[i]]);
        end;

    LocaleList.Items.Clear;
    with LocaleList.Items.Add do begin
      Caption:='Abbreviate Country Code';
      SubItems.Add(LocaleInfo.AbbreviateCountryCode);
    end;
    with LocaleList.Items.Add do begin
      Caption:='Abbreviate Language Code';
      SubItems.Add(LocaleInfo.AbbreviateLanguageName);
    end;
    with LocaleList.Items.Add do begin
      Caption:='Country Code';
      SubItems.Add(LocaleInfo.CountryCode);
    end;
    with LocaleList.Items.Add do begin
      Caption:='Currency Decimal Digits';
      SubItems.Add(LocaleInfo.CurrencyDecimalDigits);
    end;

    with LocaleList.Items.Add do begin
      Caption:='Full Country Code';
      SubItems.Add(LocaleInfo.FullCountryCode);
    end;
    with LocaleList.Items.Add do begin
      Caption:='Full English Language Name';
      SubItems.Add(LocaleInfo.FullLanguageEnglishName);
    end;
    with LocaleList.Items.Add do begin
      Caption:='Full Localize Language Name';
      SubItems.Add(LocaleInfo.FullLocalizeLanguage);
    end;
    with LocaleList.Items.Add do begin
      Caption:='Intl. Monetary Symbol';
      SubItems.Add(LocaleInfo.InternationalMonetarySymbol);
    end;
    with LocaleList.Items.Add do begin
      Caption:='Local Monetary Symbol';
      SubItems.Add(LocaleInfo.LocalMonetarySymbol);
    end;
    with LocaleList.Items.Add do begin
      Caption:='Positive Currency Mode';
      case LocaleInfo.PositiveCurrencyMode of
        Prefix_No_Separation: SubItems.Add('Prefix_No_Separation');
        Suffix_No_Separation: SubItems.Add('Suffix_No_Separation');
        Prefix_One_Char_Separation: SubItems.Add('Prefix_One_Char_Separation');
        Suffix_One_Char_Separation: SubItems.Add('Suffix_One_Char_Separation');
      end;
    end;
    with LocaleList.Items.Add do begin
      Caption:='Negative Currency Mode';
      SubItems.Add(LocaleInfo.NegativeCurrencyMode);
    end;
    with LocaleList.Items.Add do begin
      Caption:='Currency Decimal Separator';
      SubItems.Add(LocaleInfo.CurrencyDecimalSeparator);
    end;
    with LocaleList.Items.Add do begin
      Caption:='Currency Thousand Separator';
      SubItems.Add(LocaleInfo.CurrencyThousandSeparator);
    end;
    with LocaleList.Items.Add do begin
      Caption:='Decimal Separator';
      SubItems.Add(LocaleInfo.DecimalSeparator);
    end;
    with LocaleList.Items.Add do begin
      Caption:='Number Of Decimal Digits';
      SubItems.Add(LocaleInfo.NumberOfDecimalDigits);
    end;
    with LocaleList.Items.Add do begin
      Caption:='List Separator';
      SubItems.Add(LocaleInfo.ListSeparator);
    end;
    with LocaleList.Items.Add do begin
      Caption:='Date Separator';
      SubItems.Add(LocaleInfo.DateSeparator);
    end;
    with LocaleList.Items.Add do begin
      Caption:='Long Date Order';
      case LocaleInfo.LongDateOrder of
        MDY: SubItems.Add('M-D-Y');
        DMY: SubItems.Add('D-M-Y');
        YMD: SubItems.Add('Y-M-D');
      end;
    end;
    with LocaleList.Items.Add do begin
      Caption:='Short Date Order';
      case LocaleInfo.ShortDateOrder of
        MDY: SubItems.Add('M-D-Y');
        DMY: SubItems.Add('D-M-Y');
        YMD: SubItems.Add('Y-M-D');
      end;
    end;
    with LocaleList.Items.Add do begin
      Caption:='Short Date Format';
      SubItems.Add(LocaleInfo.ShortDateFormat);
    end;
    with LocaleList.Items.Add do begin
      Caption:='Time Format';
      SubItems.Add(LocaleInfo.TimeFormat);
    end;
    with LocaleList.Items.Add do begin
      Caption:='Time Format Specifier';
      case LocaleInfo.TimeFormatSpecifier of
        H12: SubItems.Add('12H');
        H24: SubItems.Add('24H');
      end;
    end;
    with LocaleList.Items.Add do begin
      Caption:='Year Format';
      case LocaleInfo.YearFormat of
        TwoDigit: SubItems.Add('Two Digit');
        FourDigit: SubItems.Add('Four Digit');
      end;
    end;
    with LocaleList.Items.Add do begin
      Caption:='Measurement System';
      case LocaleInfo.MeasurementSystem of
        Metric: SubItems.Add('Metric');
        US: SubItems.Add('U.S.');
      end;
    end;

    eBrowser.Text:=Internet.DefaultBrowser;
    eMail.Text:=Internet.DefaultMailClient;
    eProxy.Text:=Internet.ProxyServer;
    lCT.Caption:=Internet.GetConnTypeStr(Internet.ConnectionType);
  end;
end;

procedure TfrmMSI_Overview.GetCPUInfo;
var
  sl :TStringList;
  i :Longint;
begin
  with SysInfo.CPU do begin
    //if Trim(CPUIDNameString)='' then
      lCPU.caption:=format('%d x %s %s - %d MHz',[Count,CPUVendors[VendorType],FriendlyName,Frequency]);
    {else
      lCPU.caption:=format('%d x %s - %d MHz',[Count,Trim(CPUIDNameString),Frequency]);}
    lFamily.caption:=format(  'Family: %d (%d)',[Family,ExtendedFamily]);
    lModel.caption:=format(   'Model: %d (%d)',[Model,ExtendedModel]);
    lStepping.caption:=format('Stepping: %d (%d)',[Stepping,ExtendedStepping]);
    lType.Caption:=Format('Type: %s',[CPUTypes[CPUType]]);
    lFreq.Caption:=Format('Frequency: %d MHz',[Frequency]);
    lVendor.Caption:='Vendor: '+Vendor;
    lnamestring.Caption:='Name String: '+CPUIDNameString;
    lFriendlyname.Caption:='Friendly Name: '+FriendlyName;
    lCodename.Caption:='Code Name: '+CodeName;
    if Features.PSN then
      lSerial.caption:='Serial Number: '+SerialNumber
    else
      lSerial.caption:='Serial Number is not supported.';
    sl:=TStringList.Create;
    Features.GetFeaturesStr(sl);
    sl.Add(Format('FDIV Bug=%d',[integer(FDIVBug)]));
    clbCPU.items.Clear;
    for i:=1 to sl.count-1 do begin
      clbCPU.items.Add(sl.Names[i]);
      clbCPU.Checked[clbCPU.items.count-1]:=Boolean(StrToInt(sl.Values[sl.Names[i]]));
    end;
    sl.Free;
    lLevel1.Caption:=Format('Level 1: %d KB (%d KB Data + %d KB Instruction)',[Cache.Level1,Cache.L1data,cache.L1Code]);
    lLevel2.Caption:=Format('Level 2: %d KB',[Cache.Level2]);
    lLevel3.Caption:=Format('Level 3: %d KB',[Cache.Level3]);
    CacheBox.Items.Clear;
    CacheBox.Items.AddStrings(Cache.Descriptions);
  end;
end;

procedure TfrmMSI_Overview.GetMemoryInfo;
begin
  pcMem.ActivePage:=tsmemGen;
  with SysInfo.Memory do begin
    eAG.text:=formatfloat('#,##',AllocGranularity);
    eAppAddr.text:=format('%s - %s',[inttohex(MinAppAddress,8),inttohex(MaxAppAddress,8)]);
    ePS.text:=formatfloat('#,##',PageSize);
  end;
end;

procedure TfrmMSI_Overview.GetDisplayInfo;
begin
  pcDisplay.ActivePage:=tsDisplay1;
  with SysInfo, Display do begin
    cbDisplay.Text:=Adapter;
    eChip.text:=Chipset;
    eDAC.text:=DAC;
    eBIOSString.text:=BIOSString;
    eMem.text:=IntToStr(Memory);
    eBIOS.text:=format('%s',[BIOSVersion]);
    edate.text:=format('%s',[BIOSDate]);
    with lvDisp, Items do begin
      Clear;
      with Add do begin
        Caption:='Technology';
        SubItems.Add(Technology);
      end;
      with Add do begin
        Caption:='Device Driver Version';
        SubItems.Add(format('%d',[DeviceDriverVersion]));
      end;
      with Add do begin
        Caption:='Resolution';
        SubItems.Add(Format('%d x %d - %d bit',[HorzRes,VertRes,ColorDepth]));
      end;
      with Add do begin
        Caption:='Physical Size';
        SubItems.Add(Format('(%d x %d) mm',[HorzSize,VertSize]));
      end;
      with Add do begin
        Caption:='Pixel Width';
        SubItems.Add(format('%d',[PixelWidth]));
      end;
      with Add do begin
        Caption:='Pixel Height';
        SubItems.Add(format('%d',[PixelHeight]));
      end;
      with Add do begin
        Caption:='Pixel Diagonal';
        SubItems.Add(format('%d',[PixelDiagonal]));
      end;
      with Add do begin
        Caption:='Font Resolution';
        SubItems.Add(format('%d dpi',[FontResolution]));
      end;
      if IsNT then
        with Add do begin
          Caption:='Vertical Refresh Rate';
          SubItems.Add(format('%d Hz',[VerticalRefreshRate]));
        end;
    end;
  end;
end;

procedure TfrmMSI_Overview.GetAPMInfo;
begin
  with SysInfo.APM do begin
    eAC.text:=GetACPSStr(ACPowerStatus);
    eBat.text:=GetBSStr(BatteryChargeStatus);
    if BatteryLifePercent<=100 then begin
      eBatFull.text:=formatseconds(BatteryLifeFullTime,true,false,false);
      eBatLife.text:=formatseconds(BatteryLifeTime,true,false,false);
      gAPM.Progress:=BatteryLifePercent;
    end else begin
      eBatFull.text:='<info not available>';
      eBatLife.text:='<info not available>';
    end;
  end;
end;

procedure TfrmMSI_Overview.GetMediaInfo;
var
  i :integer;
begin
  with SysInfo.Media do begin
    lvMedia.Items.beginUpdate;
    lvMedia.items.clear;
    for i:=0 to Devices.count-1 do
      with lvMedia.items.add do begin
        caption:=Devices[i];
        if i=GamePortIndex then
          imageindex:=iiGame
        else
          if i=SoundCardIndex then
            imageindex:=iiAdapter
          else
            imageindex:=iiSound;
      end;
    lvMedia.Items.EndUpdate;
    lvSound.Items.beginUpdate;
    lvSound.items.clear;
    for i:=0 to WaveIn.count-1 do
      with lvSound.items.add do begin
        caption:=WaveIn[i];
        SubItems.Add('Wave In');
        ImageIndex:=iiWave;
      end;
    for i:=0 to WaveOut.count-1 do
      with lvSound.items.add do begin
        caption:=WaveOut[i];
        SubItems.Add('Wave Out');
        ImageIndex:=iiWave;
      end;
    for i:=0 to MIDIIn.count-1 do
      with lvSound.items.add do begin
        caption:=MIDIIn[i];
        SubItems.Add('MIDI In');
        ImageIndex:=iiMIDI;
      end;
    for i:=0 to MIDIOut.count-1 do
      with lvSound.items.add do begin
        caption:=MIDIOut[i];
        SubItems.Add('MIDI Out');
        ImageIndex:=iiMIDI;
      end;
    for i:=0 to AUX.count-1 do
      with lvSound.items.add do begin
        caption:=AUX[i];
        SubItems.Add('AUX');
        ImageIndex:=iiAUX;
      end;
    for i:=0 to Mixer.count-1 do
      with lvSound.items.add do begin
        caption:=Mixer[i];
        SubItems.Add('Mixer');
        ImageIndex:=iiMixer;
      end;
  end;
  lvSound.Items.endUpdate;
end;

procedure TfrmMSI_Overview.GetNetInfo;
var
  i :integer;
begin
  with SysInfo.Network do begin
    pcNet.ActivePage:=tsNetGeneral;
    lvNetwork.items.clear;
    for i:=0 to Adapters.count-1 do
      with lvNetwork.items.add do begin
        caption:=Adapters[i];
        if CardAdapterIndex=i then
          imageindex:=iiAdapter
        else
          imageindex:=iiNet;
      end;
    lbIP.Items.Text:=IPAddresses.Text;
    lbMAC.Items.Text:=MACAddresses.Text;
    eWSDesc.Text:=Winsock.Description;
    eWSVer.Text:=Format('%d.%d',[Winsock.MajorVersion,Winsock.MinorVersion]);
    eWSStat.Text:=Winsock.Status;
    with TCPIP do begin
      eDomain.Text:=DomainName;
      eHost.Text:=HostName;
      eNode.Text:=NodeTypes[NodeType];
      eDNS.Text:=PrimaryDNSSuffix;
      cbxProxy.Checked:=EnableProxy;
      cbxRouting.Checked:=EnableRouting;
      cbxDNS.Checked:=EnableDNS;
      cbAdapters.Items.Clear;
      for i:=0 to AdapterCount-1 do
        cbAdapters.Items.Add(Adapter[i].Name);
      DNSBox.Items.Clear;
      for i:=0 to DNSServers.Count-1 do begin
        DNSBox.Items.Add(DNSServers[i]);
        if DNSSuffixes.Count>i then
          DNSBox.Items[DNSBox.Items.Count-1]:=DNSBox.Items[DNSBox.Items.Count-1]+' '+DNSSuffixes[i];
      end;
      if cbAdapters.Items.Count>0 then begin
        cbAdapters.ItemIndex:=0;
        cbAdaptersChange(nil);
      end;
    end;
  end;
end;

procedure TfrmMSI_Overview.GetDeviceInfo;
var
  i,c: integer;
  r,n: TTreeNode;
  cn,dn: string;
  pi: PInteger;
  ldc: TDeviceClass;
  RL: TResourceList;
begin
  ldc:=dcUnknown;
  with SysInfo, Devices, Tree,Items do begin
    c:=DeviceCount-1;
    BeginUpdate;
    while Count>0 do begin
      if Assigned(Items[Count-1].Data) then
        FreeMem(Items[Count-1].Data);
      Delete(Items[Count-1]);
    end;
    r:=Add(nil,GetMachine);
    r.ImageIndex:=0;
    r.SelectedIndex:=r.ImageIndex;
    n:=nil;
    for i:=0 to c do begin
      if Trim(Devices[i].ClassDesc)<>'' then
        cn:=Devices[i].ClassDesc
      else
        cn:=Devices[i].ClassName;
      if not Assigned(n) or (Devices[i].DeviceClass<>ldc) then begin
        ldc:=Devices[i].DeviceClass;
        n:=AddChild(r,cn);
        n.ImageIndex:=cDeviceImageIndex[Devices[i].DeviceClass];
        n.SelectedIndex:=n.ImageIndex;
      end;
      if Trim(Devices[i].FriendlyName)='' then
        dn:=Devices[i].Description
      else
        dn:=Devices[i].FriendlyName;
      with AddChild(n,dn) do begin
        ImageIndex:=n.ImageIndex;
        SelectedIndex:=ImageIndex;
        new(pi);
        pi^:=i;
        Data:=pi;
      end;
      n.AlphaSort;
    end;
    r.AlphaSort;
    r.Expand(False);
    EndUpdate;
  end;

  with SysInfo, Devices, ResList, Items do begin
    GetResourceList(RL);
    BeginUpdate;
    try
      Clear;
      for i:=0 to High(RL) do
        with Add do begin
          Caption:=RL[i].Resource;
          SubItems.Add(ResourceShareStr(RL[i].Share));
          SubItems.Add(RL[i].Device);
          ImageIndex:=cDeviceImageIndex[RL[i].DeviceClass];
        end;
    finally
      EndUpdate;
    end;
  end;
end;

procedure TfrmMSI_Overview.GetEngInfo;
var
  i: integer;
begin
  with SysInfo.Engines do begin
    if ODBC<>'' then
      lODBC.caption:='Open Database Connectivity '+ODBC
    else
      lODBC.caption:='Open Database Connectivity not found';
    if BDE<>'' then
      lBDE.caption:='Borland Database Engine '+BDE
    else
      lBDE.caption:='Borland Database Engine not found';
    if DAO<>'' then
      lDAO.caption:='Microsoft Data Access Objects '+DAO
    else
      lDAO.caption:='Microsoft Data Access Objects not found';
    if ADO<>'' then
      lADO.caption:='Microsoft ActiveX Data Objects '+ADO
    else
      lADO.caption:='Microsoft ActiveX Data Objects not found';
  end;
  with SysInfo.Engines.DirectX do begin
    if Version<>'' then begin
      lDirectX.caption:='Installed version: '+Version;
      lvDirectX.Items.beginUpdate;
      lvDirectX.items.clear;
      for i:=0 to Direct3D.count-1 do
        with lvDirectX.items.add do begin
          caption:=Direct3D[i];
          SubItems.Add('Direct3D');
          ImageIndex:=iiDirectX;
        end;
      for i:=0 to DirectMusic.count-1 do
        with lvDirectX.items.add do begin
          caption:=DirectMusic[i];
          SubItems.Add('DirectMusic');
          ImageIndex:=iiDirectX;
        end;
      for i:=0 to DirectPlay.count-1 do
        with lvDirectX.items.add do begin
          caption:=DirectPlay[i];
          SubItems.Add('DirectPlay');
          ImageIndex:=iiDirectX;
        end;
      lvDirectX.Items.endUpdate;
    end else
      lDirectX.caption:='Not installed.';
  end;
  with SysInfo.Engines.ASPI32 do begin
    if ASPI<>'' then
      lASPI.caption:='Adaptec ASPI '+ASPI
    else
      lASPI.caption:='Adaptec ASPI not found';
    //lvASPI.Items.beginUpdate;
    lvASPI.items.Clear;
    for i:=0 to Configuration.Adapter.Count-1 do
      with lvASPI.items.add do begin
        caption:=Configuration.Vendor[i]+Configuration.Product[i];
        SubItems.Add(Configuration.Revision[i]);
        SubItems.Add(Configuration.Adapter[i]);
        SubItems.Add(Configuration.ID[i]);
        SubItems.Add(Configuration.Typ[i]);
        SubItems.Add(Configuration.Spec[i]);
        ImageIndex:=-1;
      end;
    //lvASPI.Items.beginUpdate;
  end;
end;

procedure TfrmMSI_Overview.GetDriveInfo;
var
  i,j :integer;
  s :string;
begin
  j:=0;
  with SysInfo.Disk do begin
    cbDrive.items.clear;
    for i:=1 to length(AvailableDisks) do begin
      s:=uppercase(copy(AvailableDisks,i,1));
      cbDrive.items.add(s+':');
      if s=uppercase(copy(SysInfo.OS.Folders.Values['Windows'],1,1)) then
        j:=i-1;
    end;
    cbDrive.itemindex:=j;
    cbDriveChange(nil);
  end;
end;

procedure TfrmMSI_Overview.GetInfo;
begin
  screen.cursor:=crhourglass;
  try
    if pgWksta in DisplayedPages then
      GetWkstaInfo;
    if pgOS in DisplayedPages then
      GetOSInfo;
    if pgCPU in DisplayedPages then
      GetCPUInfo;
    if pgMem in DisplayedPages then
      GetMemoryInfo;
    if pgDisplay in DisplayedPages then
      GetDisplayInfo;
    if pgAPM in DisplayedPages then
      GetAPMInfo;
    if pgMedia in DisplayedPages then
      GetMediaInfo;
    if pgNet in DisplayedPages then
      GetNetInfo;
    if pgDev in DisplayedPages then
      GetDeviceInfo;
    if pgEng in DisplayedPages then
      GetEngInfo;
    if pgDisk in DisplayedPages then
      GetDriveInfo;
    if pgTZ in DisplayedPages then
      GetTZInfo;
    if pgPrn in DisplayedPages then
      GetPrintInfo;
    if pgStartup in DisplayedPages then
      GetStartupInfo;
    if pgSoftware in DisplayedPages then
      GetSWInfo;
    if pgIDE in DisplayedPages then
      GetIDEInfo;
  finally
    screen.cursor:=crdefault;
  end;
end;

procedure TfrmMSI_Overview.FormCreate(Sender: TObject);
begin
  Report:=TStringList.Create;
  DisplayedPages:=pgAll;
  pc.activepage:=tsWksta;
  pcCPU.ActivePage:=tsID;
  pcMachine.ActivePage:=tsMachineGeneral;
  pcSM.ActivePage:=tsBIOS;
  lTitle.Caption:=cCompName;
  lVer.Caption:='Version '+cVersion;
  FooterPanel.Caption:=cCopyright;
  pcOS.ActivePage:=tsGeneral;
  pcEng.ActivePage:=tsDirectX;
  pcDev.ActivePage:=tsDevTree;
  bRes.Visible:=IsNT;
  tsDevRes.TabVisible:=IsNT;
end;

procedure TfrmMSI_Overview.cmRefresh(Sender: TObject);
begin
  screen.cursor:=crhourglass;
  try
    SysInfo.Refresh;
    GetInfo;
  finally
    screen.cursor:=crdefault;
  end;
end;

procedure TfrmMSI_Overview.cmClose(Sender: TObject);
begin
  close;
end;

procedure TfrmMSI_Overview.cmEnvironment(Sender: TObject);
var
  i: integer;
begin
  with TdlgMSI_Detail.Create(Self) do begin
    Notebook.pageindex:=3;
    lTitle.Caption:='Environment';
    for i:=0 to SysInfo.OS.Environment.Count-1 do
      with lv.Items.Add do begin
        Caption:=SysInfo.OS.Environment.Names[i];
        SubItems.Add(SysInfo.OS.Environment.Values[SysInfo.OS.Environment.Names[i]]);
      end;
    showmodal;
    free;
  end;
end;

procedure TfrmMSI_Overview.cmCaps(Sender: TObject);
var
  i :integer;
  sl :TStringList;
begin
  with TdlgMSI_Detail.Create(self) do begin
    Notebook.pageindex:=1;
    sl:=TStringList.Create;
    case TComponent(sender).tag of
      0: begin
        lTitle.Caption:='Curve Capabilities';
        SysInfo.Display.GetCurveCapsStr(sl);
      end;
      1: begin
        lTitle.Caption:='Line Capabilities';
        SysInfo.Display.GetLineCapsStr(sl);
      end;
      2: begin
        lTitle.Caption:='Polygonal Capabilities';
        SysInfo.Display.GetPolygonCapsStr(sl);
      end;
      3: begin
        lTitle.Caption:='Raster Capabilities';
        SysInfo.Display.GetRasterCapsStr(sl);
      end;
      4: begin
        lTitle.Caption:='Text Capabilities';
        SysInfo.Display.GetTextCapsStr(sl);
      end;
      5: begin
        lTitle.Caption:='Shade Blend Capabilities';
        SysInfo.Display.GetShadeBlendCapsStr(sl);
      end;
      6: begin
        lTitle.Caption:='Color Management Capabilities';
        SysInfo.Display.GetColorMgmtCapsStr(sl);
      end;
    end;
    clb.items.clear;
    for i:=0 to sl.count-1 do begin
      clb.items.Add(sl.Names[i]);
      clb.Checked[clb.items.count-1]:=Boolean(StrToInt(sl.Values[sl.Names[i]]));
    end;
    sl.free;
    showmodal;
    free;
  end;
end;

procedure TfrmMSI_Overview.cmPrintSetup(Sender: TObject);
begin
  psd.execute;
end;


procedure TfrmMSI_Overview.cbDriveChange(Sender: TObject);
var
  p,i :Word;
  b :pchar;
  sl :TStringList;
begin
  with SysInfo.Disk do begin
    gdisk.progress:=0;
    b:=stralloc(255);
    p:=0;
    Drive:=copy(cbDrive.text,1,2);
    strpcopy(b,Drive+'\');
    lDriveType.caption:=GetMediaTypeStr(MediaType)+' - '+FileSystem;
    if MediaPresent then
      imgDrive.picture.icon.handle:=extractassociatedicon(hinstance,b,p)
    else
      imgDrive.picture.icon.handle:=0;
    strdispose(b);
    eUNC.text:=expanduncfilename(Drive);
    eDSN.text:=SerialNumber;
    if pos('[',cbdrive.items[cbdrive.itemindex])=0 then begin
      i:=cbdrive.itemindex;
      cbdrive.items[i]:=cbdrive.items[i]+' ['+VolumeLabel+']';
      cbdrive.itemindex:=i;
    end;
    lCapacity.caption:=formatfloat('Capacity: #,#0 B',Capacity);
    lFree.caption:=formatfloat('Free space: #,#0 B',FreeSpace);
    try
      gDisk.Progress:=round((Capacity-FreeSpace)/Capacity*100);
    except
    end;
    lBPS.caption:=formatfloat('Bytes/sector: 0',BytesPerSector);
    lSPC.caption:=formatfloat('Sector/cluster: 0',SectorsPerCluster);
    lFC.caption:=formatfloat('Free clusters: #,#0',FreeClusters);
    lTC.caption:=formatfloat('Total clusters: #,#0',TotalClusters);
    sl:=TStringList.Create;
    GetFileFlagsStr(sl);
    clbFlags.items.Clear;
    for i:=1 to sl.count-1 do begin
      clbFlags.items.Add(sl.Names[i]);
      clbFlags.Checked[clbFlags.items.count-1]:=Boolean(StrToInt(sl.Values[sl.Names[i]]));
    end;
    sl.Free;
  end;
end;

procedure TfrmMSI_Overview.cmReportClick(Sender: TObject);
var
  p :tpoint;
begin
  p.y:=twincontrol(sender).top+twincontrol(sender).height;
  p.x:=twincontrol(sender).left;
  p:=twincontrol(sender).parent.clienttoscreen(p);
  ReportMenu.Popup(p.x,p.y);
end;

procedure TfrmMSI_Overview.cmReportAll(Sender: TObject);
begin
  Report.Clear;
  sd.Filename:=MachineName+'_SystemInfo.xml';
  if sd.Execute then begin
    Screen.Cursor:=crHourGlass;
    try
      SysInfo.Report(Report);
      Report.SaveToFile(sd.Filename);
    finally
      Screen.Cursor:=crDefault;
    end;
  end;
end;

procedure TfrmMSI_Overview.cmReportCurrent(Sender: TObject);
begin
  Report.Clear;
  sd.Filename:=MachineName+'_'+Trim(pc.ActivePage.Caption)+'.xml';
  if sd.Execute then begin
    Screen.Cursor:=crHourGlass;
    try
    case pc.activepage.pageindex of
      0: SysInfo.Machine.Report(Report);
      1: SysInfo.OS.Report(Report);
      2: SysInfo.CPU.Report(Report);
      3: SysInfo.Memory.Report(Report);
      4: SysInfo.Display.Report(Report);
      5: SysInfo.APM.Report(Report);
      6: SysInfo.Media.Report(Report);
      7: SysInfo.Network.Report(Report);
      8: SysInfo.Devices.Report(Report);
      9: SysInfo.Printers.Report(Report);
      10: SysInfo.IDE.Report(Report);
      11: SysInfo.Engines.Report(Report);
      12: SysInfo.Disk.Report(Report);
      13: SysInfo.OS.TimeZone.Report(Report);
      14: SysInfo.Startup.Report(Report);
      15: SysInfo.Software.Report(Report);
    end;
    Report.SaveToFile(sd.filename);
    finally
      Screen.Cursor:=crDefault;
    end;
  end;
end;

procedure TfrmMSI_Overview.clbClickCheck(Sender: TObject);
var
  OCC: TNotifyEvent;
  idx: integer;
  p: TPoint;
begin
  with TCheckListBox(Sender) do begin
    OCC:=OnClickCheck;
    OnClickCheck:=nil;
    GetCursorPos(p);
    p:=ScreenToClient(p);
    idx:=ItemAtPos(p,True);
    if idx>-1 then
      Checked[idx]:=not Checked[idx];
    OnClickCheck:=OCC;
  end;
end;

procedure TfrmMSI_Overview.SetPages(const Value: TPages);
var
  i: integer;
begin
  FPages:=Value;
  for i:=pc.PageCount-1 downto 0 do begin
    pc.Pages[i].TabVisible:=TPage(i) in DisplayedPages;
    if pc.Pages[i].TabVisible then
      pc.ActivePage:=pc.Pages[i];
  end;
end;

procedure TfrmMSI_Overview.SetShowRepBut(const Value: Boolean);
begin
  FShowRepBut:=Value;
  bReport.Visible:=FShowRepBut;
end;

procedure TfrmMSI_Overview.cmModes(Sender: TObject);
var
  i: integer;
begin
  with TdlgMSI_Detail.Create(self) do begin
    Notebook.pageindex:=1;
    clb.items.clear;
    clb.Items.AddStrings(SysInfo.Display.Modes);
    for i:=0 to clb.Items.Count-1 do
      clb.Checked[i]:=True;
    lTitle.Caption:='Supported Video Modes';
    showmodal;
    free;
  end;
end;

procedure TfrmMSI_Overview.GetTZInfo;
begin
  with SysInfo.OS.TimeZone do begin
    eTZ.Text:=DisplayName;
    gbStd.Caption:=' '+StandardName+' ';
    gbDay.Caption:=' '+DaylightName+' ';
    eStdStart.Text:=DateTimeToStr(StandardStart);
    eStdBias.Text:=IntToStr(StandardBias);
    eDayStart.Text:=DateTimeToStr(DaylightStart);
    eDayBias.Text:=IntToStr(DaylightBias);
  end;
end;

procedure TfrmMSI_Overview.cmProto(Sender: TObject);
var
  i: integer;
begin
  with TdlgMSI_Detail.Create(self) do begin
    Notebook.pageindex:=1;
    clb.items.clear;
    clb.Items.AddStrings(SysInfo.Network.Protocols);
    for i:=0 to clb.Items.Count-1 do
      clb.Checked[i]:=True;
    lTitle.Caption:='Protocols';
    showmodal;
    free;
  end;
end;

procedure TfrmMSI_Overview.cmServ(Sender: TObject);
var
  i: integer;
begin
  with TdlgMSI_Detail.Create(self) do begin
    Notebook.pageindex:=1;
    clb.items.clear;
    clb.Items.AddStrings(SysInfo.Network.Services);
    for i:=0 to clb.Items.Count-1 do
      clb.Checked[i]:=True;
    lTitle.Caption:='Services';
    showmodal;
    free;
  end;
end;

procedure TfrmMSI_Overview.cmCli(Sender: TObject);
var
  i: integer;
begin
  with TdlgMSI_Detail.Create(self) do begin
    Notebook.pageindex:=1;
    clb.items.clear;
    clb.Items.AddStrings(SysInfo.Network.Clients);
    for i:=0 to clb.Items.Count-1 do
      clb.Checked[i]:=True;
    lTitle.Caption:='Clients';
    showmodal;
    free;
  end;
end;

procedure TfrmMSI_Overview.SetCaptionText(const Value: string);
begin
  Caption:=Value;
end;

procedure TfrmMSI_Overview.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmMSI_Overview.TreeChange(Sender: TObject; Node: TTreeNode);
begin
  bProps.Enabled:=Assigned(Node) and (Node.Level=2);
  bRes.Enabled:=bProps.Enabled;
end;

procedure TfrmMSI_Overview.cmProps(Sender: TObject);
var
  dr: TDevice;
  i: integer;
begin
  if Assigned(Tree.Selected) and (Tree.Selected.Level=2) then
    with TdlgMSI_Detail.Create(self) do begin
      Notebook.pageindex:=3;
      lv.items.clear;
      i:=PInteger(Tree.Selected.Data)^;
      dr:=SysInfo.Devices.Devices[i];
      with lv.Items.Add do begin
        Caption:='Device Name';
        Subitems.Add(Tree.Selected.Text);
      end;
      with lv.Items.Add do begin
        Caption:='Class Name';
        Subitems.Add(dr.ClassName);
      end;
      with lv.Items.Add do begin
        Caption:='Class Description';
        Subitems.Add(Tree.Selected.Parent.Text);
      end;
      with lv.Items.Add do begin
        Caption:='Class GUID';
        Subitems.Add(dr.GUID);
      end;
      with lv.Items.Add do begin
        Caption:='Manufacturer';
        Subitems.Add(dr.Manufacturer);
      end;
      with lv.Items.Add do begin
        Caption:='Location';
        SubItems.Add(dr.Location);
      end;
      with lv.Items.Add do begin
        Caption:='HardwareID';
        Subitems.Add(dr.HardwareID);
      end;
      with lv.Items.Add do begin
        Caption:='Driver Version';
        SubItems.Add(dr.DriverVersion);
      end;
      with lv.Items.Add do begin
        Caption:='Driver Date';
        SubItems.Add(dr.DriverDate);
      end;
      with lv.Items.Add do begin
        Caption:='Driver Provider';
        SubItems.Add(dr.DriverProvider);
      end;
      with lv.Items.Add do begin
        Caption:='Service Name';
        if dr.ServiceName='' then
          SubItems.Add(dr.Service)
        else
          SubItems.Add(dr.ServiceName);
      end;
      with lv.Items.Add do begin
        Caption:='Service Group';
        SubItems.Add(dr.ServiceGroup);
      end;
      lTitle.Caption:='Device Properties';
      showmodal;
      free;
    end;
end;

procedure TfrmMSI_Overview.cmMail(Sender: TObject);
begin
  ShellExecute(handle,'open',
               'mailto:mitec@atlas.cz?subject='+cCompName,
               nil,nil,SW_NORMAL);
end;

procedure TfrmMSI_Overview.GetPrintInfo;
var
  i: integer;
begin
  with SysInfo.Printers do begin
    lvPrinter.items.clear;
    for i:=0 to Names.count-1 do
      with lvPrinter.items.add do begin
        caption:=Names[i];
        SubItems.Add(Ports[i]);
        if Pos('\\',Ports[i])>0 then
          ImageIndex:=iiNetPrinter
        else
          ImageIndex:=iiPrinter;
        if i=DefaultIndex then
          ImageIndex:=ImageIndex+1;
      end;
  end;
end;

procedure TfrmMSI_Overview.tcStartupChange(Sender: TObject);
var
  i,c: integer;
begin
  with SysInfo, lvStartup, Items do begin
    BeginUpdate;
    Clear;
    case tcStartup.TabIndex of
      0: begin
        c:=Startup.User_Count-1;
        for i:=0 to c do
          with lvStartup.Items.Add do begin
            Caption:=Startup.User_Runs[i];
            SubItems.Add(GetSpecialFolder(GetDesktopWindow,CSIDL_STARTUP));
            SubItems.Add(Startup.GetRunCommand(rtUser,i));
            ImageIndex:=iiProcess;
          end;
        c:=Startup.Common_Count-1;
        for i:=0 to c do
          with lvStartup.Items.Add do begin
            Caption:=Startup.Common_Runs[i];
            SubItems.Add(GetSpecialFolder(GetDesktopWindow,CSIDL_COMMON_STARTUP));
            SubItems.Add(Startup.GetRunCommand(rtCommon,i));
            ImageIndex:=iiProcess;
          end;
      end;
      1: begin
        c:=Startup.HKCU_Count-1;
        for i:=0 to c do
          with lvStartup.Items.Add do begin
            Caption:=Startup.HKCU_Runs[i];
            SubItems.Add('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run');
            SubItems.Add(Startup.GetRunCommand(rtHKCU,i));
            ImageIndex:=iiProcess;
          end;
        c:=Startup.HKCUOnce_Count-1;
        for i:=0 to c do
          with lvStartup.Items.Add do begin
            Caption:=Startup.HKCUOnce_Runs[i];
            SubItems.Add('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce');
            SubItems.Add(Startup.GetRunCommand(rtHKCUOnce,i));
            ImageIndex:=iiProcess;
          end;
        c:=Startup.HKCUOnceEx_Count-1;
        for i:=0 to c do
          with lvStartup.Items.Add do begin
            Caption:=Startup.HKCUOnceEx_Runs[i];
            SubItems.Add('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnceEx');
            SubItems.Add(Startup.GetRunCommand(rtHKCUOnceEx,i));
            ImageIndex:=iiProcess;
          end;
        c:=Startup.HKCUServices_Count-1;
        for i:=0 to c do
          with lvStartup.Items.Add do begin
            Caption:=Startup.HKCUServices_Runs[i];
            SubItems.Add('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunServices');
            SubItems.Add(Startup.GetRunCommand(rtHKCUServices,i));
            ImageIndex:=iiProcess;
          end;
        c:=Startup.HKCUServicesOnce_Count-1;
        for i:=0 to c do
          with lvStartup.Items.Add do begin
            Caption:=Startup.HKCUServicesOnce_Runs[i];
            SubItems.Add('HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce');
            SubItems.Add(Startup.GetRunCommand(rtHKCUServicesOnce,i));
            ImageIndex:=iiProcess;
          end;
        c:=Startup.HKCULoad_Count-1;
        for i:=0 to c do
          with lvStartup.Items.Add do begin
            Caption:=Startup.HKCULoad_Runs[i];
            SubItems.Add('HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows');
            SubItems.Add(Startup.GetRunCommand(rtHKCULoad,i));
            ImageIndex:=iiProcess;
          end;
        c:=Startup.HKLM_Count-1;
        for i:=0 to c do
          with lvStartup.Items.Add do begin
            Caption:=Startup.HKLM_Runs[i];
            SubItems.Add('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run');
            SubItems.Add(Startup.GetRunCommand(rtHKLM,i));
            ImageIndex:=iiProcess;
          end;
        c:=Startup.HKLMOnce_Count-1;
        for i:=0 to c do
          with lvStartup.Items.Add do begin
            Caption:=Startup.HKLMOnce_Runs[i];
            SubItems.Add('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce');
            SubItems.Add(Startup.GetRunCommand(rtHKLMOnce,i));
            ImageIndex:=iiProcess;
          end;
        c:=Startup.HKLMOnceEx_Count-1;
        for i:=0 to c do
          with lvStartup.Items.Add do begin
            Caption:=Startup.HKLMOnceEx_Runs[i];
            SubItems.Add('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnceEx');
            SubItems.Add(Startup.GetRunCommand(rtHKLMOnceEx,i));
            ImageIndex:=iiProcess;
          end;
        c:=Startup.HKLMServices_Count-1;
        for i:=0 to c do
          with lvStartup.Items.Add do begin
            Caption:=Startup.HKLMServices_Runs[i];
            SubItems.Add('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices');
            SubItems.Add(Startup.GetRunCommand(rtHKLMServices,i));
            ImageIndex:=iiProcess;
          end;
        c:=Startup.HKLMServicesOnce_Count-1;
        for i:=0 to c do
          with lvStartup.Items.Add do begin
            Caption:=Startup.HKLMServicesOnce_Runs[i];
            SubItems.Add('HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce');
            SubItems.Add(Startup.GetRunCommand(rtHKLMServicesOnce,i));
            ImageIndex:=iiProcess;
          end;
        c:=Startup.HKLMSessionManager_Count-1;
        for i:=0 to c do
          with lvStartup.Items.Add do begin
            Caption:=Startup.HKLMSessionManager_Runs[i];
            SubItems.Add('HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager');
            SubItems.Add(Startup.GetRunCommand(rtHKLMSessionManager,i));
            ImageIndex:=iiProcess;
          end;
        c:=Startup.HKLMWinLogon_Count-1;
        for i:=0 to c do
          with lvStartup.Items.Add do begin
            Caption:=Startup.HKLMWinLogon_Runs[i];
            SubItems.Add('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsNT\CurrentVersion\Winlogon');
            SubItems.Add(Startup.GetRunCommand(rtHKLMWinLogon,i));
            ImageIndex:=iiProcess;
          end;
      end;
      2: begin
        c:=Startup.WININI_Count-1;
        for i:=0 to c do
          with lvStartup.Items.Add do begin
            Caption:=Startup.WININI_Runs[i];
            Subitems.Add('WIN.INI');
            Subitems.Add(Startup.GetRunCommand(rtWININI,i));
            ImageIndex:=iiProcess;
          end;
        c:=Startup.SYSTEMINI_Count-1;
        for i:=0 to c do
          with lvStartup.Items.Add do begin
            Caption:=Startup.SYSTEMINI_Runs[i];
            Subitems.Add('SYSTEM.INI');
            Subitems.Add(Startup.GetRunCommand(rtSYSTEMINI,i));
            ImageIndex:=iiProcess;
          end;
      end;
    end;
    EndUpdate;
  end;
end;

procedure TfrmMSI_Overview.GetStartupInfo;
begin
  tcStartupChange(tcStartup);
end;

procedure TfrmMSI_Overview.GetSWInfo;
var
  i: integer;
begin
  with SysInfo.Software, lvSW, Items do begin
    BeginUpdate;
    Clear;
    for i:=0 to Products.Count-1 do
      with Add do begin
        Caption:=Products[i];
        SubItems.Add(Uninstalls[i]);
        ImageIndex:=iiPackage;
      end;
    EndUpdate;
  end;
end;

procedure TfrmMSI_Overview.cmNTSpec(Sender: TObject);
var
  sl: TStringList;
  i: integer;
begin
  with TdlgMSI_Detail.Create(self) do begin
    Notebook.pageindex:=1;
    lTitle.Caption:='Installed Suites';
    clb.items.clear;
    sl:=TStringList.Create;
    SysInfo.OS.NTSpecific.GetInstalledSuitesStr(sl);
    for i:=0 to sl.count-1 do begin
      clb.items.Add(sl.Names[i]);
      clb.Checked[clb.items.count-1]:=Boolean(StrToInt(sl.Values[sl.Names[i]]));
    end;
    sl.Free;
    showmodal;
    free;
  end;
end;

procedure TfrmMSI_Overview.CPUUsageInterval(Sender: TObject;
  Value: Cardinal);
var
  keyState: TKeyboardState;
begin
  with SysInfo.Memory do begin
    GetInfo;
    ePT.text:=formatfloat('#,##',PhysicalTotal);
    ePF.text:=formatfloat('#,#0',PhysicalFree);
    eFT.text:=formatfloat('#,##',PageFileTotal);
    eFF.text:=formatfloat('#,#0',PageFileFree);
    eVT.text:=formatfloat('#,##',VirtualTotal);
    eVF.text:=formatfloat('#,#0',VirtualFree);
    try
      gMemory.Progress:=MemoryLoad;
      gPhys.MaxValue:=PhysicalTotal;
      gPhys.Progress:=PhysicalFree;
      gPage.MaxValue:=PageFileTotal;
      gPage.Progress:=PageFileFree;
      gVirt.MaxValue:=VirtualTotal;
      gVirt.Progress:=VirtualFree;
    except
    end;
    try
      pbGDI.Position:=Resources.GDI;
      pbUser.Position:=Resources.User;
      pbSystem.Position:=Resources.System;
      lGDI.Caption:=Format('GDI - %d%% free',[pbGDI.Position]);
      lUser.Caption:=Format('User - %d%% free',[pbUser.Position]);
      lSystem.Caption:=Format('System - %d%% free',[pbSystem.Position]);
    except
    end;
  end;
  try
    CPUGauge.Progress:=Value;
  except
  end;
  eSysTime.text:=FormatSeconds(GetTickCount/1000,true,false,false);
  GetKeyboardState(KeyState);
  if KeyState[VK_NUMLOCK]=1 then
    pNumLock.color:=clLime
  else
    pNumLock.color:=clSilver;
  if KeyState[VK_CAPITAL]=1 then
    pCapsLock.color:=clLime
  else
    pCapsLock.color:=clSilver;
  if KeyState[VK_SCROLL]=1 then
    pScrollLock.color:=clLime
  else
    pScrollLock.color:=clSilver;
end;

procedure TfrmMSI_Overview.cmWeb(Sender: TObject);
begin
  ShellExecute(handle,'open',
               'http://www.mitec.d2.cz',
               nil,nil,SW_NORMAL);
end;

procedure TfrmMSI_Overview.cbAdaptersChange(Sender: TObject);
var
  i: Integer;
begin
  if cbAdapters.ItemIndex>-1 then
  with AdapterList.Items, SysInfo.Network.TCPIP.Adapter[cbAdapters.ItemIndex] do begin
    Clear;
    ePA.Text:=Address;
    eAT.Text:=AdapterTypes[Typ];
    cbxDHCP.Checked:=EnableDHCP;
    cbxWINS.Checked:=HaveWINS;
    for i:=0 to IPAddress.Count-1 do
      with Add do begin
        Caption:='Local';
        SubItems.Add(IPAddress[i]);
        SubItems.Add(IPAddressMask[i]);
      end;
    for i:=0 to Gateway_IPAddress.Count-1 do
      with Add do begin
        Caption:='Gateway';
        SubItems.Add(Gateway_IPAddress[i]);
        SubItems.Add(Gateway_IPAddressMask[i]);
      end;
    for i:=0 to DHCP_IPAddress.Count-1 do
      with Add do begin
        Caption:='DHCP Server';
        SubItems.Add(DHCP_IPAddress[i]);
        SubItems.Add(DHCP_IPAddressMask[i]);
      end;
    for i:=0 to PrimaryWINS_IPAddress.Count-1 do
      with Add do begin
        Caption:='Primary WINS Server';
        SubItems.Add(PrimaryWINS_IPAddress[i]);
        SubItems.Add(PrimaryWINS_IPAddressMask[i]);
      end;
    for i:=0 to SecondaryWINS_IPAddress.Count-1 do
      with Add do begin
        Caption:='Secondary WINS Server';
        SubItems.Add(SecondaryWINS_IPAddress[i]);
        SubItems.Add(SecondaryWINS_IPAddressMask[i]);
      end;
  end;
end;

procedure TfrmMSI_Overview.cbxClick(Sender: TObject);
var
  oc: TNotifyEvent;
begin
  with TCheckBox(Sender) do begin
    oc:=OnClick;
    OnClick:=nil;
    Checked:=not Checked;
    OnClick:=oc;
  end;
end;

procedure TfrmMSI_Overview.FormDestroy(Sender: TObject);
var
  i: integer;
begin
  for i:=0 to Tree.Items.Count-1 do
    Dispose(Tree.Items[i].Data);
  Report.Free;
end;


procedure TfrmMSI_Overview.cbIDEChange(Sender: TObject);
var
  DeviceInfo: TDeviceInfo;
begin
  case cbIDE.ItemIndex of
    0: DeviceInfo:=SysInfo.IDE.PrimaryMaster;
    1: DeviceInfo:=SysInfo.IDE.PrimarySlave;
    2: DeviceInfo:=SysInfo.IDE.SecondaryMaster;
    3: DeviceInfo:=SysInfo.IDE.SecondarySlave;
  end;
  if not IsEmptyString(DeviceInfo.ModelNumber) then begin
    eIDEModel.Text:=DeviceInfo.ModelNumber;
    eIDESN.Text:=DeviceInfo.SerialNumber;
    eIDERev.Text:=DeviceInfo.RevisionNumber;
    eIDECyls.Text:=IntToStr(DeviceInfo.Cylinders);
    eIDEHeads.Text:=IntToStr(DeviceInfo.Heads);
    eIDESecs.Text:=IntToStr(DeviceInfo.SectorsPerTrack);
    eIDECap.Text:=Format('%d MB',[(DeviceInfo.Capacity div 1024) div 1024]);
  end else begin
    eIDEModel.Text:='<no device attached>';
    eIDESN.Text:='';
    eIDERev.Text:='';
    eIDECyls.Text:='';
    eIDEHeads.Text:='';
    eIDESecs.Text:='';
    eIDECap.Text:='';
  end;
end;

procedure TfrmMSI_Overview.GetIDEInfo;
begin
  SysInfo.IDE.GetInfo;
  cbIDE.ItemIndex:=0;
  cbIDE.OnChange(nil);
end;

procedure TfrmMSI_Overview.cmRes(Sender: TObject);
var
  d: TDevice;
  i: Integer;
  DR: TDeviceResources;
  dn: string;
begin
  if Assigned(Tree.Selected) and (Tree.Selected.Level=2) then begin
    i:=PInteger(Tree.Selected.Data)^;
    d:=SysInfo.Devices.Devices[i];
    if not IsEmptyString(d.ResourceListKey) then begin
      Screen.Cursor:=crHourGlass;
      try
        SysInfo.Devices.GetDeviceResources(d,DR);
      finally
        Screen.Cursor:=crDefault;
      end;
      if IsEmptyString(d.FriendlyName) then
        dn:=d.Description
      else
        dn:=d.FriendlyName;
      ShowResourcesDlg(dn,DR);
    end else
      MessageDlg('No resource list available.',mtInformation,[mbOK],0);
  end;
end;

end.
