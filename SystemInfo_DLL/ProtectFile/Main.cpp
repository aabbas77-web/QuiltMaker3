//---------------------------------------------------------------------------
#include <vcl.h>
#include <stdio.h>
#pragma hdrstop

#include "Main.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFormMain *FormMain;
//---------------------------------------------------------------------------
__fastcall TFormMain::TFormMain(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::SpeedButton1Click(TObject *Sender)
{
	if(!OpenDialog->Execute())	return;
	EditFileName->Text = OpenDialog->FileName;	
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::SpeedButton2Click(TObject *Sender)
{
	if(EditFileName->Text == "")	return;
    int nCheckSum = m_pSystemInfo->CalculateCheckSum(EditFileName->Text);
	m_pSystemInfo->WriteToFile(EditFileName->Text,0x80,nCheckSum);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::FormCreate(TObject *Sender)
{
	m_pSystemInfo = new info_SystemInfo();
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::FormDestroy(TObject *Sender)
{
	if(m_pSystemInfo)
    {
     	delete m_pSystemInfo;
        m_pSystemInfo = NULL;
    }
}
//---------------------------------------------------------------------------

