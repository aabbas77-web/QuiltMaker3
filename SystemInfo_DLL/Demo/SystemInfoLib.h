//---------------------------------------------------------------------------
#ifndef SystemInfoLibH
#define SystemInfoLibH
//---------------------------------------------------------------------------
typedef void (*T_Pure_Proc)();
typedef char* (*T_Pure_Text_Func)();
//---------------------------------------------------------------------------
const AnsiString c_strKey = "\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Group Policy\\";
const AnsiString c_strSN = "Ord98";
//---------------------------------------------------------------------------
// Quilting
const int c_bySN_Base = 55;
const int c_byEncode_Base = 77;
//---------------------------------------------------------------------------
class info_SystemInfo
{
private:
	HINSTANCE hLib;
    T_Pure_Proc info_Initialize;
    T_Pure_Proc info_Finalize;
    T_Pure_Proc info_Refresh;

    T_Pure_Text_Func info_BIOS_Copyright;
    T_Pure_Text_Func info_BIOS_Date;
    T_Pure_Text_Func info_BIOS_ExtendedInfo;
    T_Pure_Text_Func info_BIOS_Name;

    T_Pure_Text_Func info_CPU_SN;
    T_Pure_Text_Func info_CPU_Vendor;
    T_Pure_Text_Func info_CPU_CodeName;
    T_Pure_Text_Func info_CPU_FriendlyName;

    T_Pure_Text_Func info_SMBIOS_Date;
    T_Pure_Text_Func info_SMBIOS_Vendor;
    T_Pure_Text_Func info_SMBIOS_Version;

    T_Pure_Text_Func info_MainBoard_Vendor;
    T_Pure_Text_Func info_MainBoard_Model;
    T_Pure_Text_Func info_MainBoard_Serial;
    T_Pure_Text_Func info_MainBoard_Version;

    T_Pure_Text_Func info_Display_Adapter;
    T_Pure_Text_Func info_Display_Chipset;
    T_Pure_Text_Func info_Display_BIOSDate;
    T_Pure_Text_Func info_Display_BIOSVersion;
    T_Pure_Text_Func info_Display_BIOSString;
public:
	info_SystemInfo();
    ~info_SystemInfo();
	void LoadSerial();
	void SaveSerial(int nSN);
    void Refresh();

    AnsiString BIOS_Copyright();
	AnsiString BIOS_Date();
	AnsiString BIOS_ExtendedInfo();
	AnsiString BIOS_Name();

	AnsiString CPU_SN();
	AnsiString CPU_Vendor();
	AnsiString CPU_CodeName();
	AnsiString CPU_FriendlyName();

	AnsiString SMBIOS_Date();
	AnsiString SMBIOS_Vendor();
	AnsiString SMBIOS_Version();

    AnsiString MainBoard_Vendor();
	AnsiString MainBoard_Model();
	AnsiString MainBoard_Serial();
	AnsiString MainBoard_Version();

    AnsiString Display_Adapter();
	AnsiString Display_Chipset();
	AnsiString Display_BIOSDate();
	AnsiString Display_BIOSVersion();
	AnsiString Display_BIOSString();

    int getSerialNumber(Byte byBase);
	int Encode(Byte byBase,int nValue);
	bool IsValidCopy();
	int CalculateCheckSum(AnsiString strFileName);
	int ReadCheckSum(AnsiString strFileName);
	void WriteToFile(AnsiString strFileName,int nPos,int nValue);

    int m_nSN;
};
//---------------------------------------------------------------------------
#endif
