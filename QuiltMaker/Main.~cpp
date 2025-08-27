//---------------------------------------------------------------------------

#include <vcl.h>
#include <math.hpp>
#pragma hdrstop

#include "Main.h"
#include "api_VecApi.h"
#include "quilt_Messages.h"
#include "About.h"
#include "Simulator.h"
#include "ProtectionLib.h"
#include "New.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "FormTranslation"
#pragma link "CSPIN"
#pragma resource "*.dfm"
TFormMain *FormMain;
//---------------------------------------------------------------------------
const int ALISOFT_REG_CODE_5_2 = 330001309;
//---------------------------------------------------------------------------
__fastcall TFormMain::TFormMain(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::EnableActions(bool bValue)
{
	Menu = MainMenu2;

    // Draw
    ADrawLine->Enabled = bValue;
    ADrawRectangle->Enabled = bValue;
    ADrawPolyline->Enabled = bValue;
    ADrawArcCSE->Enabled = bValue;
    ADrawArcSEM->Enabled = bValue;
    ADrawArcSME->Enabled = bValue;
    ADrawCircleCR->Enabled = bValue;
    ADrawCircleCD->Enabled = bValue;
    ADrawCircle2P->Enabled = bValue;
    ADrawCircle3P->Enabled = bValue;
    ADrawEllipse->Enabled = bValue;

    // Edit
    AEditEntProp->Enabled = bValue;
    AEditCopy->Enabled = bValue;
    AEditMove->Enabled = bValue;
    AEditRotate->Enabled = bValue;
    AEditScale->Enabled = bValue;
    AEditMirror->Enabled = bValue;
    AEditErase->Enabled = bValue;
    AEditUndo->Enabled = bValue;
    AEditRedo->Enabled = bValue;
    AEditCutCB->Enabled = bValue;
    AEditCopyCB->Enabled = bValue;
    AEditPasteCB->Enabled = bValue;
    AEditSetJump->Enabled = bValue;
    AEditSetNormal->Enabled = bValue;
    AEditExplode->Enabled = bValue;
    AEditJoin->Enabled = bValue;

	// Entity
	AEntityBuildList->Enabled = bValue;

    // File
    AFileChangeDim->Enabled = bValue;
    AFileSave->Enabled = bValue;
    AFileSaveAs->Enabled = bValue;
    AFileExport->Enabled = bValue;
    AFileClose->Enabled = bValue;
    AFileCloseAll->Enabled = bValue;
    AFileExportDAT->Enabled = bValue;

    // Snap
    ASnapDlg->Enabled = bValue;
    ASnapGrid->Enabled = bValue;
    ASnapPolar->Enabled = bValue;
    ASnapGrips->Enabled = bValue;
    ASnapPoint->Enabled = bValue;
    ASnapNear->Enabled = bValue;
    ASnapEnd->Enabled = bValue;
    ASnapMid->Enabled = bValue;
    ASnapCenter->Enabled = bValue;
    ASnapPerpendicular->Enabled = bValue;
    ASnapTangent->Enabled = bValue;

    // Tools
    AToolsNavigator->Enabled = bValue;

    // Trace
    ATraceBackground->Enabled = bValue;
    ATraceTool->Enabled = bValue;

    // Zoom
    AZoomAll->Enabled = bValue;
    AZoomWindow->Enabled = bValue;
    AZoomIn->Enabled = bValue;
    AZoomOut->Enabled = bValue;
    AZoomPanWindow->Enabled = bValue;
    ZoomToPrev->Enabled = bValue;

	Menu = MainMenu1;
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::BuildEntitiesList()
{
	ListBoxEntities->Clear();
    EnableActions(false);
	if(vlDocGetActive() < 0)	return;
    EnableActions(true);
	if(!g_bGenerateNamesList)	return;
    if(TheEnd) return;
    ql_Layers Layers;
    ExtractLayers(Layers);

    int nLayersCount;
    int nEntitiesCount;
    int nEntityType;
    int nPointsCount;
    int nEntityIndex;
    int nEntColor;

    nLayersCount=Layers.size();
    for(int nLayerIndex=0;nLayerIndex<nLayersCount;nLayerIndex++)
    {
        nEntitiesCount=Layers[nLayerIndex].size();
        if(nEntitiesCount<=0)    continue;
        for(int k=0;k<nEntitiesCount;k++)
        {
            nEntityIndex = Layers[nLayerIndex][k];
            if(nEntityIndex == m_nWorkingAreaRectIndex)	continue;
            nEntityType = vlPropGetInt(VD_ENT_TYPE,nEntityIndex);

            AnsiString strEntityName = FormatFloat("Unknown0000",nEntityIndex);
        	switch(nEntityType)
            {
             	case VL_ENT_POINT:
                {
                	strEntityName = FormatFloat("Point0000",nEntityIndex);
                 	break;
                }
             	case VL_ENT_LINE:
                {
                	strEntityName = FormatFloat("Line0000",nEntityIndex);
                 	break;
                }
             	case VL_ENT_POLY:
                {
                	strEntityName = FormatFloat("Polyline0000",nEntityIndex);
                 	break;
                }
             	case VL_ENT_CIRCLE:
                {
                	strEntityName = FormatFloat("Circle0000",nEntityIndex);
                 	break;
                }
             	case VL_ENT_ARC:
                {
                	strEntityName = FormatFloat("Arc0000",nEntityIndex);
                 	break;
                }
             	case VL_ENT_ARC2:
                {
                	strEntityName = FormatFloat("Arc20000",nEntityIndex);
                 	break;
                }
             	case VL_ENT_ELLIPSE:
                {
                	strEntityName = FormatFloat("Ellipse0000",nEntityIndex);
                 	break;
                }
             	case VL_ENT_TEXT:
                {
                	strEntityName = FormatFloat("Text0000",nEntityIndex);
                 	break;
                }
             	case VL_ENT_BITMAP:
                {
                	strEntityName = FormatFloat("Bitmap0000",nEntityIndex);
                 	break;
                }
             	case VL_ENT_INSBLOCK:
                {
                	strEntityName = FormatFloat("Block0000",nEntityIndex);
                 	break;
                }
             	case VL_ENT_HATCH:
                {
                	strEntityName = FormatFloat("Hatch0000",nEntityIndex);
                 	break;
                }
             	case VL_ENT_FLOOD:
                {
                	strEntityName = FormatFloat("Flood0000",nEntityIndex);
                 	break;
                }
             	case VL_ENT_RECT:
                {
                	strEntityName = FormatFloat("Rect0000",nEntityIndex);
                 	break;
                }
             	case VL_ENT_DIMLIN:
                {
                	strEntityName = FormatFloat("DimLin0000",nEntityIndex);
                 	break;
                }
             	case VL_ENT_DIMANG:
                {
                	strEntityName = FormatFloat("DimAng0000",nEntityIndex);
                 	break;
                }
             	case VL_ENT_DIMRAD:
                {
                	strEntityName = FormatFloat("DimRad0000",nEntityIndex);
                 	break;
                }
             	case VL_ENT_DIMDIAM:
                {
                	strEntityName = FormatFloat("DimDiam0000",nEntityIndex);
                 	break;
                }
             	case VL_ENT_DIMORD:
                {
                	strEntityName = FormatFloat("DimOrd0000",nEntityIndex);
                 	break;
                }
             	case VL_ENT_INSDWG:
                {
                	strEntityName = FormatFloat("InsDwg0000",nEntityIndex);
                 	break;
                }
             	case VL_ENT_CUSTOM:
                {
                	strEntityName = FormatFloat("Custom0000",nEntityIndex);
                 	break;
                }
            }

            nEntColor = vlPropGetInt(VD_ENT_COLOR,nEntityIndex);
            if(nEntColor == clBlue)
            {
                strEntityName = "<------Jump------>";
            }

            ListBoxEntities->Items->AddObject(strEntityName,(TObject *)nEntityIndex);
        }
    }
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::NewDocument(AnsiString strFileName,int nWidth,int nHeight)
{
    if(TheEnd) return;

    int DocIndex = vlFileNew(ghwVec,"");
    vlPropPut(VD_DWG_FILENAME,DocIndex,strFileName.c_str());
    ListBoxOpenedFiles->Items->AddObject(ExtractFileName(strFileName),(TObject *)DocIndex);

    m_nBackgroundLayer = vlLayerIndex("",0);
    vlPropPut(VD_LAYER_NAME,m_nBackgroundLayer,"Background");
    vlPropPutInt(VD_LAYER_LEVEL,m_nBackgroundLayer,0);
    vlPropPutInt(VD_LAYER_COLOR,m_nBackgroundLayer,clRed);
    vlPropPutInt(VD_LAYER_FILLCOLOR,m_nBackgroundLayer,clRed);

    m_nWorkingAreaRectIndex = vlAddRect(nWidth/2.0, nHeight/2.0, nWidth, nHeight, 0, 0);
    vlPropPutInt(VD_ENT_COLOR,m_nWorkingAreaRectIndex,clRed);

    m_nDrawingLayer = vlLayerAdd("Drawing",1.0,clBlack,clBlack);
    vlPropPutInt(VD_LAYER_LEVEL,m_nDrawingLayer,1);

    vlPropPutInt(VD_DWG_SORTLAYERS,DocIndex,true);

    // Disable Selection on All Layers (Just On active layer)
    vlPropPutInt(VD_DWG_SELACTLAYER,DocIndex,true);

    // Units in Meter
//    vlPropPutInt(VD_UNITS_LIN,DocIndex,VL_UNIT_MET);
//    vlPropPutInt(VD_UNITS_SCALE,DocIndex,VL_UNIT_MET);

    //vlPropPutInt(VD_LAYER_SELINSIDE,-1,false);

   	// Setup Grid
//    vlPropPutInt(VD_GRID_DX,DocIndex,1.0);
//    vlPropPutInt(VD_GRID_DY,DocIndex,1.0);
//    vlPropPutInt(VD_GRID_BSTEPX,DocIndex,1.0);
//    vlPropPutInt(VD_GRID_BSTEPY,DocIndex,1.0);

    // Background Color
//    vlPropPutInt(VD_DWG_COLPAGE,-1,0x00C0DCC0);

    // Grid Color
//    vlPropPutInt(VD_GRID_COLOR,-1,clNavy);
//    vlPropPutInt(VD_GRID_BCOLOR,-1,clNavy);
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::OpenDATFile(AnsiString strFileName)
{
    if(!ql_LoadQuiltingFile(strFileName,QuiltingFile))	return;
    DrawQuiltingFile(strFileName);
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::DrawQuiltingArc(ql_Stitch &QuiltingStitch)
{
    double Radius;
    int nObjIndex;
    ql_Point Start,End,Middle,Center;
    double AngS,AngE,AngM;

    Start = QuiltingStitch.Start;
    End = QuiltingStitch.End;
    Center = QuiltingStitch.Center;
    Radius = sqrt((Start.x-Center.x)*(Start.x-Center.x)+(Start.y-Center.y)*(Start.y-Center.y));

    if(Start.x - Center.x != 0.0)
        AngS = RadToDeg(ArcTan2(Start.y - Center.y,Start.x - Center.x));
    else
    {
        if(Start.y - Center.y >= 0.0)
            AngS = +90.0;
        else
            AngS = -90.0;
    }

    if(End.x - Center.x != 0.0)
        AngE = RadToDeg(ArcTan2(End.y - Center.y,End.x - Center.x));
    else
    {
        if(End.y - Center.y >= 0.0)
            AngE = +90.0;
        else
            AngE = -90.0;
    }

    if(QuiltingStitch.Direction)
    {
    	if(AngE > AngS)
        {
	        AngM = AngS+(AngE-AngS)/2.0+180.0;
        }
        else
        {
	        AngM = AngS+(AngE-AngS)/2.0;
        }
    }
    else
    {
    	if(AngE > AngS)
        {
	        AngM = AngS+(AngE-AngS)/2.0;
        }
        else
        {
	        AngM = AngS+(AngE-AngS)/2.0+180.0;
        }
    }
    AngM = ql_Module(AngM+360.0,360.0);

    Middle.x = Center.x+Radius*cos(DegToRad(AngM));
    Middle.y = Center.y+Radius*sin(DegToRad(AngM));
    nObjIndex = vlAddArc3P(Start.x,Start.y,Middle.x,Middle.y,End.x,End.y);

    vlPropPutInt(VD_ENT_COLOR,nObjIndex,clBlack);
    vlPropPutInt(VD_ENT_KEY,nObjIndex,QuiltingStitch.Speed);
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::DrawQuiltingFile(AnsiString strFileName)
{
    Caption = c_strDemo+" "+m_strAppTitle+" ["+strFileName+"]";
	if(FormNew->ShowModal() != mrOk)	return;
    int nWidth,nHeight;
    nWidth = StrToInt(FormNew->EditWidth->Text);
    nHeight = StrToInt(FormNew->EditHeight->Text);
	NewDocument(strFileName,nWidth,nHeight);

    ql_Stitch QuiltingStitch;
    int nObjIndex;
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
				nObjIndex = vlAddLine(QuiltingStitch.Start.x,QuiltingStitch.Start.y,QuiltingStitch.End.x,QuiltingStitch.End.y);
                vlPropPutInt(VD_ENT_COLOR,nObjIndex,clBlack);
                vlPropPutInt(VD_ENT_KEY,nObjIndex,QuiltingStitch.Speed);
             	break;
            }
         	case stContinousArc:// Continous Arc
            {
            	DrawQuiltingArc(QuiltingStitch);
             	break;
            }
         	case stDiscreteLine:// Discrete Line
            {
				nObjIndex = vlAddLine(QuiltingStitch.Start.x,QuiltingStitch.Start.y,QuiltingStitch.End.x,QuiltingStitch.End.y);
                vlPropPutInt(VD_ENT_COLOR,nObjIndex,clBlue);
                vlPropPutInt(VD_ENT_KEY,nObjIndex,QuiltingStitch.Speed);
             	break;
            }
        }
    }

    // Show All
    vlZoom(VL_ZOOM_ALL);
    vlUpdate();
    vlExecute(VC_ZOOM_ALL);
    vlUpdate();
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::ScaleDrawing()
{
    if(TheEnd)	return;
    int nEntitiesCount;
    int nDocIndex,nEntityType;
    double x,y,Param,X,Y;
    double ax,bx,ay,by;

    ax = 4.0;
    bx = 0.0;
    ay = 1.5;
    by = 0.0;

    nDocIndex = vlDocGetActive();
    nEntitiesCount = vlPropGetInt(VD_DWG_N_ENT,nDocIndex);
    for(int nEntityIndex=0;nEntityIndex<nEntitiesCount;nEntityIndex++)
    {
        nEntityType = vlPropGetInt(VD_ENT_TYPE,nEntityIndex);
        switch(nEntityType)
        {
            case VL_ENT_POLYLINE:// Polyline
            {
            	int nPointsCount;
                nPointsCount = vlPropGetInt(VD_POLY_N_VER,nEntityIndex);
                for(int nPointIndex=0;nPointIndex<nPointsCount;nPointIndex++)
                {
                    vlPolyVerGet(nEntityIndex,nPointIndex,&x,&y,&Param);
                    X = ax*x+bx;
                    Y = ay*y+by;
                    vlPolyVerSet(nEntityIndex,nPointIndex,X,Y,Param);
                }
                break;
            }
            case VL_ENT_LINE:// Line
            {
                x = vlPropGetDbl(VD_LINE_X1,nEntityIndex);
                y = vlPropGetDbl(VD_LINE_Y1,nEntityIndex);
                X = ax*x+bx;
                Y = ay*y+by;
                vlPropPutDbl(VD_LINE_X1,nEntityIndex,X);
                vlPropPutDbl(VD_LINE_Y1,nEntityIndex,Y);

                x = vlPropGetDbl(VD_LINE_X2,nEntityIndex);
                y = vlPropGetDbl(VD_LINE_Y2,nEntityIndex);
                X = ax*x+bx;
                Y = ay*y+by;
                vlPropPutDbl(VD_LINE_X2,nEntityIndex,X);
                vlPropPutDbl(VD_LINE_Y2,nEntityIndex,Y);
                break;
            }
            case VL_ENT_ARC		:// Arc
            case VL_ENT_ARC2	:// Arc
            {
                double left,right,top,bottom,width,height;
                double Left,Right,Top,Bottom,Width,Height;
                left = vlPropGetDbl(VD_ENT_LEFT,nEntityIndex);
                right = vlPropGetDbl(VD_ENT_RIGHT,nEntityIndex);
                top = vlPropGetDbl(VD_ENT_TOP,nEntityIndex);
                bottom = vlPropGetDbl(VD_ENT_BOTTOM,nEntityIndex);
                width = vlPropGetDbl(VD_ENT_WIDTH,nEntityIndex);
                height = vlPropGetDbl(VD_ENT_HEIGHT,nEntityIndex);
                Left = ax*left+bx;
                Bottom = ay*bottom+by;
                Right = ax*right+bx;
                Top = ay*top+by;
                Width = fabs(Right-Left);
                Height = fabs(Top-Bottom);

            	double Xc,Yc,Xs,Ys,Xe,Ye,R,Rv,Rh,As,Ae,A,sign;
                sign = (vlPropGetDbl(VD_ARC_ANGARC,nEntityIndex)>=0.0?+1:-1);

                // Center
                x = vlPropGetDbl(VD_ARC_X,nEntityIndex);
                y = vlPropGetDbl(VD_ARC_Y,nEntityIndex);
                Xc = ax*x+bx;
                Yc = ay*y+by;

                x = vlPropGetDbl(VD_ARC_XS,nEntityIndex);
                y = vlPropGetDbl(VD_ARC_YS,nEntityIndex);
                Xs = ax*x+bx;
                Ys = ay*y+by;

                x = vlPropGetDbl(VD_ARC_XE,nEntityIndex);
                y = vlPropGetDbl(VD_ARC_YE,nEntityIndex);
                Xe = ax*x+bx;
                Ye = ay*y+by;

                R = sqrt((Xs-Xc)*(Xs-Xc)+(Ys-Yc)*(Ys-Yc));
                Rh = Width/2.0;
                Rv = Height/2.0;

                if(Xs-Xc == 0.0)
                {
                 	if(Ys-Yc >= 0.0)
						As = +ql_PI2;
                    else
						As = -ql_PI2;
                }
                else
                {
	                As = ArcTan2(Ys-Yc,Xs-Xc);
                }

                if(Xe-Xc == 0.0)
                {
                 	if(Ye-Yc >= 0.0)
						Ae = +ql_PI2;
                    else
						Ae = -ql_PI2;
                }
                else
                {
	                Ae = ArcTan2(Ye-Yc,Xe-Xc);
                }
/*
                vlPropPutDbl(VD_ARC_X,nEntityIndex,Xc);
                vlPropPutDbl(VD_ARC_Y,nEntityIndex,Yc);
//                vlPropPutDbl(VD_ARC_R,nEntityIndex,R);
                vlPropPutDbl(VD_ARC_RH,nEntityIndex,Rh);
                vlPropPutDbl(VD_ARC_RV,nEntityIndex,Rv);
                vlPropPutDbl(VD_ARC_ANG0,nEntityIndex,As);
                vlPropPutDbl(VD_ARC_ANGARC,nEntityIndex,sign*fabs(Ae-As));
*/
				vlErase(nEntityIndex);
                vlAddArcEx(Xc,Yc,Rh,Rv,As,sign*fabs(Ae-As),0);
                break;
            }
        }
    }
	vlRedraw();
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::ExtractLayers(ql_Layers &Layers)
{
    Layers.clear();
    if(TheEnd) return;

    int LayersCount;
    int EntitiesCount;
    int DocIndex;
    int LayerIndex;
    bool EntityVisible;
    bool EntityDeleted;
    int LayerEntitiesCount;
    bool LayerVisible;
    bool LayerPrint;

    LayersCount=vlLayerCount();
    Layers.resize(LayersCount);

    DocIndex=vlDocGetActive();
    EntitiesCount=vlPropGetInt(VD_DWG_N_ENT,DocIndex);
    for(int EntityIndex=0;EntityIndex<EntitiesCount;EntityIndex++)
    {
        LayerIndex=vlPropGetInt(VD_ENT_LAYER,EntityIndex);
        LayerVisible=vlPropGetInt(VD_LAYER_VISIBLE,LayerIndex);
        LayerPrint=!vlPropGetInt(VD_LAYER_NOPRINT,LayerIndex);
        LayerEntitiesCount=vlPropGetInt(VD_LAYER_N_REF,LayerIndex);
        if((LayerEntitiesCount>0) && LayerVisible && LayerPrint)
        {
            EntityVisible=vlPropGetInt(VD_ENT_ONSCREEN,EntityIndex);
            EntityDeleted=vlPropGetInt(VD_ENT_DELETED,EntityIndex);
            if(EntityVisible && (!EntityDeleted))
                Layers[LayerIndex].push_back(EntityIndex);
        }
    }
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::SaveDATFile(AnsiString strFileName)
{
    if(TheEnd) return;
    ql_Layers Layers;
    ExtractLayers(Layers);

    int LayersCount;
    int EntitiesCount;
    int EntityType;
    AnsiString LayerName;
    int PointsCount;
    double x,y;
    double x1,y1;
    double x2,y2;
    int EntColor;
    int LayerIndex;
    double Param;
    int EntityIndex;
    int EntitySpeed;
    ql_Stitch QuiltingStitch;
    ql_Point Center,ElRadius,Start,End;
    double Radius;

    // Start Export
    QuiltingFile.clear();
    LayersCount=Layers.size();
    for(int LayerIndex=0;LayerIndex<LayersCount;LayerIndex++)
    {
        EntitiesCount=Layers[LayerIndex].size();
        if(EntitiesCount<=0)    continue;

        for(int k=0;k<EntitiesCount;k++)
        {
            EntityIndex = Layers[LayerIndex][k];
            EntityType = vlPropGetInt(VD_ENT_TYPE,EntityIndex);
            EntitySpeed = vlPropGetInt(VD_ENT_KEY,EntityIndex);
            switch(EntityType)
            {
                case VL_ENT_POLYLINE:// Polyline
                {
                    EntColor = vlPropGetInt(VD_ENT_COLOR,EntityIndex);
                    if(EntColor != clBlue)
	                    QuiltingStitch.Type = stContinousLine;
                    else
	                    QuiltingStitch.Type = stDiscreteLine;

                    PointsCount = vlPropGetInt(VD_POLY_N_VER,EntityIndex);

                    vlPolyVerGet(EntityIndex,0,&x,&y,&Param);
                    QuiltingStitch.Start = qlPoint(x,y);
                    QuiltingStitch.Center = qlPoint(0,0);
                    for(int PointIndex=1;PointIndex<PointsCount;PointIndex++)
                    {
                        vlPolyVerGet(EntityIndex,PointIndex,&x,&y,&Param);
                        QuiltingStitch.End = qlPoint(x,y);
                        QuiltingStitch.Direction = 0;
                        QuiltingStitch.Speed = EntitySpeed;
                        QuiltingFile.push_back(QuiltingStitch);

                    	QuiltingStitch.Start = QuiltingStitch.End;
                    }
                    break;
                }
                case VL_ENT_LINE:// Line
                {
                    EntColor = vlPropGetInt(VD_ENT_COLOR,EntityIndex);
                    if(EntColor != clBlue)
	                    QuiltingStitch.Type = stContinousLine;
                    else
	                    QuiltingStitch.Type = stDiscreteLine;

                    x1 = vlPropGetDbl(VD_LINE_X1,EntityIndex);
                    y1 = vlPropGetDbl(VD_LINE_Y1,EntityIndex);

                    x2 = vlPropGetDbl(VD_LINE_X2,EntityIndex);
                    y2 = vlPropGetDbl(VD_LINE_Y2,EntityIndex);

                    QuiltingStitch.Start = qlPoint(x1,y1);
                    QuiltingStitch.End = qlPoint(x2,y2);

                    QuiltingStitch.Center = qlPoint(0,0);
                    QuiltingStitch.Direction = 0;
                    QuiltingStitch.Speed = EntitySpeed;

                    QuiltingFile.push_back(QuiltingStitch);
                    break;
                }
                case VL_ENT_ARC		:// Arc
                case VL_ENT_ARC2	:// Arc
                {
                    QuiltingStitch.Type = stContinousArc;

                    x1 = vlPropGetDbl(VD_ARC_XS,EntityIndex);
                    y1 = vlPropGetDbl(VD_ARC_YS,EntityIndex);

                    x2 = vlPropGetDbl(VD_ARC_XE,EntityIndex);
                    y2 = vlPropGetDbl(VD_ARC_YE,EntityIndex);

                    QuiltingStitch.Start = qlPoint(x1,y1);
                    QuiltingStitch.End = qlPoint(x2,y2);

                    x = vlPropGetDbl(VD_ARC_X,EntityIndex);
                    y = vlPropGetDbl(VD_ARC_Y,EntityIndex);
                    QuiltingStitch.Center = qlPoint(x,y);

                    x = vlPropGetDbl(VD_ARC_ANGARC,EntityIndex);
                    QuiltingStitch.Direction = (x>=0)?0:1;

                    QuiltingStitch.Speed = EntitySpeed;

                    QuiltingFile.push_back(QuiltingStitch);
                    break;
                }
            }
        }
    }
	ql_SaveQuiltingFileAsDAT(strFileName,QuiltingFile);
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::SwapEnds(int EntityIndex)
{
    if(TheEnd) return;

    int LayersCount;
    int EntitiesCount;
    int EntityType;
    AnsiString LayerName;
    int PointsCount;
    double x,y;
    double x1,y1;
    double x2,y2;
    int LayerIndex;
    double Param;
    ql_Stitch QuiltingStitch,PrevQuiltingStitch;
    ql_Point Center,ElRadius,Start,End;
    double Radius;
    double d1,d2;

    EntityType = vlPropGetInt(VD_ENT_TYPE,EntityIndex);
    switch(EntityType)
    {
        case VL_ENT_POLYLINE:// Polyline
        {
        	ql_File QFile;
            PointsCount = vlPropGetInt(VD_POLY_N_VER,EntityIndex);
            for(int PointIndex=0;PointIndex<PointsCount;PointIndex++)
            {
                vlPolyVerGet(EntityIndex,PointIndex,&x,&y,&Param);
                QuiltingStitch.Start = qlPoint(x,y);
                QuiltingStitch.End.x = Param;
                QFile.push_back(QuiltingStitch);
            }
            for(int PointIndex=0;PointIndex<PointsCount;PointIndex++)
            {
            	QuiltingStitch = QFile[PointsCount-1-PointIndex];
                x = QuiltingStitch.Start.x;
                y = QuiltingStitch.Start.y;
                Param = QuiltingStitch.End.x;
                vlPolyVerSet(EntityIndex,PointIndex,x,y,Param);
            }
            break;
        }
        case VL_ENT_LINE:// Line
        {
            x1 = vlPropGetDbl(VD_LINE_X1,EntityIndex);
            y1 = vlPropGetDbl(VD_LINE_Y1,EntityIndex);

            x2 = vlPropGetDbl(VD_LINE_X2,EntityIndex);
            y2 = vlPropGetDbl(VD_LINE_Y2,EntityIndex);

            vlPropPutDbl(VD_LINE_X1,EntityIndex,x2);
            vlPropPutDbl(VD_LINE_Y1,EntityIndex,y2);

            vlPropPutDbl(VD_LINE_X2,EntityIndex,x1);
            vlPropPutDbl(VD_LINE_Y2,EntityIndex,y1);
            break;
        }
        case VL_ENT_ARC		:// Arc
        case VL_ENT_ARC2	:// Arc
        {
            x = vlPropGetDbl(VD_ARC_ANGARC,EntityIndex);
            y = vlPropGetDbl(VD_ARC_ANG0,EntityIndex);

            vlPropPutDbl(VD_ARC_ANGARC,EntityIndex,-x);
            vlPropPutDbl(VD_ARC_ANG0,EntityIndex,y+x);
            break;
        }
    }
    Draw(EntityIndex);
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::Draw(int EntityIndex)
{
    if(TheEnd) return;
    int EntityType,PointsCount;
    ql_Stitch QuiltingStitch;
    double x,y,Param;
    double x1,y1;
    double x2,y2;
    double d1,d2;

    QuiltingStitch.Start = qlPoint(random(1000),random(1000));
    QuiltingStitch.End = qlPoint(random(1000),random(1000));

    EntityType = vlPropGetInt(VD_ENT_TYPE,EntityIndex);
    switch(EntityType)
    {
        case VL_ENT_POLYLINE:// Polyline
        {
            PointsCount = vlPropGetInt(VD_POLY_N_VER,EntityIndex);
            vlPolyVerGet(EntityIndex,0,&x,&y,&Param);
            QuiltingStitch.Start = qlPoint(x,y);
            vlPolyVerGet(EntityIndex,PointsCount-1,&x,&y,&Param);
            QuiltingStitch.End = qlPoint(x,y);
            break;
        }
        case VL_ENT_LINE:// Line
        {
            x1 = vlPropGetDbl(VD_LINE_X1,EntityIndex);
            y1 = vlPropGetDbl(VD_LINE_Y1,EntityIndex);

            x2 = vlPropGetDbl(VD_LINE_X2,EntityIndex);
            y2 = vlPropGetDbl(VD_LINE_Y2,EntityIndex);

            QuiltingStitch.Start = qlPoint(x1,y1);
            QuiltingStitch.End = qlPoint(x2,y2);
            break;
        }
        case VL_ENT_ARC		:// Arc
        case VL_ENT_ARC2	:// Arc
        {
            x1 = vlPropGetDbl(VD_ARC_XS,EntityIndex);
            y1 = vlPropGetDbl(VD_ARC_YS,EntityIndex);

            x2 = vlPropGetDbl(VD_ARC_XE,EntityIndex);
            y2 = vlPropGetDbl(VD_ARC_YE,EntityIndex);

            QuiltingStitch.Start = qlPoint(x1,y1);
            QuiltingStitch.End = qlPoint(x2,y2);
            break;
        }
    }
    g_QuiltingStitch = QuiltingStitch;
    g_bDraw = true;
    vlRedraw();
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::FormCreate(TObject *Sender)
{
    #ifdef _ANTI_DEBUG_
    pro_SoftIceCheck();
    #endif// _ANTI_DEBUG_

	Left = 0;
    Top = 0;
    Width = Screen->Width;
    Height = Screen->Height - 30;

    #ifdef _ANTI_DEBUG_
    pro_DebuggerCheck();
    #endif// _ANTI_DEBUG_

    #ifdef _PRO_
	m_pSystemInfo = new info_SystemInfo();
    g_nCheckSumOffset = m_pSystemInfo->CalculateCheckSum(Application->ExeName) - m_pSystemInfo->ReadCheckSum(Application->ExeName);
    #endif// _PRO_

    m_pCanvas = new TCanvas();

    m_strAppTitle = Caption;

    m_nImageIndex = -1;

    TheEnd = false;

    // Register your copy of Vecad.dll
    vlRegistration(ALISOFT_REG_CODE_5_2);

    // Set message handler function
    vlSetMsgHandler(DwgProc);

    // Create VeCAD StatusBar
    vlStatBarCreate( PanelDisplay->Handle, &SBarH );

    // Create VeCAD window, size will be set in OnSize()
    ghwVec = vlWndCreate( PanelDisplay->Handle, VL_WS_CHILD|VL_WS_SCROLL|VL_WS_BORDER, 0,0,400,300 );
    if(ghwVec)
    {
        ::PostMessage( PanelDisplay->Handle, WM_SIZE, 0, 0 );
//        vlPropPut( VD_WND_EMPTYTEXT, (int)ghwVec,(c_strDemo+" "+c_strCompany+" "+m_strAppTitle).c_str());
        vlPropPut( VD_WND_EMPTYTEXT, (int)ghwVec,PanelDisplay->Caption.c_str());
    }

    vlLayWinCreate(PanelLayersManager->Handle,VL_LAYWIN_CHILD,0,0,PanelLayersManager->ClientWidth,PanelLayersManager->ClientHeight);

    m_strFileName="Untitled";
    Caption=c_strDemo+" "+m_strAppTitle;

    #ifdef _PROTECTED_
	// Rainbow Protection
    pro_SoftIceCheck();
    pro_DebuggerCheck();
	randomize();
	rb_FormatPacket();
    rb_Initialize();
    rb_FindFirstLock(DecodeMessage("1937"));
	m_nIndex = random(c_nResponsesSize);
    if(random(2))
    {
		if(rb_GetQueryOutput(rb_EncQueryResponses0,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses0,m_nIndex)))
        {
			FatalAppExit(0,DecodeMessage(c_strRainbowDungleNotExists).c_str());
        }
    }
    else
    {
		if(rb_GetQueryOutput(rb_EncQueryResponses1,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses1,m_nIndex)))
    	{
			FatalAppExit(0,DecodeMessage(c_strRainbowDungleNotExists).c_str());
	    }
    }
    switch(random(2))
    {
		case 0:
        {
         	Timer0->Enabled = true;
            break;
        }
		case 1:
        {
         	Timer1->Enabled = true;
            break;
        }
    }
    Timer2->Enabled = true;
    
    rb_InitializeDynamicResponses();
    rb_GenerateDynamicResponse();
    #endif// _PROTECTED_

    #ifdef _PRO_
    m_pSystemInfo->LoadSerial();
    g_nProtectionOffset = 98342*(true - m_pSystemInfo->IsValidCopy());
    #endif// _PRO_

    OnUnSelectEntity();
    BuildEntitiesList();
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::FormDestroy(TObject *Sender)
{
	#ifdef _PRO_
	if(m_pSystemInfo)
    {
     	delete m_pSystemInfo;
        m_pSystemInfo = NULL;
    }
    #endif// _PRO_
	if(m_pCanvas)
    {
     	delete m_pCanvas;
        m_pCanvas = NULL;
    }
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::PanelDisplayResize(TObject *Sender)
{
    if(TheEnd) return;

    int w, h;
    vlGetWinSize( PanelDisplay->Handle, &w, &h );
    if(w>0 && h>0)
    {
        // Resize drawing window
      	vlWndResize( ghwVec, 0, 0, w, h - SBarH );

        // Resize statusbar
        vlStatBarResize();

        // Update View
        vlZoom(VL_ZOOM_ALL);
        vlUpdate();
        vlExecute(VC_ZOOM_ALL);
        vlUpdate();
    }
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::AFileExecute(TObject *Sender)
{
	#ifdef _PROTECTED_
	// Rainbow Protection
    pro_SoftIceCheck();
    pro_DebuggerCheck();
	m_nIndex = random(c_nResponsesSize);
    if(random(2))
    {
		if(rb_GetQueryOutput(rb_EncQueryResponses0,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses0,m_nIndex)))
        {
        	AFile->Enabled = false;
    		vlPropPut(VD_DWG_FILENAME,vlDocGetActive(),DecodeMessage(c_strRainbowDungleNotExists).c_str());
        }
    }
    else
    {
		if(rb_GetQueryOutput(rb_EncQueryResponses1,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses1,m_nIndex)))
    	{
        	AFile->Enabled = false;
    		vlPropPut(VD_DWG_FILENAME,vlDocGetActive(),DecodeMessage(c_strRainbowDungleNotExists).c_str());
	    }
    }
	#endif// _PROTECTED_
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AFileNewExecute(TObject *Sender)
{
	if(FormNew->ShowModal() != mrOk)	return;
    int nWidth,nHeight;
    nWidth = StrToInt(FormNew->EditWidth->Text);
    nHeight = StrToInt(FormNew->EditHeight->Text);
	NewDocument(c_strUntitledFile,nWidth,nHeight);

    g_bGenerateNamesList = true;
    BuildEntitiesList();

    // Show All
    vlZoom(VL_ZOOM_ALL);
    vlUpdate();
    vlExecute(VC_ZOOM_ALL);
    vlUpdate();

    Caption = c_strDemo+" "+m_strAppTitle+" ["+c_strUntitledFile+"]";
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::AFileChangeDimExecute(TObject *Sender)
{
	if(FormNew->ShowModal() != mrOk)	return;
    int nWidth,nHeight;
    nWidth = StrToInt(FormNew->EditWidth->Text);
    nHeight = StrToInt(FormNew->EditHeight->Text);

    vlPropPutDbl(VD_RECT_XCEN,m_nWorkingAreaRectIndex,nWidth/2.0);
    vlPropPutDbl(VD_RECT_YCEN,m_nWorkingAreaRectIndex,nHeight/2.0);
    vlPropPutDbl(VD_RECT_WIDTH,m_nWorkingAreaRectIndex,nWidth);
    vlPropPutDbl(VD_RECT_HEIGHT,m_nWorkingAreaRectIndex,nHeight);

    // Show All
    vlZoom(VL_ZOOM_ALL);
    vlUpdate();
    vlExecute(VC_ZOOM_ALL);
    vlUpdate();
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::AFileOpenExecute(TObject *Sender)
{
	if(OpenDialogQLT->Execute())
    {
	    g_bGenerateNamesList = false;

        vlFileOpen(ghwVec,OpenDialogQLT->FileName.c_str());
	    int DocIndex = vlDocGetActive();
    	ListBoxOpenedFiles->Items->AddObject(ExtractFileName(OpenDialogQLT->FileName),(TObject *)DocIndex);

//        m_nWorkingAreaRectIndex = vlGetEntity(VL_EI_BYKEY,-2,VL_DRAWING);
	    g_bGenerateNamesList = true;
	    BuildEntitiesList();
	}
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::AFileImportExecute(TObject *Sender)
{
	if(OpenDialogDAT->Execute())
    {
    	for(int i=0;i<OpenDialogDAT->Files->Count;i++)
        {
		    g_bGenerateNamesList = false;

    		OpenDATFile(OpenDialogDAT->Files->Strings[i]);
            Application->ProcessMessages();

//    	    m_nWorkingAreaRectIndex = vlGetEntity(VL_EI_BYKEY,-2,VL_DRAWING);
	    	g_bGenerateNamesList = true;
		    BuildEntitiesList();
        }
    }
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::ActivateDesigner()
{
//	if(ListBoxOpenedFiles->ItemIndex < 0)	return;
//	int DocIndex = int(ListBoxOpenedFiles->Items->Objects[ListBoxOpenedFiles->ItemIndex]);
//    vlDocSetActive(DocIndex);
//    char cFileName[256];
//    vlPropGet(VD_DWG_PATHNAME,DocIndex,cFileName);
//    Caption = c_strDemo+" "+m_strAppTitle+" ["+AnsiString(cFileName)+"]";


	if(ListBoxOpenedFiles->Items->Count <= 0)	return;
	if(ListBoxOpenedFiles->ItemIndex < 0)
    {
    	ListBoxOpenedFiles->ItemIndex = 0;
    }
	int DocIndex = int(ListBoxOpenedFiles->Items->Objects[ListBoxOpenedFiles->ItemIndex]);
    vlDocSetActive(DocIndex);
//    m_nWorkingAreaRectIndex = vlGetEntity(VL_EI_BYKEY,-2,VL_DRAWING);
    char cFileName[256];
    vlPropGet(VD_DWG_PATHNAME,DocIndex,cFileName);
    Caption = c_strDemo+" "+m_strAppTitle+" ["+AnsiString(cFileName)+"]";

    g_bGenerateNamesList = true;
    BuildEntitiesList();
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::AFileSaveExecute(TObject *Sender)
{
    int DocIndex = vlDocGetActive();
    char cFileName[256];
    AnsiString strFileName;
    vlPropGet(VD_DWG_PATHNAME,DocIndex,cFileName);
    strFileName = cFileName;
    if(strFileName.UpperCase().Pos(".DAT") > 0)
    {
		#ifdef _DEMO_
		MessageDlg(c_strDemoVersionMessage,mtInformation,TMsgDlgButtons()<<mbOK,0);
	    #else
        #ifdef _PROTECTED_
        // Rainbow Protection
        m_nIndex = random(c_nResponsesSize);
        if(random(2))
        {
            if(rb_GetQueryOutput(rb_EncQueryResponses0,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses0,m_nIndex)))
            {
                Caption = DecodeMessage(c_strRainbowDungleNotExists);
                throw;
            }
        }
        else
        {
            if(rb_GetQueryOutput(rb_EncQueryResponses1,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses1,m_nIndex)))
            {
                Caption = DecodeMessage(c_strRainbowDungleNotExists);
                throw;
            }
        }
	    pro_SoftIceCheck();
    	pro_DebuggerCheck();

		SaveDATFile(strFileName);
		#endif// _PROTECTED_
    	#endif // _DEMO_
    }
    else
    if(strFileName.UpperCase().Pos(".VEC") > 0)
    {
        vlFileSave(VL_FILE_VEC,strFileName.c_str());
    }
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::AFileSaveAsExecute(TObject *Sender)
{
	#ifdef _PROTECTED_
	// Rainbow Protection
	m_nIndex = random(c_nResponsesSize);
    if(random(2))
    {
		if(rb_GetQueryOutput(rb_EncQueryResponses1,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses1,m_nIndex)))
    	{
			Caption = DecodeMessage(c_strRainbowDungleNotExists);
            throw;
	    }
    }
    else
    {
		if(rb_GetQueryOutput(rb_EncQueryResponses0,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses0,m_nIndex)))
        {
			Caption = DecodeMessage(c_strRainbowDungleNotExists);
            throw;
        }
    }
    pro_SoftIceCheck();
    pro_DebuggerCheck();
	#endif// _PROTECTED_

	if(SaveDialogQLT->Execute())
    {
        vlFileSave(VL_FILE_VEC,SaveDialogQLT->FileName.c_str());
    }
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::AFileExportExecute(TObject *Sender)
{
	#ifdef _DEMO_
	MessageDlg(c_strDemoVersionMessage,mtInformation,TMsgDlgButtons()<<mbOK,0);
    #else
	#ifdef _PROTECTED_
	// Rainbow Protection
	m_nIndex = random(c_nResponsesSize);
    if(random(2))
    {
		if(rb_GetQueryOutput(rb_EncQueryResponses0,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses0,m_nIndex)))
        {
			Caption = DecodeMessage(c_strRainbowDungleNotExists);
            throw;
        }
    }
    else
    {
		if(rb_GetQueryOutput(rb_EncQueryResponses1,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses1,m_nIndex)))
    	{
			Caption = DecodeMessage(c_strRainbowDungleNotExists);
            throw;
	    }
    }
    pro_SoftIceCheck();
    pro_DebuggerCheck();
	#endif// _PROTECTED_

	if(SaveDialogDAT->Execute())
    {
		SaveDATFile(SaveDialogDAT->FileName);
    }
    #endif // _DEMO_
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::AFileCloseExecute(TObject *Sender)
{
    int DocIndex = vlDocGetActive();
	int nDocPos = ListBoxOpenedFiles->Items->IndexOfObject((TObject *)DocIndex);
    if(nDocPos < 0)	return;
	ListBoxOpenedFiles->Items->Delete(nDocPos);
	vlExecute(VC_FILE_CLOSE);
//    g_bGenerateNamesList = false;
    ListBoxOpenedFiles->ItemIndex = 0;
    ListBoxOpenedFilesClick(NULL);
    BuildEntitiesList();
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AFileCloseAllExecute(TObject *Sender)
{
    vlExecute(VC_FILE_CLOSEALL);
    ListBoxOpenedFiles->Items->Clear();
    BuildEntitiesList();
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::AFileExitExecute(TObject *Sender)
{
	Close();	
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::AZoomExecute(TObject *Sender)
{
	#ifdef _PROTECTED_
	// Rainbow Protection
	m_nIndex = random(c_nResponsesSize);
    if(random(2))
    {
		if(rb_GetQueryOutput(rb_EncQueryResponses0,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses0,m_nIndex)))
        {
        	AZoom->Enabled = false;
    		vlPropPut(VD_DWG_FILENAME,vlDocGetActive(),DecodeMessage(c_strRainbowDungleNotExists).c_str());
        }
    }
    else
    {
		if(rb_GetQueryOutput(rb_EncQueryResponses1,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses1,m_nIndex)))
    	{
        	AZoom->Enabled = false;
    		vlPropPut(VD_DWG_FILENAME,vlDocGetActive(),DecodeMessage(c_strRainbowDungleNotExists).c_str());
	    }
    }
    pro_SoftIceCheck();
    pro_DebuggerCheck();
	#endif// _PROTECTED_
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AZoomAllExecute(TObject *Sender)
{
	vlExecute(VC_ZOOM_ALL);	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AZoomWindowExecute(TObject *Sender)
{
	vlExecute(VC_ZOOM_WIN);	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AZoomInExecute(TObject *Sender)
{
	vlExecute(VC_ZOOM_IN);	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AZoomOutExecute(TObject *Sender)
{
	vlExecute(VC_ZOOM_OUT);	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AZoomPanWindowExecute(TObject *Sender)
{
	vlExecute(VC_ZOOM_PAN);	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ZoomToPrevExecute(TObject *Sender)
{
	vlExecute(VC_ZOOM_PREV);	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ASnapExecute(TObject *Sender)
{
	#ifdef _PROTECTED_
	// Rainbow Protection
    pro_DebuggerCheck();
    pro_SoftIceCheck();
	m_nIndex = random(c_nResponsesSize);
    if(random(2))
    {
		if(rb_GetQueryOutput(rb_EncQueryResponses0,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses0,m_nIndex)))
        {
        	ASnap->Enabled = false;
    		vlPropPut(VD_DWG_FILENAME,vlDocGetActive(),DecodeMessage(c_strRainbowDungleNotExists).c_str());
        }
    }
    else
    {
		if(rb_GetQueryOutput(rb_EncQueryResponses1,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses1,m_nIndex)))
    	{
        	ASnap->Enabled = false;
    		vlPropPut(VD_DWG_FILENAME,vlDocGetActive(),DecodeMessage(c_strRainbowDungleNotExists).c_str());
	    }
    }
	#endif// _PROTECTED_
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ASnapDlgExecute(TObject *Sender)
{
	vlExecute(VC_SNAP_DLG);	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ASnapGridExecute(TObject *Sender)
{
	ASnapGrid->Checked = !ASnapGrid->Checked;
	vlExecute(VC_SNAP_GRID);	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ASnapPolarExecute(TObject *Sender)
{
	ASnapPolar->Checked = !ASnapPolar->Checked;
	vlExecute(VC_SNAP_POLAR);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ASnapGripsExecute(TObject *Sender)
{
	ASnapGrips->Checked = !ASnapGrips->Checked;
	vlExecute(VC_SNAP_GRIPS);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ASnapPointExecute(TObject *Sender)
{
	ASnapPoint->Checked = !ASnapPoint->Checked;
	vlExecute(VC_SNAP_POINT);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ASnapNearExecute(TObject *Sender)
{
	ASnapNear->Checked = !ASnapNear->Checked;
	vlExecute(VC_SNAP_NEAR);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ASnapEndExecute(TObject *Sender)
{
	ASnapEnd->Checked = !ASnapEnd->Checked;
	vlExecute(VC_SNAP_END);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ASnapMidExecute(TObject *Sender)
{
	ASnapMid->Checked = !ASnapMid->Checked;
	vlExecute(VC_SNAP_MID);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ASnapCenterExecute(TObject *Sender)
{
	ASnapCenter->Checked = !ASnapCenter->Checked;
	vlExecute(VC_SNAP_CEN);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ASnapPerpendicularExecute(TObject *Sender)
{
	ASnapPerpendicular->Checked = !ASnapPerpendicular->Checked;
	vlExecute(VC_SNAP_PERP);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ASnapTangentExecute(TObject *Sender)
{
	ASnapTangent->Checked = !ASnapTangent->Checked;
	vlExecute(VC_SNAP_TANG);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AEditExecute(TObject *Sender)
{
	#ifdef _PROTECTED_
	// Rainbow Protection
	m_nIndex = random(c_nResponsesSize);
    if(random(2))
    {
		if(rb_GetQueryOutput(rb_EncQueryResponses0,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses0,m_nIndex)))
        {
        	AEdit->Enabled = false;
    		vlPropPut(VD_DWG_FILENAME,vlDocGetActive(),DecodeMessage(c_strRainbowDungleNotExists).c_str());
        }
    }
    else
    {
		if(rb_GetQueryOutput(rb_EncQueryResponses1,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses1,m_nIndex)))
    	{
        	AEdit->Enabled = false;
    		vlPropPut(VD_DWG_FILENAME,vlDocGetActive(),DecodeMessage(c_strRainbowDungleNotExists).c_str());
	    }
    }
    pro_DebuggerCheck();
    pro_SoftIceCheck();
	#endif// _PROTECTED_
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AEditEntPropExecute(TObject *Sender)
{
	vlExecute(VC_EDIT_ENTPROP);	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AEditCopyExecute(TObject *Sender)
{
	vlExecute(VC_EDIT_COPY);	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AEditMoveExecute(TObject *Sender)
{
	vlExecute(VC_EDIT_MOVE);	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AEditRotateExecute(TObject *Sender)
{
	vlExecute(VC_EDIT_ROTATE);	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AEditScaleExecute(TObject *Sender)
{
	vlExecute(VC_EDIT_SCALE);	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AEditMirrorExecute(TObject *Sender)
{
	vlExecute(VC_EDIT_MIRROR);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AEditExplodeExecute(TObject *Sender)
{
	vlExecute(VC_EDIT_EXPLODE);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AEditJoinExecute(TObject *Sender)
{
	vlExecute(VC_EDIT_JOIN);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AEditEraseExecute(TObject *Sender)
{
	vlExecute(VC_EDIT_ERASE);	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AEditUndoExecute(TObject *Sender)
{
	vlExecute(VC_EDIT_UNDO);	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AEditRedoExecute(TObject *Sender)
{
	vlExecute(VC_EDIT_REDO);	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AEditCutCBExecute(TObject *Sender)
{
	vlExecute(VC_EDIT_CBCUT);	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AEditCopyCBExecute(TObject *Sender)
{
	vlExecute(VC_EDIT_CBCOPY);	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AEditPasteCBExecute(TObject *Sender)
{
	vlExecute(VC_EDIT_CBPASTE);
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::AEditSetJumpExecute(TObject *Sender)
{
	bool First;
	int iEnt, iLayer;
    int EntityType;
	First = true;
	while(true)
    {
	  	if(First)
        {
		    iEnt = vlGetEntity( VL_EI_FIRST, VL_SELECTION, 0 );
		    First = false;
  		}
        else
        {
	    	iEnt = vlGetEntity(VL_EI_NEXT, 0, 0 );
  		}
  		if(iEnt >= 0)
  		{
            EntityType = vlPropGetInt(VD_ENT_TYPE,iEnt);
            switch(EntityType)
            {
                case VL_ENT_POLYLINE:// Polyline
                case VL_ENT_LINE:// Line
                {
        			vlPropPutInt(VD_ENT_COLOR,iEnt,clBlue);
                    break;
                }
            }
  		}
        else
        {
    		break;  
  		}
	}
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AEditSetNormalExecute(TObject *Sender)
{
	bool First;
	int iEnt, iLayer;
    int EntityType;
	First = true;
	while(true)
    {
	  	if(First)
        {
		    iEnt = vlGetEntity( VL_EI_FIRST, VL_SELECTION, 0 );
		    First = false;
  		}
        else
        {
	    	iEnt = vlGetEntity(VL_EI_NEXT, 0, 0 );
  		}
  		if(iEnt >= 0)
  		{
            EntityType = vlPropGetInt(VD_ENT_TYPE,iEnt);
            switch(EntityType)
            {
                case VL_ENT_POLYLINE:// Polyline
                case VL_ENT_LINE:// Line
                {
        			vlPropPutInt(VD_ENT_COLOR,iEnt,clBlack);
                    break;
                }
            }
  		}
        else
        {
    		break;  
  		}
	}
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AHelpExecute(TObject *Sender)
{
//
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AHelpContentsExecute(TObject *Sender)
{
	AnsiString strFileName = ChangeFileExt(Application->ExeName,".htm");
	ShellExecute(0,"open",strFileName.c_str(),"","",SW_SHOW);	
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::AHelpAboutExecute(TObject *Sender)
{
	FormAbout->ShowModal();	
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::ListBoxOpenedFilesClick(TObject *Sender)
{
	ActivateDesigner();
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ADrawExecute(TObject *Sender)
{
	#ifdef _PROTECTED_
	// Rainbow Protection
    pro_DebuggerCheck();
    pro_SoftIceCheck();
	m_nIndex = random(c_nResponsesSize);
    if(random(2))
    {
		if(rb_GetQueryOutput(rb_EncQueryResponses0,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses0,m_nIndex)))
        {
        	ADraw->Enabled = false;
    		vlPropPut(VD_DWG_FILENAME,vlDocGetActive(),DecodeMessage(c_strRainbowDungleNotExists).c_str());
        }
    }
    else
    {
		if(rb_GetQueryOutput(rb_EncQueryResponses1,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses1,m_nIndex)))
    	{
        	ADraw->Enabled = false;
    		vlPropPut(VD_DWG_FILENAME,vlDocGetActive(),DecodeMessage(c_strRainbowDungleNotExists).c_str());
	    }
    }
	#endif// _PROTECTED_
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ADrawLineExecute(TObject *Sender)
{
	vlExecute(VC_DRAW_LINE);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ADrawRectangleExecute(TObject *Sender)
{
	vlExecute(VC_DRAW_RECT);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ADrawPolylineExecute(TObject *Sender)
{
	vlExecute(VC_DRAW_POLYLINE);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ADrawArcCSEExecute(TObject *Sender)
{
	vlExecute(VC_DRAW_ARC_CSE);	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ADrawArcSEMExecute(TObject *Sender)
{
	vlExecute(VC_DRAW_ARC_SEM);	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ADrawArcSMEExecute(TObject *Sender)
{
	vlExecute(VC_DRAW_ARC_SME);	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ADrawCircleCRExecute(TObject *Sender)
{
	vlExecute(VC_DRAW_CIRC_CR);	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ADrawCircleCDExecute(TObject *Sender)
{
	vlExecute(VC_DRAW_CIRC_CD);	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ADrawCircle2PExecute(TObject *Sender)
{
	vlExecute(VC_DRAW_CIRC_2P);	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ADrawCircle3PExecute(TObject *Sender)
{
	vlExecute(VC_DRAW_CIRC_3P);	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ADrawEllipseExecute(TObject *Sender)
{
	vlExecute(VC_DRAW_ELLIPSE);	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AToolsExecute(TObject *Sender)
{
	#ifdef _PROTECTED_
	// Rainbow Protection
	m_nIndex = random(c_nResponsesSize);
    if(random(2))
    {
		if(rb_GetQueryOutput(rb_EncQueryResponses0,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses0,m_nIndex)))
        {
        	ATools->Enabled = false;
    		vlPropPut(VD_DWG_FILENAME,vlDocGetActive(),DecodeMessage(c_strRainbowDungleNotExists).c_str());
        }
    }
    else
    {
		if(rb_GetQueryOutput(rb_EncQueryResponses1,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses1,m_nIndex)))
    	{
        	ATools->Enabled = false;
    		vlPropPut(VD_DWG_FILENAME,vlDocGetActive(),DecodeMessage(c_strRainbowDungleNotExists).c_str());
	    }
    }
    pro_DebuggerCheck();
    pro_SoftIceCheck();
	#endif// _PROTECTED_
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AToolsSimulatorExecute(TObject *Sender)
{
	FormSimulator->ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AToolsNavigatorExecute(TObject *Sender)
{
	vlExecute(VC_TOOL_NAVIGATOR);    
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::Timer0Timer(TObject *Sender)
{
	#ifdef _PROTECTED_
	// Rainbow Protection
    pro_DebuggerCheck();
    pro_SoftIceCheck();
	m_nIndex = random(c_nResponsesSize);
    if(random(2))
    {
		if(rb_GetQueryOutput(rb_EncQueryResponses0,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses0,m_nIndex)))
        {
			FatalAppExit(0,DecodeMessage(c_strRainbowDungleNotExists).c_str());
        }
    }
    else
    {
		if(rb_GetQueryOutput(rb_EncQueryResponses1,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses1,m_nIndex)))
    	{
			FatalAppExit(0,DecodeMessage(c_strRainbowDungleNotExists).c_str());
	    }
    }

    Timer3->Interval = 1000*60*random(24*60);
    Timer3->Enabled = true;
	#endif// _PROTECTED_
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::Timer1Timer(TObject *Sender)
{
	#ifdef _PROTECTED_
	// Rainbow Protection
    pro_DebuggerCheck();
    pro_SoftIceCheck();
	m_nIndex = random(c_nResponsesSize);
    if(random(2))
    {
		if(rb_GetQueryOutput(rb_EncQueryResponses0,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses0,m_nIndex)))
        {
			MessageDlg(DecodeMessage(c_strRainbowDungleNotExists),mtError,TMsgDlgButtons()<<mbOK,0);
        }
    }
    else
    {
		if(rb_GetQueryOutput(rb_EncQueryResponses1,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses1,m_nIndex)))
    	{
			MessageDlg(DecodeMessage(c_strRainbowDungleNotExists),mtError,TMsgDlgButtons()<<mbOK,0);
	    }
    }

    Timer3->Interval = 1000*60*random(24*60);
    Timer3->Enabled = true;
	#endif// _PROTECTED_
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::Timer2Timer(TObject *Sender)
{
	#ifdef _PROTECTED_
	// Rainbow Protection
	m_nIndex = random(c_nResponsesSize);
    if(random(2))
    {
		if(rb_GetQueryOutput(rb_EncQueryResponses0,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses0,m_nIndex)))
        {
			ShowMessage(DecodeMessage(c_strRainbowDungleNotExists));
        }
    }
    else
    {
		if(rb_GetQueryOutput(rb_EncQueryResponses1,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses1,m_nIndex)))
    	{
			ShowMessage(DecodeMessage(c_strRainbowDungleNotExists));
	    }
    }
    pro_DebuggerCheck();
    pro_SoftIceCheck();

    Timer3->Interval = 1000*60*random(24*60);
    Timer3->Enabled = true;
	#endif// _PROTECTED_
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::Timer3Timer(TObject *Sender)
{
	#ifdef _PROTECTED_
	// Rainbow Protection
	m_nIndex = random(c_nResponsesSize);
    if(random(2))
    {
		if(rb_GetQueryOutput(rb_EncQueryResponses0,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses0,m_nIndex)))
        {
        	TCanvas *pCanvas = new TCanvas();
			pCanvas->Handle = GetWindowDC(0);
            pCanvas->Font->Color = clRed;
            pCanvas->Font->Size = 72;
            pCanvas->TextOutA(random(Screen->Width),random(Screen->Height),DecodeMessage(c_strRainbowDungleNotExists));
            if(pCanvas)
            {
            	delete pCanvas;
                pCanvas = NULL;
            }
            exit(0);
        }
    }
    else
    {
		if(rb_GetQueryOutput(rb_EncQueryResponses1,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses1,m_nIndex)))
    	{
        	TCanvas *pCanvas = new TCanvas();
			pCanvas->Handle = GetWindowDC(0);
            pCanvas->Font->Color = clRed;
            pCanvas->Font->Size = 72;
            pCanvas->TextOutA(random(Screen->Width),random(Screen->Height),DecodeMessage(c_strRainbowDungleNotExists));
            if(pCanvas)
            {
            	delete pCanvas;
                pCanvas = NULL;
            }
            exit(0);
	    }
    }
    pro_DebuggerCheck();
    pro_SoftIceCheck();
	#endif// _PROTECTED_
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ApplicationEventsActivate(TObject *Sender)
{
	#ifdef _PROTECTED_
    rb_GenerateDynamicResponse();
    if(!g_vecResponses.empty())
    {
		int nIndex = random(g_vecResponses.size());
		if(g_vecResponses[nIndex].strResponse != rb_Query("10",g_vecResponses[nIndex].strQuery))
	    {
        	Application->Terminate();
	    }
    }
	#endif// _PROTECTED_
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ApplicationEventsDeactivate(TObject *Sender)
{
	#ifdef _PROTECTED_
    rb_GenerateDynamicResponse();
    if(!g_vecResponses.empty())
    {
		int nIndex = random(g_vecResponses.size());
		if(g_vecResponses[nIndex].strResponse != rb_Query("10",g_vecResponses[nIndex].strQuery))
	    {
        	FatalExit(0);
	    }
    }
	#endif// _PROTECTED_
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ApplicationEventsMinimize(TObject *Sender)
{
	#ifdef _PROTECTED_
    rb_GenerateDynamicResponse();
    if(!g_vecResponses.empty())
    {
		int nIndex = random(g_vecResponses.size());
		if(g_vecResponses[nIndex].strResponse != rb_Query("10",g_vecResponses[nIndex].strQuery))
	    {
        	exit(0);
	    }
    }
	#endif// _PROTECTED_
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ApplicationEventsRestore(TObject *Sender)
{
	#ifdef _PROTECTED_
    rb_GenerateDynamicResponse();
    if(!g_vecResponses.empty())
    {
		int nIndex = random(g_vecResponses.size());
		if(g_vecResponses[nIndex].strResponse != rb_Query("10",g_vecResponses[nIndex].strQuery))
	    {
        	throw;
	    }
    }
    #endif// _PROTECTED_
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ActionList1Execute(TBasicAction *Action,
      bool &Handled)
{
	#ifdef _PROTECTED_
	// Rainbow Protection
	if(GetTickCount() > 1000*60*(60+random(24*60)))
    {
        m_nIndex = random(c_nResponsesSize);
        if(random(2))
        {
            if(rb_GetQueryOutput(rb_EncQueryResponses0,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses0,m_nIndex)))
            {
                throw;
            }
        }
        else
        {
            if(rb_GetQueryOutput(rb_EncQueryResponses1,m_nIndex) != rb_Query("10",rb_GetQueryInput(rb_EncQueryResponses1,m_nIndex)))
            {
                throw;
            }
        }
        pro_SoftIceCheck();
        pro_DebuggerCheck();
    }
	#endif// _PROTECTED_
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ATraceExecute(TObject *Sender)
{
//	
}
//---------------------------------------------------------------------------
void __fastcall TFormMain::ATraceBackgroundExecute(TObject *Sender)
{
	if(OpenPictureDialog->Execute())
    {
    	vlLayerActive(m_nBackgroundLayer);
        if(m_nImageIndex < 0)
        {
			m_nImageIndex = vlAddRaster(OpenPictureDialog->FileName.c_str(),0,0,0.1,0.1);
        }
        else
        {
        	vlPropPut(VD_BMP_FILENAME,m_nImageIndex,OpenPictureDialog->FileName.c_str());
        }
        vlEntToBottom(m_nImageIndex);
    	vlLayerActive(m_nDrawingLayer);
    	vlPropPutInt(VD_DWG_SORTLAYERS,vlDocGetActive(),true);

//        double dWidth,dHeight;
//    	dWidth = vlPropGetDbl(VD_RECT_WIDTH,m_nWorkingAreaRectIndex);
//    	dHeight = vlPropGetDbl(VD_RECT_HEIGHT,m_nWorkingAreaRectIndex);

//        vlPropPut(VD_BMP_RESX,m_nImageIndex,);
//        vlPropPut(VD_BMP_RESY,m_nImageIndex,);

//        vlGripMove(m_nImageIndex,4,1000,0);

        // Show All
        vlZoom(VL_ZOOM_ALL);
        vlUpdate();
        vlExecute(VC_ZOOM_ALL);
        vlUpdate();
    }

}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ATraceToolExecute(TObject *Sender)
{
	vlExecute(spl_CMD_POLYARC);
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::FormClose(TObject *Sender, TCloseAction &Action)
{
    vlExecute(VC_FILE_CLOSEALL);    
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AFileExportDATExecute(TObject *Sender)
{
	if(SaveDialogDAT->Execute())
    {
		vlFileSave(VL_FILE_CUSTOM,SaveDialogDAT->FileName.c_str());
    }
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AEntityExecute(TObject *Sender)
{
//	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AEntityUpExecute(TObject *Sender)
{
	if(ListBoxEntities->ItemIndex < 0)	return;
    if(ListBoxEntities->ItemIndex < 1)	return;
	int nIndex,nUpIndex;
	int nEntityIndex,nUpEntityIndex;
    nIndex = ListBoxEntities->ItemIndex;
    nUpIndex = ListBoxEntities->ItemIndex-1;
    nEntityIndex = (int)ListBoxEntities->Items->Objects[nIndex];
    nUpEntityIndex = (int)ListBoxEntities->Items->Objects[nUpIndex];
	vlEntSwap(nEntityIndex,nUpEntityIndex);
    vlRedraw();
    ListBoxEntities->Items->Exchange(nIndex,nUpIndex);
    ListBoxEntities->Items->Objects[nIndex] = (TObject *)nEntityIndex;
    ListBoxEntities->Items->Objects[nUpIndex] = (TObject *)nUpEntityIndex;
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AEntityDownExecute(TObject *Sender)
{
	if(ListBoxEntities->ItemIndex < 0)	return;
    if(ListBoxEntities->ItemIndex >= ListBoxEntities->Items->Count-1)	return;
	int nIndex,nDownIndex;
	int nEntityIndex,nDownEntityIndex;
    nIndex = ListBoxEntities->ItemIndex;
    nDownIndex = ListBoxEntities->ItemIndex+1;
    nEntityIndex = (int)ListBoxEntities->Items->Objects[nIndex];
    nDownEntityIndex = (int)ListBoxEntities->Items->Objects[nDownIndex];
	vlEntSwap(nEntityIndex,nDownEntityIndex);
    vlRedraw();
    ListBoxEntities->Items->Exchange(nIndex,nDownIndex);
    ListBoxEntities->Items->Objects[nIndex] = (TObject *)nEntityIndex;
    ListBoxEntities->Items->Objects[nDownIndex] = (TObject *)nDownEntityIndex;
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::OnSelectEntity()
{
	if(ListBoxEntities->ItemIndex < 0)	return;
	int nEntityIndex;
    m_nItemIndex = ListBoxEntities->ItemIndex;
    nEntityIndex = (int)ListBoxEntities->Items->Objects[ListBoxEntities->ItemIndex];
    Draw(nEntityIndex);
    AEntitySwapEnds->Enabled = true;
    AEntityUp->Enabled = true;
    AEntityDown->Enabled = true;
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::OnUnSelectEntity()
{
    g_bDraw = false;
    ListBoxEntities->ItemIndex = -1;
    vlSelect(false,-1);
    vlRedraw();
    AEntitySwapEnds->Enabled = false;
    AEntityUp->Enabled = false;
    AEntityDown->Enabled = false;
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::ListBoxEntitiesClick(TObject *Sender)
{
	if(ListBoxEntities->ItemIndex < 0)	return;
	int nEntityIndex;
    m_nItemIndex = ListBoxEntities->ItemIndex;
    nEntityIndex = (int)ListBoxEntities->Items->Objects[ListBoxEntities->ItemIndex];
	vlSelect(false,-1);
	vlSelect(true,nEntityIndex);
	vlRedraw();
	OnSelectEntity();
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AEntitySwapEndsExecute(TObject *Sender)
{
	if(ListBoxEntities->ItemIndex < 0)	return;
	int nEntityIndex;
    nEntityIndex = (int)ListBoxEntities->Items->Objects[ListBoxEntities->ItemIndex];
	SwapEnds(nEntityIndex);	
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::AEntityBuildListExecute(TObject *Sender)
{
	BuildEntitiesList();
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::FormKeyDown(TObject *Sender, WORD &Key,
      TShiftState Shift)
{
	switch(Key)
    {
		case VK_ESCAPE:
        {
        	OnUnSelectEntity();
			BuildEntitiesList();
			break;
        }
    }
}
//---------------------------------------------------------------------------

void __fastcall TFormMain::Button1Click(TObject *Sender)
{
	ScaleDrawing();
/*
	if(ListBoxEntities->ItemIndex < 0)	return;
	int nEntityIndex;
    nEntityIndex = (int)ListBoxEntities->Items->Objects[ListBoxEntities->ItemIndex];

    int EntityType,nEntRect;
    double left,right,top,bottom,width,height;
    double ax,bx,ay,by;
    left = vlPropGetDbl(VD_ENT_LEFT,nEntityIndex);
    right = vlPropGetDbl(VD_ENT_RIGHT,nEntityIndex);
    top = vlPropGetDbl(VD_ENT_TOP,nEntityIndex);
    bottom = vlPropGetDbl(VD_ENT_BOTTOM,nEntityIndex);
    width = vlPropGetDbl(VD_ENT_WIDTH,nEntityIndex);
    height = vlPropGetDbl(VD_ENT_HEIGHT,nEntityIndex);


//    nEntRect = vlAddRect(left+width/2.0,bottom+height/2.0,width,height,0.0,0.0);
//    vlPropPutInt(VD_ENT_COLOR,nEntRect,clRed);

    EntityType = vlPropGetInt(VD_ENT_TYPE,nEntityIndex);
    switch(EntityType)
    {
        case VL_ENT_POLYLINE:// Polyline
        {
          	break;
        }
        case VL_ENT_LINE:// Line
        {
          	break;
        }
        case VL_ENT_ARC		:// Arc
        case VL_ENT_ARC2	:// Arc
        {
          	break;
        }
    }
	vlRedraw();
*/
}
//---------------------------------------------------------------------------

