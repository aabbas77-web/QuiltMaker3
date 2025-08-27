//---------------------------------------------------------------------------

#ifndef SplashH
#define SplashH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <Graphics.hpp>
//---------------------------------------------------------------------------
class TFormSplash : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel1;
	TImage *Image;
	TLabel *Label1;
private:	// User declarations
public:		// User declarations
    __fastcall TFormSplash(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormSplash *FormSplash;
//---------------------------------------------------------------------------
#endif
