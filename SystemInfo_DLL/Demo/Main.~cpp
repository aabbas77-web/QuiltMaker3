//---------------------------------------------------------------------------

#include <vcl.h>
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
void __fastcall TFormMain::FormCreate(TObject *Sender)
{
	m_pSystemInfo = new info_SystemInfo();

	Memo->Lines->Add("Bios Copyright:              "+m_pSystemInfo->BIOS_Copyright());
	Memo->Lines->Add("Bios Date:                   "+m_pSystemInfo->BIOS_Date());
	Memo->Lines->Add("Bios Extended Info:          "+m_pSystemInfo->BIOS_ExtendedInfo());
	Memo->Lines->Add("Bios Name:                   "+m_pSystemInfo->BIOS_Name());
	Memo->Lines->Add("CPU Serial Number:           "+m_pSystemInfo->CPU_SN());
	Memo->Lines->Add("CPU Vendor:                  "+m_pSystemInfo->CPU_Vendor());
	Memo->Lines->Add("CPU Code Name:               "+m_pSystemInfo->CPU_CodeName());
	Memo->Lines->Add("CPU Friendly Name:           "+m_pSystemInfo->CPU_FriendlyName());
	Memo->Lines->Add("SMBIOS Date:                 "+m_pSystemInfo->SMBIOS_Date());
	Memo->Lines->Add("SMBIOS Vendor:               "+m_pSystemInfo->SMBIOS_Vendor());
	Memo->Lines->Add("SMBIOS Version:              "+m_pSystemInfo->SMBIOS_Version());
	Memo->Lines->Add("MainBoard Vendor:            "+m_pSystemInfo->MainBoard_Vendor());
	Memo->Lines->Add("MainBoard Model:             "+m_pSystemInfo->MainBoard_Model());
	Memo->Lines->Add("MainBoard Serial:            "+m_pSystemInfo->MainBoard_Serial());
	Memo->Lines->Add("MainBoard Version:           "+m_pSystemInfo->MainBoard_Version());
	Memo->Lines->Add("Display Adapter:           "+m_pSystemInfo->Display_Adapter());
	Memo->Lines->Add("Display Chipset:           "+m_pSystemInfo->Display_Chipset());
	Memo->Lines->Add("Display BIOS Date:           "+m_pSystemInfo->Display_BIOSDate());
	Memo->Lines->Add("Display BIOS Version:           "+m_pSystemInfo->Display_BIOSVersion());
	Memo->Lines->Add("Display BIOS String:           "+m_pSystemInfo->Display_BIOSString());

	EditSN->Text = IntToStr(m_pSystemInfo->getSerialNumber(c_bySN_Base));
    IsValidCopy();
    Caption = IntToStr(m_pSystemInfo->CalculateCheckSum(Application->ExeName))+"  ,  "+IntToStr(m_pSystemInfo->ReadCheckSum(Application->ExeName));
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

void __fastcall TFormMain::SpeedButton1Click(TObject *Sender)
{
	EditEncode->Text = IntToStr(m_pSystemInfo->Encode(c_byEncode_Base,StrToInt(EditSN->Text)));
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::Button2Click(TObject *Sender)
{
	m_pSystemInfo->SaveSerial(StrToInt(EditEncode->Text));
    m_pSystemInfo->LoadSerial();
    IsValidCopy();
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::IsValidCopy()
{
    if(m_pSystemInfo->IsValidCopy())
    {
	    Label->Caption = "Valid Copy";
        Label->Font->Color = clLime;
    }
    else
    {
	    Label->Caption = "Invalid Copy";
        Label->Font->Color = clRed;
    }
}
//---------------------------------------------------------------------------

