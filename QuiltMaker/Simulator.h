//---------------------------------------------------------------------------
#ifndef SimulatorH
#define SimulatorH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Dialogs.hpp>
#include <ActnList.hpp>
#include <Menus.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <ToolWin.hpp>
//---------------------------------------------------------------------------
#include "QuiltingLib.h"
#include "CSPIN.h"
#include <Buttons.hpp>
#include "FormTranslation.h"
//---------------------------------------------------------------------------
class TFormSimulator : public TForm
{
__published:	// IDE-managed Components
	TOpenDialog *OpenDialogDAT;
	TSaveDialog *SaveDialogDAT;
	TActionList *ActionList1;
	TMainMenu *MainMenu1;
	TAction *AFile;
	TAction *AFileOpen;
	TAction *AFileSave;
	TAction *AFileSaveAs;
	TAction *AFileClose;
	TMenuItem *File1;
	TMenuItem *Open1;
	TMenuItem *N1;
	TMenuItem *Save1;
	TMenuItem *SaveAs1;
	TMenuItem *N2;
	TMenuItem *Close1;
	TStatusBar *StatusBar1;
	TPanel *Panel1;
	TToolBar *ToolBar1;
	TScrollBox *ScrollBox1;
	TImage *Image;
	TAction *ASimulator;
	TAction *ASimulatorPlay;
	TAction *ASimulatorPause;
	TAction *ASimulatorStop;
	TMenuItem *Simulator1;
	TMenuItem *Play1;
	TMenuItem *Pause1;
	TMenuItem *Stop1;
	TTimer *Timer;
	TCheckBox *CheckBoxKeepRatio;
	TCSpinEdit *CSpinEditDelay;
	TLabel *Label1;
	TAction *ASimulatorNext;
	TMenuItem *Next1;
	TToolButton *ToolButton1;
	TToolButton *ToolButton2;
	TToolButton *ToolButton3;
	TToolButton *ToolButton4;
	TToolButton *ToolButton5;
	TToolButton *ToolButton6;
	TToolButton *ToolButton7;
	TToolButton *ToolButton8;
	TToolButton *ToolButton9;
	TLabel *Label2;
	TEdit *EditSpeed;
	TSpeedButton *SpeedButtonChangeSpeed;
	TLabel *Label3;
	TEdit *EditElementIndex;
	TFormTranslation *FormTranslation1;
	void __fastcall AFileExecute(TObject *Sender);
	void __fastcall AFileOpenExecute(TObject *Sender);
	void __fastcall AFileSaveExecute(TObject *Sender);
	void __fastcall AFileSaveAsExecute(TObject *Sender);
	void __fastcall AFileCloseExecute(TObject *Sender);
	void __fastcall ASimulatorExecute(TObject *Sender);
	void __fastcall ASimulatorPlayExecute(TObject *Sender);
	void __fastcall ASimulatorPauseExecute(TObject *Sender);
	void __fastcall ASimulatorStopExecute(TObject *Sender);
	void __fastcall TimerTimer(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall ScrollBox1Resize(TObject *Sender);
	void __fastcall CSpinEditDelayChange(TObject *Sender);
	void __fastcall ASimulatorNextExecute(TObject *Sender);
	void __fastcall SpeedButtonChangeSpeedClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TFormSimulator(TComponent* Owner);
	void __fastcall ClearImage(TColor C);
    ql_File QuiltingFile;
	int m_nCurrentIndex;
    int d;
    TRect Frame;
    ql_Stitch QuiltingStitch;
};
//---------------------------------------------------------------------------
extern PACKAGE TFormSimulator *FormSimulator;
//---------------------------------------------------------------------------
#endif
