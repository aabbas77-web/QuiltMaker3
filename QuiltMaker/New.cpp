//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "New.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "FormTranslation"
#pragma resource "*.dfm"
TFormNew *FormNew;
//---------------------------------------------------------------------------
__fastcall TFormNew::TFormNew(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFormNew::BitBtn1Click(TObject *Sender)
{
	try
    {
		StrToInt(EditWidth->Text);
    }
    catch(...)
    {
    	EditWidth->Color = TColor(0x00CCCCFF);
		MessageDlg("Invalid Number",mtError,TMsgDlgButtons()<<mbOK,0);
        return;
    }
    EditWidth->Color = clWindow;
	try
    {
		StrToInt(EditHeight->Text);
    }
    catch(...)
    {
    	EditHeight->Color = TColor(0x00CCCCFF);
		MessageDlg("Invalid Number",mtError,TMsgDlgButtons()<<mbOK,0);
        return;
    }
    EditHeight->Color = clWindow;
	ModalResult = mrOk;
}
//---------------------------------------------------------------------------
