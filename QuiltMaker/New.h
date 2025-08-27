//---------------------------------------------------------------------------

#ifndef NewH
#define NewH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <Buttons.hpp>
#include "FormTranslation.h"
//---------------------------------------------------------------------------
class TFormNew : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel1;
	TPanel *Panel2;
	TBitBtn *BitBtn1;
	TBitBtn *BitBtn2;
	TLabel *Label1;
	TEdit *EditWidth;
	TLabel *Label2;
	TEdit *EditHeight;
	TFormTranslation *FormTranslation1;
	void __fastcall BitBtn1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
	__fastcall TFormNew(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormNew *FormNew;
//---------------------------------------------------------------------------
#endif
