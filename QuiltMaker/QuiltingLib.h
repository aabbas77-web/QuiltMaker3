//---------------------------------------------------------------------------
#ifndef QuiltingLibH
#define QuiltingLibH
//---------------------------------------------------------------------------
#include <vector.h>
#include "SystemInfoLib.h"
//---------------------------------------------------------------------------
#define		Round(x)	(((x)-int(x)>=0.5)?int(x)+1:int(x))
//---------------------------------------------------------------------------
#define		ql_PI		(3.1415926535897932384626433832795)
#define		ql_2PI		(6.283185307179586476925286766559)
#define		ql_PI2		(1.5707963267948966192313216916398)
//---------------------------------------------------------------------------
struct ql_Point
{
	double x,y;
};
//---------------------------------------------------------------------------
struct ql_Rect
{
	double left,top,right,bottom;
    double Width()
    {
     	return (right - left + 1.0);
    }
    double Height()
    {
     	return (bottom - top + 1.0);
    }
};
//---------------------------------------------------------------------------
#ifdef _DEMO_
const AnsiString c_strDemo =
	"[Demo]";
#else
const AnsiString c_strDemo =
	"";
#endif // _DEMO_
//---------------------------------------------------------------------------
typedef enum{stEof=-1,stContinousLine=0,stContinousArc=1,stDiscreteLine} ql_StitchType;
//---------------------------------------------------------------------------
const AnsiString c_strCompany =
	"AliSoft";
//---------------------------------------------------------------------------
const AnsiString c_strQuiltMaker =
	"QuiltMaker V1.0";
//---------------------------------------------------------------------------
const AnsiString c_strDemoVersionMessage =
	"This option exists only in full version...";
//---------------------------------------------------------------------------
const AnsiString c_strErrorInOpenQuiltingFile =
	"Couldn`t Open Quilting File...";
//---------------------------------------------------------------------------
const AnsiString c_strErrorInSaveQuiltingFile =
	"Couldn`t Save Quilting File...";
//---------------------------------------------------------------------------
const AnsiString c_strUntitledFile =
	"Untitled.vec";
//---------------------------------------------------------------------------
const int MaxVertexCount=20000;
//---------------------------------------------------------------------------
//----------------------------Quilting---------------------------------------
//---------------------------------------------------------------------------
struct ql_Stitch
{
	int Type;
	ql_Point Start;
    ql_Point End;
    ql_Point Center;
    int Direction;
    int Speed;
};
//---------------------------------------------------------------------------
typedef vector<ql_Stitch> ql_File;
//---------------------------------------------------------------------------
typedef vector<int> ql_Entities;
//---------------------------------------------------------------------------
typedef vector<ql_Entities> ql_Layers;
//---------------------------------------------------------------------------
//------------------------Procedures-----------------------------------------
//---------------------------------------------------------------------------
// res = x % y
double ql_Module(double x,double y);
//---------------------------------------------------------------------------
ql_Point qlPoint(double x,double y);
double ql_Distance(double x1,double y1,double x2,double y2);
ql_Rect ql_CalculateFrame(ql_File &QuiltingFile);
bool ql_LoadQuiltingFile(AnsiString strFileName,ql_File &QuiltingFile);
bool ql_SaveQuiltingFileAsDAT(AnsiString strFileName,ql_File &QuiltingFile);
void ql_DrawQuiltingFile(TCanvas *pCanvas,TRect &R,bool bKeepRatio,ql_File &QuiltingFile);
//---------------------------------------------------------------------------
void ql_InitializeSimulator(TRect &R,bool bKeepRatio,ql_File &QuiltingFile);
void ql_DrawStitch(TCanvas *pCanvas,ql_Stitch &QuiltingStitch);
//---------------------------------------------------------------------------
extern int g_nCheckSumOffset;
extern int g_nProtectionOffset;
//---------------------------------------------------------------------------
#endif
