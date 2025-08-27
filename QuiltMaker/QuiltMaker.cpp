//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("QuiltMaker.res");
USEFORM("Main.cpp", FormMain);
USEUNIT("quilt_Messages.cpp");
USEUNIT("api_VecApi.cpp");
USEUNIT("quilt_Strings.cpp");
USEFORM("Simulator.cpp", FormSimulator);
USEUNIT("QuiltingLib.cpp");
USEFORM("New.cpp", FormNew);
USEFORM("Splash.cpp", FormSplash);
USEFORM("About.cpp", FormAbout);
USEUNIT("..\SystemInfo_DLL\Demo\SystemInfoLib.cpp");
//---------------------------------------------------------------------------
#ifdef _PROTECTED_
#include "ProtectionLib.h"
#endif// _PROTECTED_
#include "Splash.h"
void ShowVendorMessage();
#include "api_VecApi.h"
#pragma startup ShowVendorMessage 64
//---------------------------------------------------------------------------
void ShowVendorMessage()
{
//	MessageDlg(DecodeMessage(c_strForMoreInformation),mtInformation,TMsgDlgButtons()<<mbOK,0);
}
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
	try
	{
        // load vecad.dll
        if(vlStartup()==FALSE)
        {
            MessageDlg("VECAD52.DLL is not found",mtError,TMsgDlgButtons()<<mbOK,0);
            exit(0);
        }
        else
        {
        	FormSplash = new TFormSplash(Application);
            FormSplash->Show();
            FormSplash->Update();

			Application->Initialize();
			Application->CreateForm(__classid(TFormMain), &FormMain);
		Application->CreateForm(__classid(TFormSimulator), &FormSimulator);
		Application->CreateForm(__classid(TFormNew), &FormNew);
		Application->CreateForm(__classid(TFormAbout), &FormAbout);
		if(FormSplash)
            {
             	FormSplash->Close();
                delete FormSplash;
                FormSplash = NULL;
            }

			Application->Run();
        }
	}
	catch(Exception &exception)
	{
		Application->ShowException(&exception);
	}
	return 0;
}
//---------------------------------------------------------------------------
