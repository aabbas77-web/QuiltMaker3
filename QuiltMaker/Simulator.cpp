//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Simulator.h"
#include "Main.h"
#include "ProtectionLib.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "CSPIN"
#pragma link "FormTranslation"
#pragma resource "*.dfm"
TFormSimulator *FormSimulator;
//---------------------------------------------------------------------------
__fastcall TFormSimulator::TFormSimulator(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFormSimulator::ClearImage(TColor C)
{
	Image->Canvas->Pen->Color = C;
	Image->Canvas->Brush->Color = C;
	Image->Canvas->Brush->Style = bsSolid;
    Image->Canvas->FillRect(Rect(0,0,Image->Width,Image->Height));
}
//---------------------------------------------------------------------------
void __fastcall TFormSimulator::AFileExecute(TObject *Sender)
{
//	
}
//---------------------------------------------------------------------------
void __fastcall TFormSimulator::AFileOpenExecute(TObject *Sender)
{
	if(OpenDialogDAT->Execute())
    {
    	if(!ql_LoadQuiltingFile(OpenDialogDAT->FileName,QuiltingFile))	return;
        ClearImage(clWhite);
        Frame = Rect(0+d,0+d,Image->Width-d,Image->Height-d);
        ql_DrawQuiltingFile(Image->Canvas,Frame,CheckBoxKeepRatio->Checked,QuiltingFile);
    	Timer->Enabled = false;
		m_nCurrentIndex = -1;
    	EditElementIndex->Text = FormatFloat("0",m_nCurrentIndex);

		ASimulatorPlay->Enabled = true;
		ASimulatorPause->Enabled = true;
		ASimulatorStop->Enabled = true;
		ASimulatorNext->Enabled = true;
    }
}
//---------------------------------------------------------------------------
void __fastcall TFormSimulator::AFileSaveExecute(TObject *Sender)
{
	#ifdef _DEMO_
	MessageDlg(c_strDemoVersionMessage,mtInformation,TMsgDlgButtons()<<mbOK,0);
    #else
    if(SaveDialogDAT->FileName == "")
    	AFileSaveAsExecute(NULL);
    else
	    ql_SaveQuiltingFileAsDAT(SaveDialogDAT->FileName,QuiltingFile);
    #endif // _DEMO_
}
//---------------------------------------------------------------------------
void __fastcall TFormSimulator::AFileSaveAsExecute(TObject *Sender)
{
	#ifdef _DEMO_
	MessageDlg(c_strDemoVersionMessage,mtInformation,TMsgDlgButtons()<<mbOK,0);
    #else
	if(SaveDialogDAT->Execute())
    {
		ql_SaveQuiltingFileAsDAT(SaveDialogDAT->FileName,QuiltingFile);
    }
    #endif // _DEMO_
}
//---------------------------------------------------------------------------
void __fastcall TFormSimulator::AFileCloseExecute(TObject *Sender)
{
	Close();	
}
//---------------------------------------------------------------------------
void __fastcall TFormSimulator::ASimulatorExecute(TObject *Sender)
{
//	
}
//---------------------------------------------------------------------------

void __fastcall TFormSimulator::ASimulatorPlayExecute(TObject *Sender)
{
	if(m_nCurrentIndex == -1)
    {
		Frame = Rect(0+d,0+d,Image->Width-d,Image->Height-d);
		ql_InitializeSimulator(Frame,CheckBoxKeepRatio->Checked,QuiltingFile);
	    ClearImage(clWhite);
    }
	Timer->Interval = CSpinEditDelay->Value;	
    Timer->Enabled = true;
}
//---------------------------------------------------------------------------

void __fastcall TFormSimulator::ASimulatorPauseExecute(TObject *Sender)
{
    Timer->Enabled = false;
}
//---------------------------------------------------------------------------

void __fastcall TFormSimulator::ASimulatorStopExecute(TObject *Sender)
{
    Timer->Enabled = false;
	m_nCurrentIndex = -1;
    EditElementIndex->Text = FormatFloat("0",m_nCurrentIndex);
    ClearImage(clWhite);
}
//---------------------------------------------------------------------------

void __fastcall TFormSimulator::ASimulatorNextExecute(TObject *Sender)
{
	if(m_nCurrentIndex == -1)
    {
		Frame = Rect(0+d,0+d,Image->Width-d,Image->Height-d);
		ql_InitializeSimulator(Frame,CheckBoxKeepRatio->Checked,QuiltingFile);
	    ClearImage(clWhite);
    }
	TimerTimer(NULL);
}
//---------------------------------------------------------------------------

void __fastcall TFormSimulator::TimerTimer(TObject *Sender)
{
	m_nCurrentIndex++;
    EditElementIndex->Text = FormatFloat("0",m_nCurrentIndex);
	if(m_nCurrentIndex < (int)QuiltingFile.size())
    {
    	QuiltingStitch = QuiltingFile[m_nCurrentIndex];
    	EditSpeed->Text = IntToStr(QuiltingStitch.Speed);
		ql_DrawStitch(Image->Canvas,QuiltingStitch);

		#ifdef _PROTECTED_
    	// Rainbow Protection
        if(m_nCurrentIndex % 20 == 0)
        {
		    pro_DebuggerCheck();
		    pro_SoftIceCheck();
            int nIndex = random(c_nResponsesSize);
            if(random(2))
            {
                if(rb_GetQueryOutput(rb_EncQueryResponses0,nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses0,nIndex)))
                {
                    Caption = DecodeMessage(c_strRainbowDungleNotExists);
                    FormMain->Close();
                }
            }
            else
            {
                if(rb_GetQueryOutput(rb_EncQueryResponses1,nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses1,nIndex)))
                {
                    Caption = DecodeMessage(c_strRainbowDungleNotExists);
                    FormMain->Close();
                }
            }
        }
		#endif// _PROTECTED_
    }
    else
    {
	    Timer->Enabled = false;
		m_nCurrentIndex = -1;
    }
}
//---------------------------------------------------------------------------

void __fastcall TFormSimulator::FormCreate(TObject *Sender)
{
	m_nCurrentIndex = -1;
    EditElementIndex->Text = FormatFloat("0",m_nCurrentIndex);
    d = 20;

    Left = 0;
    Top = 0;
    Width = Screen->Width;
    Height = Screen->Height - 30;

	Image->Left = 0;
	Image->Top = 0;
}
//---------------------------------------------------------------------------

void __fastcall TFormSimulator::ScrollBox1Resize(TObject *Sender)
{
	Image->Picture->Bitmap->Width = ScrollBox1->ClientWidth;
    Image->Picture->Bitmap->Height = ScrollBox1->ClientHeight;
}
//---------------------------------------------------------------------------

void __fastcall TFormSimulator::CSpinEditDelayChange(TObject *Sender)
{
	Timer->Interval = CSpinEditDelay->Value;	
}
//---------------------------------------------------------------------------

void __fastcall TFormSimulator::SpeedButtonChangeSpeedClick(
      TObject *Sender)
{
	if(m_nCurrentIndex < (int)QuiltingFile.size())
    {
		QuiltingFile[m_nCurrentIndex].Speed = StrToInt(EditSpeed->Text);
    }
}
//---------------------------------------------------------------------------

