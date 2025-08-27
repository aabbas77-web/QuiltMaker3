//---------------------------------------------------------------------------
#include <vcl.h>
#include <stdio.h>
#include <registry.hpp>
#pragma hdrstop
//---------------------------------------------------------------------------
#include "SystemInfoLib.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------
info_SystemInfo::info_SystemInfo()
{
	hLib = LoadLibrary("wintrust.sic");
    info_Refresh = NULL;
	if(hLib == NULL)	return;
    info_Initialize = (T_Pure_Proc)GetProcAddress(hLib,"info_Initialize");
    info_Finalize = (T_Pure_Proc)GetProcAddress(hLib,"info_Finalize");
    info_Refresh = (T_Pure_Proc)GetProcAddress(hLib,"info_Refresh");

    info_BIOS_Copyright = (T_Pure_Text_Func)GetProcAddress(hLib,"info_Bios_Copyright");
    info_BIOS_Date = (T_Pure_Text_Func)GetProcAddress(hLib,"info_Bios_Date");
    info_BIOS_ExtendedInfo = (T_Pure_Text_Func)GetProcAddress(hLib,"info_Bios_ExtendedInfo");
    info_BIOS_Name = (T_Pure_Text_Func)GetProcAddress(hLib,"info_Bios_Name");

    info_CPU_SN = (T_Pure_Text_Func)GetProcAddress(hLib,"info_CPU_SN");
    info_CPU_Vendor = (T_Pure_Text_Func)GetProcAddress(hLib,"info_CPU_Vendor");
    info_CPU_CodeName = (T_Pure_Text_Func)GetProcAddress(hLib,"info_CPU_CodeName");
    info_CPU_FriendlyName = (T_Pure_Text_Func)GetProcAddress(hLib,"info_CPU_FriendlyName");

    info_SMBIOS_Date = (T_Pure_Text_Func)GetProcAddress(hLib,"info_SMBIOS_Date");
    info_SMBIOS_Vendor = (T_Pure_Text_Func)GetProcAddress(hLib,"info_SMBIOS_Vendor");
    info_SMBIOS_Version = (T_Pure_Text_Func)GetProcAddress(hLib,"info_SMBIOS_Version");

    info_MainBoard_Vendor = (T_Pure_Text_Func)GetProcAddress(hLib,"info_MainBoard_Vendor");
	info_MainBoard_Model = (T_Pure_Text_Func)GetProcAddress(hLib,"info_MainBoard_Model");
    info_MainBoard_Serial = (T_Pure_Text_Func)GetProcAddress(hLib,"info_MainBoard_Serial");
    info_MainBoard_Version = (T_Pure_Text_Func)GetProcAddress(hLib,"info_MainBoard_Version");

    info_Display_Adapter = (T_Pure_Text_Func)GetProcAddress(hLib,"info_Display_Adapter");
	info_Display_Chipset = (T_Pure_Text_Func)GetProcAddress(hLib,"info_Display_Chipset");
    info_Display_BIOSDate = (T_Pure_Text_Func)GetProcAddress(hLib,"info_Display_BIOSDate");
    info_Display_BIOSVersion = (T_Pure_Text_Func)GetProcAddress(hLib,"info_Display_BIOSVersion");
    info_Display_BIOSString = (T_Pure_Text_Func)GetProcAddress(hLib,"info_Display_BIOSString");

    if(info_Initialize)
    {
    	info_Initialize();
    }
    Refresh();

    m_nSN = 0;
    LoadSerial();
}
//---------------------------------------------------------------------------
info_SystemInfo::~info_SystemInfo()
{
	if(info_Finalize)
    {
     	info_Finalize();
    }
	FreeLibrary(hLib);
}
//---------------------------------------------------------------------------
void info_SystemInfo::Refresh()
{
	if(info_Refresh)
    {
     	info_Refresh();
    }
}	
//---------------------------------------------------------------------------
void info_SystemInfo::LoadSerial()
{
	m_nSN = 0;
    TRegistry *pReg = new TRegistry();
  	try
  	{
    	pReg->RootKey = HKEY_LOCAL_MACHINE;
    	// false because we do not want to create it if it doesn’t exist
    	if(pReg->OpenKey(c_strKey,true))
        {
	        if(!pReg->ValueExists(c_strSN))
    	    {
				m_nSN = 0;
	    		pReg->WriteInteger(c_strSN,m_nSN);
	        }
	    	m_nSN = pReg->ReadInteger(c_strSN);
        }
  	}
  	__finally
  	{
    	pReg->CloseKey();
    	if(pReg)	delete pReg;
  	}
}	
//---------------------------------------------------------------------------
void info_SystemInfo::SaveSerial(int nSN)
{
    TRegistry *pReg = new TRegistry();
  	try
  	{
    	pReg->RootKey = HKEY_LOCAL_MACHINE;
    	// true because we want to create it if it doesn’t exist
    	if(pReg->OpenKey(c_strKey,true))
        {
	    	pReg->WriteInteger(c_strSN,nSN);
        }
  	}
  	__finally
  	{
    	pReg->CloseKey();
    	if(pReg)	delete pReg;
  	}
}	
//---------------------------------------------------------------------------
AnsiString info_SystemInfo::BIOS_Copyright()
{
	if(info_BIOS_Copyright)
    {
     	return info_BIOS_Copyright();
    }
    return "";
}	
//---------------------------------------------------------------------------
AnsiString info_SystemInfo::BIOS_Date()
{
	if(info_BIOS_Date)
    {
     	return info_BIOS_Date();
    }
    return "";
}	
//---------------------------------------------------------------------------
AnsiString info_SystemInfo::BIOS_ExtendedInfo()
{
	if(info_BIOS_ExtendedInfo)
    {
     	return info_BIOS_ExtendedInfo();
    }
    return "";
}	
//---------------------------------------------------------------------------
AnsiString info_SystemInfo::BIOS_Name()
{
	if(info_BIOS_Name)
    {
     	return info_BIOS_Name();
    }
    return "";
}	
//---------------------------------------------------------------------------
AnsiString info_SystemInfo::CPU_SN()
{
	if(info_CPU_SN)
    {
     	return info_CPU_SN();
    }
    return "";
}	
//---------------------------------------------------------------------------
AnsiString info_SystemInfo::CPU_Vendor()
{
	if(info_CPU_Vendor)
    {
     	return info_CPU_Vendor();
    }
    return "";
}	
//---------------------------------------------------------------------------
AnsiString info_SystemInfo::CPU_CodeName()
{
	if(info_CPU_CodeName)
    {
     	return info_CPU_CodeName();
    }
    return "";
}
//---------------------------------------------------------------------------
AnsiString info_SystemInfo::CPU_FriendlyName()
{
	if(info_CPU_FriendlyName)
    {
     	return info_CPU_FriendlyName();
    }
    return "";
}
//---------------------------------------------------------------------------
AnsiString info_SystemInfo::SMBIOS_Date()
{
	if(info_SMBIOS_Date)
    {
     	return info_SMBIOS_Date();
    }
    return "";
}
//---------------------------------------------------------------------------
AnsiString info_SystemInfo::SMBIOS_Vendor()
{
	if(info_SMBIOS_Vendor)
    {
     	return info_SMBIOS_Vendor();
    }
    return "";
}
//---------------------------------------------------------------------------
AnsiString info_SystemInfo::SMBIOS_Version()
{
	if(info_SMBIOS_Version)
    {
     	return info_SMBIOS_Version();
    }
    return "";
}
//---------------------------------------------------------------------------
AnsiString info_SystemInfo::MainBoard_Vendor()
{
	if(info_MainBoard_Vendor)
    {
     	return info_MainBoard_Vendor();
    }
    return "";
}
//---------------------------------------------------------------------------
AnsiString info_SystemInfo::MainBoard_Model()
{
	if(info_MainBoard_Model)
    {
     	return info_MainBoard_Model();
    }
    return "";
}
//---------------------------------------------------------------------------
AnsiString info_SystemInfo::MainBoard_Serial()
{
	if(info_MainBoard_Serial)
    {
     	return info_MainBoard_Serial();
    }
    return "";
}
//---------------------------------------------------------------------------
AnsiString info_SystemInfo::MainBoard_Version()
{
	if(info_MainBoard_Version)
    {
     	return info_MainBoard_Version();
    }
    return "";
}
//---------------------------------------------------------------------------
AnsiString info_SystemInfo::Display_Adapter()
{
	if(info_Display_Adapter)
    {
     	return info_Display_Adapter();
    }
    return "";
}
//---------------------------------------------------------------------------
AnsiString info_SystemInfo::Display_Chipset()
{
	if(info_Display_Chipset)
    {
     	return info_Display_Chipset();
    }
    return "";
}
//---------------------------------------------------------------------------
AnsiString info_SystemInfo::Display_BIOSDate()
{
	if(info_Display_BIOSDate)
    {
     	return info_Display_BIOSDate();
    }
    return "";
}
//---------------------------------------------------------------------------
AnsiString info_SystemInfo::Display_BIOSVersion()
{
	if(info_Display_BIOSVersion)
    {
     	return info_Display_BIOSVersion();
    }
    return "";
}
//---------------------------------------------------------------------------
AnsiString info_SystemInfo::Display_BIOSString()
{
	if(info_Display_BIOSString)
    {
     	return info_Display_BIOSString();
    }
    return "";
}
//---------------------------------------------------------------------------
int info_SystemInfo::getSerialNumber(Byte byBase)
{
	int SN = 0;
    AnsiString strMix = BIOS_Date()+CPU_SN();
    for(int i=1;i<=strMix.Length();i++)
    {
	    SN += i*i*i*Byte(byBase+strMix[i]);
    }
	return SN;
}
//---------------------------------------------------------------------------
int info_SystemInfo::Encode(Byte byBase,int nValue)
{
	int SN = nValue/(byBase+1);
    SN = MaxLongint - SN;
    srand(SN);
    SN = rand();
	return SN;
}
//---------------------------------------------------------------------------
bool info_SystemInfo::IsValidCopy()
{
	bool bIsValidCopy;
	bIsValidCopy = (Encode(c_byEncode_Base,getSerialNumber(c_bySN_Base)) == m_nSN);
	return bIsValidCopy;
}
//---------------------------------------------------------------------------
int FileSize(FILE *file)
{
   int curpos,length;
   curpos = ftell(file);
   fseek(file,0L,SEEK_END);
   length = ftell(file);
   fseek(file,curpos,SEEK_SET);
   return length;
}
//---------------------------------------------------------------------------
int info_SystemInfo::CalculateCheckSum(AnsiString strFileName)
{
    FILE *file;
    int nFileSize;
    file = fopen(strFileName.c_str(),"rb");
    nFileSize = FileSize(file);
    Byte *pBuff = new Byte[nFileSize];
    fread(pBuff,nFileSize,1,file);
    fclose(file);

	int nCheckSum = 0;
    for(int i=0x90;i<nFileSize;i++)
    {
		nCheckSum += pBuff[i];
        if(nCheckSum >= 10000000)
        {
			nCheckSum = 0;
        }
    }
    if(pBuff)
    {
		delete[] pBuff;
        pBuff = NULL;
    }

	return nCheckSum;
}
//---------------------------------------------------------------------------
int info_SystemInfo::ReadCheckSum(AnsiString strFileName)
{
	int nCheckSum = 0;

    FILE *file;
    file = fopen(strFileName.c_str(),"rb");
   	fseek(file,0x80,SEEK_SET);
    fread(&nCheckSum,sizeof(int),1,file);
    fclose(file);

	return nCheckSum;
}
//---------------------------------------------------------------------------
void info_SystemInfo::WriteToFile(AnsiString strFileName,int nPos,int nValue)
{
    FILE *file;
    file = fopen(strFileName.c_str(),"r+");
   	fseek(file,nPos,SEEK_SET);
    fwrite(&nValue,sizeof(int),1,file);
    fclose(file);
}
//---------------------------------------------------------------------------

