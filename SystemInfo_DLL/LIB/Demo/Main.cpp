//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Main.h"
#include "wintrust.h"
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
	info_Initialize();
    info_Refresh();

	Memo->Lines->Add("Bios Copyright:              "+AnsiString(info_Bios_Copyright()));
	Memo->Lines->Add("Bios Date:                   "+AnsiString(info_Bios_Date()));
	Memo->Lines->Add("Bios Extended Info:          "+AnsiString(info_Bios_ExtendedInfo()));
	Memo->Lines->Add("Bios Name:                   "+AnsiString(info_Bios_Name()));

	Memo->Lines->Add("CPU Serial Number:           "+AnsiString(info_CPU_SN()));
	Memo->Lines->Add("CPU Vendor:                  "+AnsiString(info_CPU_Vendor()));
	Memo->Lines->Add("CPU Code Name:               "+AnsiString(info_CPU_CodeName()));
	Memo->Lines->Add("CPU Friendly Name:           "+AnsiString(info_CPU_FriendlyName()));
	Memo->Lines->Add("SMBIOS Date:                 "+AnsiString(info_SMBIOS_Date()));
	Memo->Lines->Add("SMBIOS Vendor:               "+AnsiString(info_SMBIOS_Vendor()));
	Memo->Lines->Add("SMBIOS Version:              "+AnsiString(info_SMBIOS_Version()));
	Memo->Lines->Add("MainBoard Vendor:            "+AnsiString(info_MainBoard_Vendor()));
	Memo->Lines->Add("MainBoard Model:             "+AnsiString(info_MainBoard_Model()));
	Memo->Lines->Add("MainBoard Serial:            "+AnsiString(info_MainBoard_Serial()));
	Memo->Lines->Add("MainBoard Version:           "+AnsiString(info_MainBoard_Version()));
	Memo->Lines->Add("Display Adapter:           "+AnsiString(info_Display_Adapter()));
	Memo->Lines->Add("Display Chipset:           "+AnsiString(info_Display_Chipset()));
	Memo->Lines->Add("Display BIOS Date:           "+AnsiString(info_Display_BIOSDate()));
	Memo->Lines->Add("Display BIOS Version:           "+AnsiString(info_Display_BIOSVersion()));
	Memo->Lines->Add("Display BIOS String:           "+AnsiString(info_Display_BIOSString()));
/*
	EditSN->Text = IntToStr(info_getSerialNumber(c_bySN_Base));
    IsValidCopy();
    Caption = IntToStr(info_CalculateCheckSum(Application->ExeName))+"  ,  "+IntToStr(info_ReadCheckSum(Application->ExeName));
*/
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::FormDestroy(TObject *Sender)
{
	info_Finalize();	
}
//---------------------------------------------------------------------------
