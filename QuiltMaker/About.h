//---------------------------------------------------------------------------

#ifndef AboutH
#define AboutH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <ExtCtrls.hpp>
#include <Graphics.hpp>
//---------------------------------------------------------------------------
class TFormAbout : public TForm
{
__published:	// IDE-managed Components
	TPanel *Panel1;
	TBevel *Bevel2;
	TLabel *Label2;
	TLabel *Label1;
	TLabel *Label3;
	TLabel *Label7;
	TLabel *LabelURL;
	TLabel *LabelEMail;
	TLabel *Label6;
	TImage *Image2;
	TImage *Image1;
	TLabel *Label8;
	TLabel *Label9;
	TLabel *Label10;
	TButton *Button1;
	TLabel *Label4;
	TEdit *EditYourCode;
	TLabel *Label5;
	TEdit *EditRegisterationCode;
    void __fastcall Button1Click(TObject *Sender);
	void __fastcall LabelURLClick(TObject *Sender);
	void __fastcall LabelEMailClick(TObject *Sender);
	void __fastcall FormCreate(TObject *Sender);
	void __fastcall FormDestroy(TObject *Sender);
private:	// User declarations
public:		// User declarations
    __fastcall TFormAbout(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormAbout *FormAbout;
//---------------------------------------------------------------------------
#endif
