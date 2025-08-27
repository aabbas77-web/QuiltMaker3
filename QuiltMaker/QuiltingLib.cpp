//---------------------------------------------------------------------------
#include <vcl.h>
#include <values.h>
#pragma hdrstop
//---------------------------------------------------------------------------
#include "QuiltingLib.h"
#include "ProtectionLib.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------
int g_nCheckSumOffset = 0;
int g_nProtectionOffset = 0;
//---------------------------------------------------------------------------
// res = x % y
double ql_Module(double x,double y)
{
	double res;
    int n;
	n = x/y;
    res = x-n*y;
    return res;
}
//---------------------------------------------------------------------------
ql_Point qlPoint(double x,double y)
{
	ql_Point p;
    p.x = x;
    p.y = y;
    return p;
}
//---------------------------------------------------------------------------
double ql_Distance(double x1,double y1,double x2,double y2)
{
	return sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1));
}
//---------------------------------------------------------------------------
bool ql_LoadQuiltingFile(AnsiString strFileName,ql_File &QuiltingFile)
{
	try
    {
        TStringList *m_pList;
        try
        {
            m_pList = new TStringList();

            m_pList->LoadFromFile(strFileName);
            for(int i=0;i<m_pList->Count;)
            {
                if(m_pList->Strings[i] == "")
                {
                    m_pList->Delete(i);
                }
                else
                {
                    i++;
                }
            }

            QuiltingFile.clear();
            AnsiString strText;
            ql_Stitch QuiltingStitch;
            int nPos;
            for(int i=0;i<m_pList->Count;i++)
            {
                strText = m_pList->Strings[i].Trim();

                // Type
                nPos = strText.Pos(' ');
                if(nPos < 0)	break;
                QuiltingStitch.Type = StrToInt(strText.SubString(1,nPos-1));
                strText.Delete(1,nPos);

                // X1
                nPos = strText.Pos(' ');
                if(nPos < 0)	break;
                QuiltingStitch.Start.x = StrToInt(strText.SubString(1,nPos-1));
                strText.Delete(1,nPos);

                // Y1
                nPos = strText.Pos(' ');
                if(nPos < 0)	break;
                QuiltingStitch.Start.y = StrToInt(strText.SubString(1,nPos-1));
                strText.Delete(1,nPos);

                // X2
                nPos = strText.Pos(' ');
                if(nPos < 0)	break;
                QuiltingStitch.End.x = StrToInt(strText.SubString(1,nPos-1));
                strText.Delete(1,nPos);

                // Y2
                nPos = strText.Pos(' ');
                if(nPos < 0)	break;
                QuiltingStitch.End.y = StrToInt(strText.SubString(1,nPos-1));
                strText.Delete(1,nPos);

                // X3
                nPos = strText.Pos(' ');
                if(nPos < 0)	break;
                QuiltingStitch.Center.x = StrToInt(strText.SubString(1,nPos-1));
                strText.Delete(1,nPos);

                // Y3
                nPos = strText.Pos(' ');
                if(nPos < 0)	break;
                QuiltingStitch.Center.y = StrToInt(strText.SubString(1,nPos-1));
                strText.Delete(1,nPos);

                // Direction
                nPos = strText.Pos(' ');
                if(nPos < 0)	break;
                QuiltingStitch.Direction = StrToInt(strText.SubString(1,nPos-1));
                strText.Delete(1,nPos);

                // Speed
                QuiltingStitch.Speed = StrToInt(strText);

                // Set Dimensions in Meter
/*
                QuiltingStitch.Start.x /= 1000.0;
                QuiltingStitch.Start.y /= 1000.0;
                QuiltingStitch.End.x /= 1000.0;
                QuiltingStitch.End.y /= 1000.0;
                QuiltingStitch.Center.x /= 1000.0;
                QuiltingStitch.Center.y /= 1000.0;
*/
                QuiltingFile.push_back(QuiltingStitch);
            }
        }
        __finally
        {
	        if(m_pList)
    	    {
        	    delete m_pList;
            	m_pList = NULL;
	        }
        }
        return true;
    }
    catch(...)
    {
		MessageDlg(c_strErrorInOpenQuiltingFile,mtError,TMsgDlgButtons()<<mbOK,0);
        return false;
    }
}
//---------------------------------------------------------------------------
bool ql_SaveQuiltingFileAsDAT(AnsiString strFileName,ql_File &QuiltingFile)
{
    #ifdef _ANTI_DEBUG_
    pro_DebuggerCheck();
    pro_SoftIceCheck();
    #endif// _ANTI_DEBUG_
    TStringList *m_pList;

    int nOffset = 0;
    #ifdef _PROTECTED_
    // Rainbow Protection
    int nIndex = random(c_nResponsesSize);
    if(random(2))
    {
        nOffset = StrToInt("0x"+rb_GetQueryOutput(rb_EncQueryResponses0,nIndex)) - StrToInt("0x"+rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses0,nIndex)));
    }
    else
    {
        nOffset = StrToInt("0x"+rb_GetQueryOutput(rb_EncQueryResponses1,nIndex)) - StrToInt("0x"+rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses1,nIndex)));
    }
    #endif// _PROTECTED_
    nOffset = 10000*g_nCheckSumOffset;

    m_pList = new TStringList();
    ql_Stitch QuiltingStitch,PrevQuiltingStitch;
    AnsiString strText;
    double dEpsilon = 10.0,d;
    int nCount = QuiltingFile.size();
    if(nCount <= 0)	return false;

    QuiltingStitch = QuiltingFile[nCount-1];
    if(QuiltingStitch.Type != stEof)
    {
        QuiltingStitch.Type = stEof;
        QuiltingStitch.Start = QuiltingStitch.End;
        QuiltingStitch.End = qlPoint(0,0);
        QuiltingStitch.Center = qlPoint(0,0);
        QuiltingStitch.Direction = 0;
        QuiltingStitch.Speed = 0;
        QuiltingFile.push_back(QuiltingStitch);
    }

    PrevQuiltingStitch = QuiltingFile[0];
    for(UINT i=0;i<QuiltingFile.size();i++)
    {
        QuiltingStitch = QuiltingFile[i];

        d = ql_Distance(QuiltingStitch.Start.x,QuiltingStitch.Start.y,PrevQuiltingStitch.End.x,PrevQuiltingStitch.End.y);
        if((i > 0) && (d > dEpsilon))
        {
            strText = IntToStr(stDiscreteLine);
            strText += " ";
            strText += IntToStr(Round(PrevQuiltingStitch.End.x+0.75*nOffset));
            strText += " ";
            strText += IntToStr(Round(PrevQuiltingStitch.End.y+0.44*nOffset+0.34*g_nProtectionOffset));
            strText += " ";
            strText += IntToStr(Round(QuiltingStitch.Start.x+0.22*nOffset));
            strText += " ";
            strText += IntToStr(Round(QuiltingStitch.Start.y+0.88*nOffset+0.534*g_nProtectionOffset));
            strText += " ";
            strText += IntToStr(Round(QuiltingStitch.Center.x+0.12*nOffset));
            strText += " ";
            strText += IntToStr(Round(QuiltingStitch.Center.y+0.72*nOffset+2.33*g_nProtectionOffset));
            strText += " ";
            strText += IntToStr(Round(QuiltingStitch.Direction+1.23*nOffset));
            strText += " ";
            strText += IntToStr(Round(QuiltingStitch.Speed+2.77*nOffset+1.4*g_nProtectionOffset));
            m_pList->Add(strText);
        }

        strText = IntToStr((ql_StitchType)(QuiltingStitch.Type+0.45*nOffset*g_nProtectionOffset));
        strText += " ";
        strText += IntToStr(Round(QuiltingStitch.Start.x+3.34*nOffset+0.34*g_nProtectionOffset));
        strText += " ";
        strText += IntToStr(Round(QuiltingStitch.Start.y+4.78*nOffset));
        strText += " ";
        strText += IntToStr(Round(QuiltingStitch.End.x+3.99*nOffset+0.323*g_nProtectionOffset));
        strText += " ";
        strText += IntToStr(Round(QuiltingStitch.End.y+0.76*nOffset));
        strText += " ";
        strText += IntToStr(Round(QuiltingStitch.Center.x+2.2*nOffset+1.22*g_nProtectionOffset));
        strText += " ";
        strText += IntToStr(Round(QuiltingStitch.Center.y+1.77*nOffset));
        strText += " ";
        strText += IntToStr(Round(QuiltingStitch.Direction+1.4567*nOffset+0.92*g_nProtectionOffset));
        strText += " ";
        strText += IntToStr(Round(QuiltingStitch.Speed+2.37*nOffset));
        m_pList->Add(strText);

        PrevQuiltingStitch = QuiltingStitch;
    }
    if(m_pList)
    {
        m_pList->SaveToFile(strFileName);
        delete m_pList;
        m_pList = NULL;
    }
    
    return true;
}
//---------------------------------------------------------------------------
/*
bool ql_SaveQuiltingFileAsDAT(AnsiString strFileName,ql_File &QuiltingFile)
{
	try
    {
        TStringList *m_pList;
        try
        {
            int nOffset = 0;
			#ifdef _PROTECTED_
            // Rainbow Protection
            int nIndex = random(c_nResponsesSize);
            if(random(2))
            {
            	nOffset = StrToInt("0x"+rb_GetQueryOutput(rb_EncQueryResponses0,nIndex)) - StrToInt("0x"+rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses0,nIndex)));
            }
            else
            {
            	nOffset = StrToInt("0x"+rb_GetQueryOutput(rb_EncQueryResponses1,nIndex)) - StrToInt("0x"+rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses1,nIndex)));
            }
			#endif// _PROTECTED_
            nOffset = g_nOffset;

            m_pList = new TStringList();
            ql_Stitch QuiltingStitch,PrevQuiltingStitch;
            AnsiString strText;
            double dEpsilon = 10.0,d;
            int nCount = QuiltingFile.size()-abs(nOffset)*1000000;
            if(nCount <= 0)	return false;

            QuiltingStitch = QuiltingFile[nCount-1];
            if(QuiltingStitch.Type != stEof)
            {
				QuiltingStitch.Type = stEof;
                QuiltingStitch.Start = QuiltingStitch.End;
                QuiltingStitch.End = qlPoint(0,0);
                QuiltingStitch.Center = qlPoint(0,0);
                QuiltingStitch.Direction = 0;
                QuiltingStitch.Speed = 0;
                QuiltingFile.push_back(QuiltingStitch);
            }

            PrevQuiltingStitch = QuiltingFile[0];
            for(UINT i=0;i<QuiltingFile.size();i++)
            {
             	QuiltingStitch = QuiltingFile[i];

                d = ql_Distance(QuiltingStitch.Start.x,QuiltingStitch.Start.y,PrevQuiltingStitch.End.x,PrevQuiltingStitch.End.y);
                if((i > 0) && (d > dEpsilon))
                {
                    strText = IntToStr(stDiscreteLine);
                    strText += " ";
                    strText += IntToStr(Round(PrevQuiltingStitch.End.x));
                    strText += " ";
                    strText += IntToStr(Round(PrevQuiltingStitch.End.y));
                    strText += " ";
                    strText += IntToStr(Round(QuiltingStitch.Start.x));
                    strText += " ";
                    strText += IntToStr(Round(QuiltingStitch.Start.y));
                    strText += " ";
                    strText += IntToStr(Round(QuiltingStitch.Center.x));
                    strText += " ";
                    strText += IntToStr(Round(QuiltingStitch.Center.y));
                    strText += " ";
                    strText += IntToStr(QuiltingStitch.Direction);
                    strText += " ";
                    strText += IntToStr(QuiltingStitch.Speed);
                	m_pList->Add(strText);
                }

                strText = IntToStr(QuiltingStitch.Type);
                strText += " ";
                strText += IntToStr(Round(QuiltingStitch.Start.x));
                strText += " ";
                strText += IntToStr(Round(QuiltingStitch.Start.y));
                strText += " ";
                strText += IntToStr(Round(QuiltingStitch.End.x));
                strText += " ";
                strText += IntToStr(Round(QuiltingStitch.End.y));
                strText += " ";
                strText += IntToStr(Round(QuiltingStitch.Center.x));
                strText += " ";
                strText += IntToStr(Round(QuiltingStitch.Center.y));
                strText += " ";
                strText += IntToStr(QuiltingStitch.Direction);
                strText += " ";
                strText += IntToStr(QuiltingStitch.Speed);
                m_pList->Add(strText);

            	PrevQuiltingStitch = QuiltingStitch;
            }
        }
        __finally
        {
	        if(m_pList)
    	    {
            	m_pList->SaveToFile(strFileName);
        	    delete m_pList;
            	m_pList = NULL;
	        }
        }
        return true;
    }
    catch(...)
    {
		MessageDlg(c_strErrorInSaveQuiltingFile,mtError,TMsgDlgButtons()<<mbOK,0);
        return false;
    }
}
*/
//---------------------------------------------------------------------------
ql_Rect ql_CalculateFrame(ql_File &QuiltingFile)
{
	ql_Rect Frame;
	Frame.left = MAXDOUBLE;
	Frame.top = MAXDOUBLE;
	Frame.right = -MAXDOUBLE;
	Frame.bottom = -MAXDOUBLE;
    ql_Stitch QuiltingStitch;
	for(UINT i=0;i<QuiltingFile.size();i++)
    {
		QuiltingStitch = QuiltingFile[i];

		// Start
        if(Frame.left > QuiltingStitch.Start.x)
        	Frame.left = QuiltingStitch.Start.x;
        if(Frame.right < QuiltingStitch.Start.x)
        	Frame.right = QuiltingStitch.Start.x;
        if(Frame.top > QuiltingStitch.Start.y)
        	Frame.top = QuiltingStitch.Start.y;
        if(Frame.bottom < QuiltingStitch.Start.y)
        	Frame.bottom = QuiltingStitch.Start.y;

		// End
        if(Frame.left > QuiltingStitch.End.x)
        	Frame.left = QuiltingStitch.End.x;
        if(Frame.right < QuiltingStitch.End.x)
        	Frame.right = QuiltingStitch.End.x;
        if(Frame.top > QuiltingStitch.End.y)
        	Frame.top = QuiltingStitch.End.y;
        if(Frame.bottom < QuiltingStitch.End.y)
        	Frame.bottom = QuiltingStitch.End.y;

		// Center
        if(Frame.left > QuiltingStitch.Center.x)
        	Frame.left = QuiltingStitch.Center.x;
        if(Frame.right < QuiltingStitch.Center.x)
        	Frame.right = QuiltingStitch.Center.x;
        if(Frame.top > QuiltingStitch.Center.y)
        	Frame.top = QuiltingStitch.Center.y;
        if(Frame.bottom < QuiltingStitch.Center.y)
        	Frame.bottom = QuiltingStitch.Center.y;
    }
	return Frame;
}
//---------------------------------------------------------------------------
void ql_DrawQuiltingFile(TCanvas *pCanvas,TRect &R,bool bKeepRatio,ql_File &QuiltingFile)
{
    ql_Stitch QuiltingStitch;
    double Ax,Bx,Ay,By;
    ql_Rect Frame = ql_CalculateFrame(QuiltingFile);

    if(bKeepRatio)
    {
        double dRatio = Frame.Width() / Frame.Height();
        if(Frame.Width() >= Frame.Height())
        {
            Ax = R.Width()/Frame.Width();
            Bx = R.left - Ax * Frame.left;
            Ay = - (R.Width()/dRatio) / Frame.Height();
            By = R.top - Ay * Frame.bottom;
        }
        else
        {
            Ay = - R.Height() /Frame.Height();
            By = R.top - Ay * Frame.bottom;
            Ax = (dRatio*R.Height()) / Frame.Width();
            Bx = R.left - Ax * Frame.left;
        }
    }
    else
    {
        Ax = R.Width()/Frame.Width();
        Bx = R.left - Ax * Frame.left;
        Ay = - R.Height()/Frame.Height();
        By = R.top - Ay * Frame.bottom;
	}

	for(UINT i=0;i<QuiltingFile.size();i++)
    {
		QuiltingStitch = QuiltingFile[i];
        switch(QuiltingStitch.Type)
        {
         	case stEof:// End Of File
            {
             	break;
            }
         	case stContinousLine:// Continous Line
            {
            	pCanvas->Pen->Color = clBlack;
				pCanvas->Pen->Style = psSolid;
            	pCanvas->MoveTo(Ax*QuiltingStitch.Start.x+Bx,Ay*QuiltingStitch.Start.y+By);
                pCanvas->LineTo(Ax*QuiltingStitch.End.x+Bx,Ay*QuiltingStitch.End.y+By);
             	break;
            }
         	case stContinousArc:// Continous Arc
            {
                double Radius;
                ql_Point P1,P2,P3,P4;

				Radius = sqrt((QuiltingStitch.Start.x-QuiltingStitch.Center.x)*(QuiltingStitch.Start.x-QuiltingStitch.Center.x)+(QuiltingStitch.Start.y-QuiltingStitch.Center.y)*(QuiltingStitch.Start.y-QuiltingStitch.Center.y));
				P1.x = QuiltingStitch.Center.x - Radius;
				P1.y = QuiltingStitch.Center.y - Radius;
				P2.x = QuiltingStitch.Center.x + Radius;
				P2.y = QuiltingStitch.Center.y + Radius;

                if(!QuiltingStitch.Direction)
                {
	                P3.x = QuiltingStitch.Start.x;
	                P3.y = QuiltingStitch.Start.y;
	                P4.x = QuiltingStitch.End.x;
	                P4.y = QuiltingStitch.End.y;
                }
                else
				{
	                P3.x = QuiltingStitch.End.x;
	                P3.y = QuiltingStitch.End.y;
	                P4.x = QuiltingStitch.Start.x;
	                P4.y = QuiltingStitch.Start.y;
				}
				pCanvas->Pen->Color = clBlack;
				pCanvas->Pen->Style = psSolid;
                pCanvas->Arc(Ax*P1.x+Bx,Ay*P1.y+By,Ax*P2.x+Bx,Ay*P2.y+By,Ax*P3.x+Bx,Ay*P3.y+By,Ax*P4.x+Bx,Ay*P4.y+By);
             	break;
            }
         	case stDiscreteLine:// Discrete Line
            {
            	pCanvas->Pen->Color = clBlue;
            	pCanvas->Pen->Style = psDot;
            	pCanvas->MoveTo(Ax*QuiltingStitch.Start.x+Bx,Ay*QuiltingStitch.Start.y+By);
                pCanvas->LineTo(Ax*QuiltingStitch.End.x+Bx,Ay*QuiltingStitch.End.y+By);
             	break;
            }
        }
    }
}
//---------------------------------------------------------------------------
static double ql_Ax;
static double ql_Bx;
static double ql_Ay;
static double ql_By;
void ql_InitializeSimulator(TRect &R,bool bKeepRatio,ql_File &QuiltingFile)
{
    ql_Rect Frame = ql_CalculateFrame(QuiltingFile);

    if(bKeepRatio)
    {
        double dRatio = Frame.Width() / Frame.Height();
        if(Frame.Width() >= Frame.Height())
        {
            ql_Ax = R.Width()/Frame.Width();
            ql_Bx = R.left - ql_Ax * Frame.left;
            ql_Ay = - (R.Width()/dRatio) / Frame.Height();
            ql_By = R.top - ql_Ay * Frame.bottom;
        }
        else
        {
            ql_Ay = - R.Height() /Frame.Height();
            ql_By = R.top - ql_Ay * Frame.bottom;
            ql_Ax = (dRatio*R.Height()) / Frame.Width();
            ql_Bx = R.left - ql_Ax * Frame.left;
        }
    }
    else
    {
        ql_Ax = R.Width()/Frame.Width();
        ql_Bx = R.left - ql_Ax * Frame.left;
        ql_Ay = - R.Height()/Frame.Height();
        ql_By = R.top - ql_Ay * Frame.bottom;
	}
}
//---------------------------------------------------------------------------
void ql_DrawStitch(TCanvas *pCanvas,ql_Stitch &QuiltingStitch)
{
    switch(QuiltingStitch.Type)
    {
        case stEof:// End Of File
        {
            break;
        }
        case stContinousLine:// Continous Line
        {
            pCanvas->Pen->Color = clBlack;
            pCanvas->Pen->Style = psSolid;
            pCanvas->MoveTo(ql_Ax*QuiltingStitch.Start.x+ql_Bx,ql_Ay*QuiltingStitch.Start.y+ql_By);
            pCanvas->LineTo(ql_Ax*QuiltingStitch.End.x+ql_Bx,ql_Ay*QuiltingStitch.End.y+ql_By);
            break;
        }
        case stContinousArc:// Continous Arc
        {
            double Radius;
            ql_Point P1,P2,P3,P4;

            Radius = sqrt((QuiltingStitch.Start.x-QuiltingStitch.Center.x)*(QuiltingStitch.Start.x-QuiltingStitch.Center.x)+(QuiltingStitch.Start.y-QuiltingStitch.Center.y)*(QuiltingStitch.Start.y-QuiltingStitch.Center.y));
            P1.x = QuiltingStitch.Center.x - Radius;
            P1.y = QuiltingStitch.Center.y - Radius;
            P2.x = QuiltingStitch.Center.x + Radius;
            P2.y = QuiltingStitch.Center.y + Radius;

            if(!QuiltingStitch.Direction)
            {
                P3.x = QuiltingStitch.Start.x;
                P3.y = QuiltingStitch.Start.y;
                P4.x = QuiltingStitch.End.x;
                P4.y = QuiltingStitch.End.y;
            }
            else
            {
                P3.x = QuiltingStitch.End.x;
                P3.y = QuiltingStitch.End.y;
                P4.x = QuiltingStitch.Start.x;
                P4.y = QuiltingStitch.Start.y;
            }
            pCanvas->Pen->Color = clBlack;
            pCanvas->Pen->Style = psSolid;
            pCanvas->Arc(ql_Ax*P1.x+ql_Bx,ql_Ay*P1.y+ql_By,ql_Ax*P2.x+ql_Bx,ql_Ay*P2.y+ql_By,ql_Ax*P3.x+ql_Bx,ql_Ay*P3.y+ql_By,ql_Ax*P4.x+ql_Bx,ql_Ay*P4.y+ql_By);
            break;
        }
        case stDiscreteLine:// Discrete Line
        {
            pCanvas->Pen->Color = clBlue;
            pCanvas->Pen->Style = psDot;
            pCanvas->MoveTo(ql_Ax*QuiltingStitch.Start.x+ql_Bx,ql_Ay*QuiltingStitch.Start.y+ql_By);
            pCanvas->LineTo(ql_Ax*QuiltingStitch.End.x+ql_Bx,ql_Ay*QuiltingStitch.End.y+ql_By);
            break;
        }
    }
}
//---------------------------------------------------------------------------

