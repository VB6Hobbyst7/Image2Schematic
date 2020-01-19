VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Image2Schematic"
   ClientHeight    =   11370
   ClientLeft      =   225
   ClientTop       =   870
   ClientWidth     =   13545
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   758
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   903
   StartUpPosition =   3  '窗口缺省
   Begin VB.PictureBox picImageView 
      Align           =   3  'Align Left
      BackColor       =   &H8000000C&
      Height          =   11370
      Left            =   2655
      OLEDropMode     =   1  'Manual
      ScaleHeight     =   754
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   736
      TabIndex        =   11
      Top             =   0
      Width           =   11100
      Begin VB.PictureBox picSrc 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BorderStyle     =   0  'None
         Height          =   4515
         Left            =   0
         Picture         =   "frmMain.frx":1084A
         ScaleHeight     =   301
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   501
         TabIndex        =   13
         Top             =   0
         Visible         =   0   'False
         Width           =   7515
      End
      Begin VB.PictureBox picImage 
         AutoRedraw      =   -1  'True
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         Height          =   1080
         Left            =   1320
         MousePointer    =   15  'Size All
         OLEDropMode     =   1  'Manual
         ScaleHeight     =   72
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   64
         TabIndex        =   12
         Top             =   1320
         Width           =   960
      End
   End
   Begin VB.PictureBox picLM 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   240
      Left            =   0
      Picture         =   "frmMain.frx":13B4B
      ScaleHeight     =   16
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   16
      TabIndex        =   10
      Top             =   0
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.PictureBox picVAdjust 
      Align           =   2  'Align Bottom
      BorderStyle     =   0  'None
      Height          =   0
      Left            =   0
      MousePointer    =   7  'Size N S
      ScaleHeight     =   0
      ScaleMode       =   0  'User
      ScaleWidth      =   1000
      TabIndex        =   8
      Top             =   11370
      Width           =   13545
   End
   Begin VB.Timer tmrLoadDragdrop 
      Enabled         =   0   'False
      Left            =   7080
      Top             =   3960
   End
   Begin VB.PictureBox picOutput 
      Align           =   2  'Align Bottom
      BorderStyle     =   0  'None
      Height          =   0
      Left            =   0
      ScaleHeight     =   0
      ScaleWidth      =   13545
      TabIndex        =   7
      Top             =   11370
      Width           =   13545
   End
   Begin VB.PictureBox picCtrlPan 
      Align           =   3  'Align Left
      BorderStyle     =   0  'None
      Height          =   11370
      Left            =   0
      ScaleHeight     =   758
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   177
      TabIndex        =   0
      Top             =   0
      Width           =   2655
      Begin VB.Frame Frames 
         Caption         =   "&大小"
         Height          =   1815
         Index           =   2
         Left            =   240
         TabIndex        =   1
         Top             =   120
         Width           =   2175
         Begin VB.CommandButton cmdApplySizing 
            Caption         =   "&应用"
            Height          =   375
            Left            =   120
            TabIndex        =   9
            Top             =   1320
            Width           =   1935
         End
         Begin VB.TextBox txtWidth 
            Height          =   270
            Left            =   840
            TabIndex        =   4
            Text            =   "300"
            Top             =   240
            Width           =   1215
         End
         Begin VB.TextBox txtHeight 
            Height          =   270
            Left            =   840
            TabIndex        =   6
            Text            =   "500"
            Top             =   600
            Width           =   1215
         End
         Begin VB.CheckBox ChkRatio 
            Caption         =   "&保持宽高比"
            Height          =   255
            Left            =   120
            TabIndex        =   2
            Top             =   960
            Value           =   1  'Checked
            Width           =   1935
         End
         Begin VB.Label Labels 
            AutoSize        =   -1  'True
            Caption         =   "&宽:"
            Height          =   180
            Index           =   5
            Left            =   360
            TabIndex        =   3
            Top             =   240
            Width           =   270
         End
         Begin VB.Label Labels 
            AutoSize        =   -1  'True
            Caption         =   "&高:"
            Height          =   180
            Index           =   6
            Left            =   360
            TabIndex        =   5
            Top             =   600
            Width           =   270
         End
      End
   End
   Begin VB.Menu File 
      Caption         =   "文件"
      Begin VB.Menu OpenFile 
         Caption         =   "打开"
      End
      Begin VB.Menu Save 
         Caption         =   "导出为schematic文件"
      End
      Begin VB.Menu DivingLine 
         Caption         =   "-"
      End
      Begin VB.Menu Exit 
         Caption         =   "退出"
      End
   End
   Begin VB.Menu Preview 
      Caption         =   "预览"
   End
   Begin VB.Menu Setting 
      Caption         =   "设置"
      Begin VB.Menu Paletteset 
         Caption         =   "调色板设置"
         Begin VB.Menu Type 
            Caption         =   "格式"
            Begin VB.Menu Flat 
               Caption         =   "平面"
            End
            Begin VB.Menu Bumpy 
               Caption         =   "立体"
            End
         End
         Begin VB.Menu Palette 
            Caption         =   "调色板"
            Begin VB.Menu Wool 
               Caption         =   "羊毛"
               Checked         =   -1  'True
               Enabled         =   0   'False
            End
            Begin VB.Menu DivingLine1 
               Caption         =   "-"
            End
            Begin VB.Menu mnuPalette1_7 
               Caption         =   "方块1.7"
               Checked         =   -1  'True
               Index           =   0
               Visible         =   0   'False
            End
            Begin VB.Menu DivingLine2 
               Caption         =   "-"
            End
            Begin VB.Menu mnuPalette1_8 
               Caption         =   "方块1.8"
               Checked         =   -1  'True
               Index           =   0
               Visible         =   0   'False
            End
            Begin VB.Menu DivingLine3 
               Caption         =   "-"
            End
            Begin VB.Menu mnuPalette1_10 
               Caption         =   "方块1.10"
               Checked         =   -1  'True
               Index           =   0
               Visible         =   0   'False
            End
            Begin VB.Menu DivingLine4 
               Caption         =   "-"
            End
            Begin VB.Menu mnuPalette1_12 
               Caption         =   "方块1.12"
               Checked         =   -1  'True
               Index           =   0
               Visible         =   0   'False
            End
         End
      End
      Begin VB.Menu CaleSet 
         Caption         =   "算法设置"
         Begin VB.Menu DG 
            Caption         =   "近似颜色"
         End
         Begin VB.Menu OD 
            Caption         =   "矩形抖动"
         End
         Begin VB.Menu FSD 
            Caption         =   "误差扩散"
         End
      End
   End
   Begin VB.Menu About 
      Caption         =   "关于"
      Begin VB.Menu Image2Schematic 
         Caption         =   "Image2Schematic"
      End
      Begin VB.Menu AA55 
         Caption         =   "0xAA55论坛"
      End
      Begin VB.Menu DivingLine5 
         Caption         =   "-"
      End
      Begin VB.Menu GetHelp 
         Caption         =   "获取帮助"
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim frmh As Long, frmw As Long
'Dim m_SendStart As Single
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Private Const INFINITE = -1&
Private Const SYNCHRONIZE = &H100000
Private Declare Function WaitForSingleObject Lib "kernel32" (ByVal hHandle As Long, ByVal dwMilliseconds As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Private Const SendTime As Single = 3
Private Declare Sub keybd_event Lib "user32" (ByVal bVk As Byte, ByVal bScan As Byte, ByVal dwFlags As Long, ByVal dwExtraInfo As Long)
Private Const KEYEVENTF_KEYUP = &H2
Private Const VK_DIVIDE = &H6F
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Private Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer
Private Type OPENFILENAME


    lStructSize As Long
    hwndOwner As Long
    hInstance As Long
    lpstrFilter As String
    lpstrCustomFilter As String
    nMaxCustFilter As Long
    nFilterIndex As Long
    lpstrFile As String
    nMaxFile As Long
    lpstrFileTitle As String
    nMaxFileTitle As Long
    lpstrInitialDir As String
    lpstrTitle As String
    flags As Long
    nFileOffset As Integer
    nFileExtension As Integer
    lpstrDefExt As String
    lCustData As Long
    lpfnHook As Long
    lpTemplateName As String
End Type
Private Declare Function GetSaveFileName Lib "comdlg32.dll" Alias "GetSaveFileNameA" (pOpenfilename As Any) As Long
Private Declare Function GetOpenFileName Lib "comdlg32.dll" Alias "GetOpenFileNameW" (pOpenfilename As Any) As Long
Private Const OFN_EXPLORER = &H80000                         '  new look commdlg
Private Const OFN_FILEMUSTEXIST = &H1000
Private Const OFN_HIDEREADONLY = &H4
Private Const OFN_EXTENSIONDIFFERENT = &H400
Private Const OFN_PATHMUSTEXIST = &H800
Private Const OFN_OVERWRITEPROMPT = &H2
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)

'调色板相关
Private Type RGB32
    R As Byte
    G As Byte
    B As Byte
    X As Byte
End Type
Private Type RGB24
    B As Byte
    G As Byte
    R As Byte
End Type

Private Type Color_t
    R As Long
    G As Long
    B As Long
End Type

Private mnuPalette() As String
Private m_NumColors As Long
Private m_Palette() As Long
Private m_PaletteRGB() As RGB32
Private m_PaletteBGR() As RGB32
Private m_PaletteColors() As Color_t
Private m_MinPalRGB As Color_t
Private m_MaxPalRGB As Color_t
Private m_PalMinMaxRGBDiff As Color_t
Private m_Bumpy() As Long
Private m_Names() As Byte
Private m_Nbt() As Byte
Private PaletteCheck() As Boolean
Private PaletteSetAgain As Boolean
Private PaletteCount As Long
Private CalcMode As Long
Private IsBumpy As Boolean

Private m_RDiff As Long, m_GDiff As Long, m_BDiff As Long
Private Const m_MatrixSize As Long = 16
Private m_DitherMatrix(m_MatrixSize * m_MatrixSize - 1) As Long

Private m_ColorIndices() As Long

Private m_DragdroppedFileName As String
Private m_Width As Long, m_Height As Long
Private m_WidthEdit As Boolean, m_HeightEdit As Boolean

'Private Const m_Rhythm As Single = 0.075

Private Type BITMAPINFOHEADER '40 bytes
    biSize As Long
    biWidth As Long
    biHeight As Long
    biPlanes As Integer
    biBitCount As Integer
    biCompression As Long
    biSizeImage As Long
    biXPelsPerMeter As Long
    biYPelsPerMeter As Long
    biClrUsed As Long
    biClrImportant As Long
End Type
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Declare Function StretchDIBits Lib "gdi32" (ByVal hDC As Long, ByVal X As Long, ByVal Y As Long, ByVal dX As Long, ByVal dY As Long, ByVal SrcX As Long, ByVal SrcY As Long, ByVal wSrcWidth As Long, ByVal wSrcHeight As Long, lpBits As Any, lpBitsInfo As Any, ByVal wUsage As Long, ByVal dwRop As Long) As Long
Private Declare Function CreateDIBSection Lib "gdi32" (ByVal hDC As Long, pBitmapInfo As Any, ByVal un As Long, lplpVoid As Long, ByVal Handle As Long, ByVal dw As Long) As Long
Private Declare Function SelectObject Lib "gdi32" (ByVal hDC As Long, ByVal hObject As Long) As Long
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Private Declare Function CreateCompatibleDC Lib "gdi32" (ByVal hDC As Long) As Long
Private Declare Function DeleteDC Lib "gdi32" (ByVal hDC As Long) As Long
Private Declare Function SetStretchBltMode Lib "gdi32" (ByVal hDC As Long, ByVal nStretchMode As Long) As Long
Private Const DIB_RGB_COLORS = 0
Private Const HALFTONE = 4

Private Function GetNearestColor(ByVal R As Long, ByVal G As Long, ByVal B As Long) As Long
Dim I&
Dim RD&, GD&, BD&
Dim DistSq As Long
Dim MinDistSq As Long
MinDistSq = 16777216
For I = 0 To m_NumColors - 1
    RD = CLng(m_PaletteColors(I).R) - R
    GD = CLng(m_PaletteColors(I).G) - G
    BD = CLng(m_PaletteColors(I).B) - B
    DistSq = RD * RD + GD * GD + BD * BD
    If DistSq < MinDistSq Then
        MinDistSq = DistSq
        GetNearestColor = I
    End If
Next
End Function

Private Sub GetPaletteProperties()
Dim I As Long

m_MaxPalRGB.R = -1
m_MaxPalRGB.G = -1
m_MaxPalRGB.B = -1
m_MinPalRGB.R = 256
m_MinPalRGB.G = 256
m_MinPalRGB.B = 256
'Long的速度比Byte快，所以用Long存储调色板副本
Erase m_PaletteColors
ReDim m_PaletteColors(m_NumColors - 1)
For I = 0 To m_NumColors - 1
    m_PaletteColors(I).R = m_PaletteRGB(I).R
    m_PaletteColors(I).G = m_PaletteRGB(I).G
    m_PaletteColors(I).B = m_PaletteRGB(I).B
    
    If m_MaxPalRGB.R < m_PaletteColors(I).R Then m_MaxPalRGB.R = m_PaletteColors(I).R
    If m_MaxPalRGB.G < m_PaletteColors(I).G Then m_MaxPalRGB.G = m_PaletteColors(I).G
    If m_MaxPalRGB.B < m_PaletteColors(I).B Then m_MaxPalRGB.B = m_PaletteColors(I).B
    If m_MinPalRGB.R > m_PaletteColors(I).R Then m_MinPalRGB.R = m_PaletteColors(I).R
    If m_MinPalRGB.G > m_PaletteColors(I).G Then m_MinPalRGB.G = m_PaletteColors(I).G
    If m_MinPalRGB.B > m_PaletteColors(I).B Then m_MinPalRGB.B = m_PaletteColors(I).B
Next

m_PalMinMaxRGBDiff.R = m_MaxPalRGB.R - m_MinPalRGB.R
m_PalMinMaxRGBDiff.G = m_MaxPalRGB.G - m_MinPalRGB.G
m_PalMinMaxRGBDiff.B = m_MaxPalRGB.B - m_MinPalRGB.B

'找出调色板最大幅度差
Dim J As Long
Dim RN&, GN&, BN&, CD&
m_RDiff = 0
m_GDiff = 0
m_BDiff = 0
For I = 0 To 255
    For J = 0 To m_NumColors - 1
        If m_PaletteColors(J).R = I Then
            CD = I - RN
            If m_RDiff < CD Then m_RDiff = CD
            RN = I
        End If
        If m_PaletteColors(J).G = I Then
            CD = I - GN
            If m_GDiff < CD Then m_GDiff = CD
            GN = I
        End If
        If m_PaletteColors(J).B = I Then
            CD = I - BN
            If m_BDiff < CD Then m_BDiff = CD
            BN = I
        End If
    Next
Next

End Sub

Private Sub Load_Palette()
Dim I&
Dim T&
Dim J
Erase m_Palette, m_PaletteRGB, m_PaletteBGR, m_Bumpy, m_Names
PaletteCount = PaletteCount + 16
If IsBumpy Then
m_NumColors = PaletteCount * 3
ReDim m_Palette(m_NumColors - 1)
ReDim m_PaletteRGB(m_NumColors - 1)
ReDim m_PaletteBGR(m_NumColors - 1)
ReDim m_Bumpy(m_NumColors - 1)
ReDim m_Names(m_NumColors - 1)
ReDim m_Nbt(m_NumColors - 1)



J = 47
m_Palette(J - 47) = RGB(180, 180, 180)
m_Palette(J - 46) = RGB(220, 220, 220)
m_Palette(J - 45) = RGB(255, 255, 255)

m_Palette(J - 44) = RGB(152, 89, 36)
m_Palette(J - 43) = RGB(186, 109, 44)
m_Palette(J - 42) = RGB(216, 127, 51)

m_Palette(J - 41) = RGB(125, 53, 152)
m_Palette(J - 40) = RGB(153, 65, 186)
m_Palette(J - 39) = RGB(178, 76, 216)

m_Palette(J - 38) = RGB(72, 108, 152)
m_Palette(J - 37) = RGB(88, 132, 186)
m_Palette(J - 36) = RGB(102, 153, 216)

m_Palette(J - 35) = RGB(161, 161, 36)
m_Palette(J - 34) = RGB(197, 197, 44)
m_Palette(J - 33) = RGB(229, 229, 51)

m_Palette(J - 32) = RGB(89, 144, 17)
m_Palette(J - 31) = RGB(109, 176, 21)
m_Palette(J - 30) = RGB(127, 204, 25)

m_Palette(J - 29) = RGB(170, 89, 116)
m_Palette(J - 28) = RGB(208, 109, 142)
m_Palette(J - 27) = RGB(242, 127, 165)

m_Palette(J - 26) = RGB(53, 53, 53)
m_Palette(J - 25) = RGB(65, 65, 65)
m_Palette(J - 24) = RGB(76, 76, 76)

m_Palette(J - 23) = RGB(108, 108, 108)
m_Palette(J - 22) = RGB(132, 132, 132)
m_Palette(J - 21) = RGB(153, 153, 153)

m_Palette(J - 20) = RGB(53, 89, 108)
m_Palette(J - 19) = RGB(65, 109, 132)
m_Palette(J - 18) = RGB(76, 127, 153)

m_Palette(J - 17) = RGB(89, 44, 125)
m_Palette(J - 16) = RGB(109, 54, 153)
m_Palette(J - 15) = RGB(127, 63, 178)

m_Palette(J - 14) = RGB(36, 53, 125)
m_Palette(J - 13) = RGB(44, 65, 153)
m_Palette(J - 12) = RGB(51, 76, 178)

m_Palette(J - 11) = RGB(72, 53, 36)
m_Palette(J - 10) = RGB(88, 65, 44)
m_Palette(J - 9) = RGB(102, 76, 51)

m_Palette(J - 8) = RGB(72, 89, 36)
m_Palette(J - 7) = RGB(88, 109, 44)
m_Palette(J - 6) = RGB(102, 127, 51)

m_Palette(J - 5) = RGB(108, 36, 36)
m_Palette(J - 4) = RGB(132, 44, 44)
m_Palette(J - 3) = RGB(153, 51, 51)

m_Palette(J - 2) = RGB(17, 17, 17)
m_Palette(J - 1) = RGB(21, 21, 21)
m_Palette(J) = RGB(25, 25, 25)

For I = J - 47 To J
m_Names(I) = &H23
Next

For I = 0 To 2
m_Nbt(J - 42 + I) = &H1
m_Nbt(J - 41 + I) = &H2
m_Nbt(J - 38 + I) = &H3
m_Nbt(J - 35 + I) = &H4
m_Nbt(J - 32 + I) = &H5
m_Nbt(J - 29 + I) = &H6
m_Nbt(J - 26 + I) = &H7
m_Nbt(J - 23 + I) = &H8
m_Nbt(J - 20 + I) = &H9
m_Nbt(J - 17 + I) = &HA
m_Nbt(J - 14 + I) = &HB
m_Nbt(J - 11 + I) = &HC
m_Nbt(J - 8 + I) = &HD
m_Nbt(J - 5 + I) = &HE
m_Nbt(J - 2 + I) = &HF
Next

If PaletteCheck(1) = True Then
J = J + 3
m_Palette(J) = RGB(79, 79, 79)
m_Palette(J + 1) = RGB(96, 96, 96)
m_Palette(J + 2) = RGB(112, 112, 112)
m_Names(J) = &H1
m_Names(J + 1) = &H1
m_Names(J + 2) = &H1
End If

If PaletteCheck(2) = True Then
J = J + 3
m_Palette(J) = RGB(89, 125, 39)
m_Palette(J + 1) = RGB(109, 153, 48)
m_Palette(J + 2) = RGB(127, 178, 56)
m_Names(J) = &H2
m_Names(J + 1) = &H2
m_Names(J + 2) = &H2
End If

If PaletteCheck(3) = True Then
J = J + 3
m_Palette(J) = RGB(129, 74, 33)
m_Palette(J + 1) = RGB(157, 91, 40)
m_Palette(J + 2) = RGB(183, 106, 47)
m_Names(J) = &H3
m_Names(J + 1) = &H3
m_Names(J + 2) = &H3
m_Nbt(J) = &H1
m_Nbt(J + 1) = &H1
m_Nbt(J + 2) = &H1
End If

If PaletteCheck(4) = True Then
J = J + 3
m_Palette(J) = RGB(101, 84, 51)
m_Palette(J + 1) = RGB(123, 103, 62)
m_Palette(J + 2) = RGB(143, 119, 72)
m_Names(J) = &H5
m_Names(J + 1) = &H5
m_Names(J + 2) = &H5
End If

If PaletteCheck(5) = True Then
J = J + 3
m_Palette(J) = RGB(90, 59, 34)
m_Palette(J + 1) = RGB(110, 73, 41)
m_Palette(J + 2) = RGB(127, 85, 48)
m_Names(J) = &H5
m_Names(J + 1) = &H5
m_Names(J + 2) = &H5
m_Nbt(J) = &H1
m_Nbt(J + 1) = &H1
m_Nbt(J + 2) = &H1
End If

If PaletteCheck(6) = True Then
J = J + 3
m_Palette(J) = RGB(45, 45, 180)
m_Palette(J + 1) = RGB(55, 55, 220)
m_Palette(J + 2) = RGB(64, 64, 255)
m_Names(J) = &H9
m_Names(J + 1) = &H9
m_Names(J + 2) = &H9
End If

If PaletteCheck(7) = True Then
J = J + 3
m_Palette(J) = RGB(0, 87, 0)
m_Palette(J + 1) = RGB(0, 106, 0)
m_Palette(J + 2) = RGB(0, 124, 0)
m_Names(J) = &H12
m_Names(J + 1) = &H12
m_Names(J + 2) = &H12
End If

If PaletteCheck(8) = True Then
J = J + 3
m_Palette(J) = RGB(52, 90, 180)
m_Palette(J + 1) = RGB(63, 110, 220)
m_Palette(J + 2) = RGB(74, 128, 255)
m_Names(J) = &H16
m_Names(J + 1) = &H16
m_Names(J + 1) = &H16
End If

If PaletteCheck(9) = True Then
J = J + 3
m_Palette(J) = RGB(174, 164, 115)
m_Palette(J + 1) = RGB(213, 201, 140)
m_Palette(J + 2) = RGB(247, 233, 163)
m_Names(J) = &H18
m_Names(J + 1) = &H18
m_Names(J + 2) = &H18
End If

If PaletteCheck(10) = True Then
J = J + 3
m_Palette(J) = RGB(138, 138, 138)
m_Palette(J + 1) = RGB(169, 169, 169)
m_Palette(J + 2) = RGB(197, 197, 197)
m_Names(J) = &H1E
m_Names(J + 1) = &H1E
m_Names(J + 2) = &H1E
End If

If PaletteCheck(11) = True Then
J = J + 3
m_Palette(J) = RGB(176, 168, 54)
m_Palette(J + 1) = RGB(215, 205, 66)
m_Palette(J + 2) = RGB(250, 238, 77)
m_Names(J) = &H29
m_Names(J + 1) = &H29
m_Names(J + 2) = &H29
End If

If PaletteCheck(12) = True Then
J = J + 3
m_Palette(J) = RGB(117, 117, 117)
m_Palette(J + 1) = RGB(144, 144, 144)
m_Palette(J + 2) = RGB(167, 167, 167)
m_Names(J) = &H2A
m_Names(J + 1) = &H2A
m_Names(J + 2) = &H2A
End If

If PaletteCheck(13) = True Then
J = J + 3
m_Palette(J) = RGB(180, 0, 0)
m_Palette(J + 1) = RGB(220, 0, 0)
m_Palette(J + 2) = RGB(255, 0, 0)
m_Names(J) = &H2E
m_Names(J + 1) = &H2E
m_Names(J + 2) = &H2E
End If

If PaletteCheck(14) = True Then
J = J + 3
m_Palette(J) = RGB(64, 154, 150)
m_Palette(J + 1) = RGB(79, 188, 183)
m_Palette(J + 2) = RGB(92, 219, 213)
m_Names(J) = &H39
m_Names(J + 1) = &H39
m_Names(J + 2) = &H39
End If


If PaletteCheck(15) = True Then
J = J + 3
m_Palette(J) = RGB(112, 112, 180)
m_Palette(J + 1) = RGB(138, 138, 220)
m_Palette(J + 2) = RGB(160, 160, 255)
m_Names(J) = &H4F
m_Names(J + 1) = &H4F
m_Names(J + 2) = &H4F
End If


If PaletteCheck(16) = True Then
J = J + 3
m_Palette(J) = RGB(115, 118, 129)
m_Palette(J + 1) = RGB(141, 144, 158)
m_Palette(J + 2) = RGB(164, 168, 184)
m_Names(J) = &H52
m_Names(J + 1) = &H52
m_Names(J + 2) = &H52
End If

If PaletteCheck(17) = True Then
J = J + 3
m_Palette(J) = RGB(79, 1, 0)
m_Palette(J + 1) = RGB(96, 1, 0)
m_Palette(J + 2) = RGB(112, 2, 0)
m_Names(J) = &H57
m_Names(J + 1) = &H57
m_Names(J + 2) = &H57
End If

If PaletteCheck(18) = True Then
J = J + 3
m_Palette(J) = RGB(0, 153, 40)
m_Palette(J + 1) = RGB(0, 187, 50)
m_Palette(J + 2) = RGB(0, 217, 58)
m_Names(J) = &H85
m_Names(J + 1) = &H85
m_Names(J + 2) = &H85
End If

If PaletteCheck(19) = True Then
J = J + 3
m_Palette(J) = RGB(0, 87, 0)
m_Palette(J + 1) = RGB(0, 106, 0)
m_Palette(J + 2) = RGB(0, 124, 0)
m_Names(J) = &H67
m_Names(J + 1) = &H67
m_Names(J + 2) = &H67
End If

If PaletteCheck(20) = True Then
J = J + 3
m_Palette(J) = RGB(150, 88, 36)
m_Palette(J + 1) = RGB(184, 108, 43)
m_Palette(J + 2) = RGB(213, 125, 50)
m_Names(J) = &H98
m_Names(J + 1) = &H98
m_Names(J + 2) = &H98
End If

If PaletteCheck(21) = True Then
J = J + 3
m_Palette(J) = RGB(180, 177, 172)
m_Palette(J + 1) = RGB(220, 217, 211)
m_Palette(J + 2) = RGB(255, 252, 245)
m_Names(J) = &H9B
m_Names(J + 1) = &H9B
m_Names(J + 2) = &H9B
End If

If PaletteCheck(22) = True Then
J = J + 3
m_Palette(J) = RGB(64, 154, 150)
m_Palette(J + 1) = RGB(79, 188, 183)
m_Palette(J + 2) = RGB(92, 219, 213)
m_Names(J) = &HA8
m_Names(J + 1) = &HA8
m_Names(J + 2) = &HA8
End If

If PaletteCheck(23) = True Then
J = J + 3
m_Palette(J) = RGB(180, 0, 0)
m_Palette(J + 1) = RGB(220, 0, 0)
m_Palette(J + 2) = RGB(255, 0, 0)
m_Names(J) = &HB3
m_Names(J + 1) = &HB3
m_Names(J + 2) = &HB3
End If

If PaletteCheck(24) = True Then
J = J + 3
m_Palette(J) = RGB(124, 52, 150)
m_Palette(J + 1) = RGB(151, 64, 184)
m_Palette(J + 2) = RGB(176, 75, 213)
m_Names(J) = &HC9
m_Names(J + 1) = &HC9
m_Names(J + 2) = &HC9
End If

If PaletteCheck(25) = True Then
J = J + 3
m_Palette(J) = RGB(107, 36, 36)
m_Palette(J + 1) = RGB(130, 43, 43)
m_Palette(J + 2) = RGB(151, 50, 50)
m_Names(J) = &HD6
m_Names(J + 1) = &HD6
m_Names(J + 2) = &HD6
End If

If PaletteCheck(26) = True Then
J = J + 3
m_Palette(J) = RGB(172, 162, 114)
m_Palette(J + 1) = RGB(210, 199, 138)
m_Palette(J + 2) = RGB(244, 230, 161)
m_Names(J) = &HD8
m_Names(J + 1) = &HD8
m_Names(J + 2) = &HD8
End If

'生成另一份副本，便于取得RGB颜色
CopyMemory m_PaletteRGB(0), m_Palette(0), m_NumColors * 4
CopyMemory m_PaletteBGR(0), m_Palette(0), m_NumColors * 4
For I = 0 To m_NumColors - 1
    T = m_PaletteBGR(I).R
    m_PaletteBGR(I).R = m_PaletteBGR(I).B
    m_PaletteBGR(I).B = T
Next

For I = 0 To m_NumColors - 1 Step 3
    m_Bumpy(I) = -1
    m_Bumpy(I + 2) = 1
Next

Else
m_NumColors = PaletteCount
ReDim m_Palette(m_NumColors - 1)
ReDim m_PaletteRGB(m_NumColors - 1)
ReDim m_PaletteBGR(m_NumColors - 1)
ReDim m_Bumpy(m_NumColors - 1)
ReDim m_Names(m_NumColors - 1)
ReDim m_Nbt(m_NumColors - 1)

J = 15
m_Palette(J - 15) = RGB(220, 220, 220)
m_Palette(J - 14) = RGB(186, 109, 44)
m_Palette(J - 13) = RGB(153, 65, 186)
m_Palette(J - 12) = RGB(88, 132, 186)
m_Palette(J - 11) = RGB(197, 197, 44)
m_Palette(J - 10) = RGB(109, 176, 21)
m_Palette(J - 9) = RGB(208, 109, 142)
m_Palette(J - 8) = RGB(65, 65, 65)
m_Palette(J - 7) = RGB(132, 132, 132)
m_Palette(J - 6) = RGB(65, 109, 132)
m_Palette(J - 5) = RGB(109, 54, 153)
m_Palette(J - 4) = RGB(44, 65, 153)
m_Palette(J - 3) = RGB(88, 65, 44)
m_Palette(J - 2) = RGB(88, 109, 44)
m_Palette(J - 1) = RGB(132, 44, 44)
m_Palette(J) = RGB(21, 21, 21)

For I = J - 15 To J
m_Names(I) = &H23
Next

m_Nbt(J - 14) = &H1
m_Nbt(J - 13) = &H2
m_Nbt(J - 12) = &H3
m_Nbt(J - 11) = &H4
m_Nbt(J - 10) = &H5
m_Nbt(J - 9) = &H6
m_Nbt(J - 8) = &H7
m_Nbt(J - 7) = &H8
m_Nbt(J - 6) = &H9
m_Nbt(J - 5) = &HA
m_Nbt(J - 4) = &HB
m_Nbt(J - 3) = &HC
m_Nbt(J - 2) = &HD
m_Nbt(J - 1) = &HE
m_Nbt(J) = &HF

If PaletteCheck(1) = True Then
J = J + 1
m_Palette(J) = RGB(96, 96, 96)
m_Names(J) = &H1
End If

If PaletteCheck(2) = True Then
J = J + 1
m_Palette(J) = RGB(109, 153, 48)
m_Names(J) = &H2
End If

If PaletteCheck(3) = True Then
J = J + 1
m_Palette(J) = RGB(157, 91, 40)
m_Names(J) = &H3
m_Nbt(J) = 1
End If

If PaletteCheck(4) = True Then
J = J + 1
m_Palette(J) = RGB(123, 103, 62)
m_Names(J) = &H5
End If

If PaletteCheck(5) = True Then
J = J + 1
m_Palette(J) = RGB(110, 73, 41)
m_Names(J) = &H5
m_Nbt(J) = 1
End If

If PaletteCheck(6) = True Then
J = J + 1
m_Palette(J) = RGB(55, 55, 220)
m_Names(J) = &H9
End If

If PaletteCheck(7) = True Then
J = J + 1
m_Palette(J) = RGB(0, 106, 0)
m_Names(J) = &H12
End If

If PaletteCheck(8) = True Then
J = J + 1
m_Palette(J) = RGB(63, 110, 220)
m_Names(J) = &H16
End If

If PaletteCheck(9) = True Then
J = J + 1
m_Palette(J) = RGB(213, 201, 140)
m_Names(J) = &H18
End If

If PaletteCheck(10) = True Then
J = J + 1
m_Palette(J) = RGB(169, 169, 169)
m_Names(J) = &H1E
End If

If PaletteCheck(11) = True Then
J = J + 1
m_Palette(J) = RGB(215, 205, 66)
m_Names(J) = &H29
End If

If PaletteCheck(12) = True Then
J = J + 1
m_Palette(J) = RGB(144, 144, 144)
m_Names(J) = &H2A
End If

If PaletteCheck(13) = True Then
J = J + 1
m_Palette(J) = RGB(220, 0, 0)
m_Names(J) = &H2E
End If

If PaletteCheck(14) = True Then
J = J + 1
m_Palette(J) = RGB(79, 188, 183)
m_Names(J) = &H39
End If


If PaletteCheck(15) = True Then
J = J + 1
m_Palette(J) = RGB(138, 138, 220)
m_Names(J) = &H4F
End If


If PaletteCheck(16) = True Then
J = J + 1
m_Palette(J) = RGB(141, 144, 158)
m_Names(J) = &H52
End If

If PaletteCheck(17) = True Then
J = J + 1
m_Palette(J) = RGB(96, 1, 0)
m_Names(J) = &H57
End If

If PaletteCheck(18) = True Then
J = J + 1
m_Palette(J) = RGB(0, 187, 50)
m_Names(J) = &H85
End If

If PaletteCheck(19) = True Then
J = J + 1
m_Palette(J) = RGB(0, 106, 0)
m_Names(J) = &H67
End If

If PaletteCheck(20) = True Then
J = J + 1
m_Palette(J) = RGB(184, 108, 43)
m_Names(J) = &H98
End If

If PaletteCheck(21) = True Then
J = J + 1
m_Palette(J) = RGB(220, 217, 211)
m_Names(J) = &H9B
End If

If PaletteCheck(22) = True Then
J = J + 1
m_Palette(J) = RGB(79, 188, 183)
m_Names(J) = &HA8
End If

If PaletteCheck(23) = True Then
J = J + 1
m_Palette(J) = RGB(220, 0, 0)
m_Names(J) = &HB3
End If

If PaletteCheck(24) = True Then
J = J + 1
m_Palette(J) = RGB(151, 64, 184)
m_Names(J) = &HC9
End If

If PaletteCheck(25) = True Then
J = J + 1
m_Palette(J) = RGB(130, 43, 43)
m_Names(J) = &HD6
End If

If PaletteCheck(26) = True Then
J = J + 1
m_Palette(J) = RGB(210, 199, 138)
m_Names(J) = &HD8
End If

'生成另一份副本，便于取得RGB颜色
CopyMemory m_PaletteRGB(0), m_Palette(0), m_NumColors * 4
CopyMemory m_PaletteBGR(0), m_Palette(0), m_NumColors * 4
For I = 0 To m_NumColors - 1
    T = m_PaletteBGR(I).R
    m_PaletteBGR(I).R = m_PaletteBGR(I).B
    m_PaletteBGR(I).B = T
Next

End If

GetPaletteProperties

End Sub

'生成抖动矩阵
Private Sub GenDitherMatrix()
Dim X As Long, Y As Long
Dim I As Long

For Y = 0 To 15
    For X = 0 To 15
        m_DitherMatrix(I) = (picLM.Point(X, Y) And &HFF&) - 128
        I = I + 1
    Next
Next
End Sub

'加载图像，应用抖动
Private Sub Load_Picture(Path As String)


Dim Pic As StdPicture
Set Pic = LoadPicture(Path)

m_Width = ScaleX(Pic.Width, vbHimetric, vbPixels)
m_Height = ScaleY(Pic.Height, vbHimetric, vbPixels)
txtWidth.Text = m_Width
txtHeight.Text = m_Height

Set picSrc.Picture = Pic
picImage.Visible = False
picImage.Cls
picImage.Move 0, 0, m_Width, m_Height
picImage.Visible = True
picImage_Resize
ApplyDithering

Exit Sub
ErrHandler:
MsgBox "错误：加载图片失败。" & vbCrLf & "(" & Err.Number & ")" & Err.Description, vbExclamation, "加载图片失败"
End Sub

Private Sub AA55_Click()
Call ShellExecute(hwnd, "open", "https://www.0xaa55.com", vbNullString, vbNullString, &H0)
End Sub

Private Sub Bumpy_Click()
Bumpy.Checked = True
Flat.Checked = False
IsBumpy = True
Load_Palette
ApplyDithering
End Sub

Private Sub cmdApplySizing_Click()
Dim NewWidth As Long, NewHeight As Long
NewWidth = Val(txtWidth.Text)
NewHeight = Val(txtHeight.Text)

If NewWidth = 0 Or NewHeight = 0 Then
    MsgBox "错误：输入的图片大小无效。", vbExclamation, "不支持此大小"
    Exit Sub
End If

picImage.Move picImage.Left + picImage.Width \ 2 - NewWidth \ 2, _
              picImage.Top + picImage.Height \ 2 - NewHeight \ 2, _
    NewWidth, NewHeight
picImage_Resize
ApplyDithering
End Sub

'Private Function CreateDIB8_WithPalette(PtrOut As Long, ByVal Width, ByVal Height) As Long
'Dim BMIF As BITMAPINFO_8
'With BMIF.Hdr
'    .biSize = 40
'    .biWidth = Width
'    .biHeight = Height
'    .biPlanes = 1
'    .biBitCount = 8
'    .biClrUsed = m_NumColors
'End With
'CopyMemory BMIF.Pal(0), m_PaletteBGR(0), 4 * m_NumColors
'
'Dim hTempDC As Long
'hTempDC = CreateCompatibleDC(hDC)
'
'Dim hDIB As Long
'hDIB = CreateDIBSection(hDC, BMIF, DIB_RGB_COLORS, PtrOut, 0, 0)
'DeleteObject SelectObject(hTempDC, hDIB)
'DeleteObject hDIB
'
'CreateDIB8_WithPalette = hTempDC
'End Function

Private Function CreateDIB24(PtrOut As Long, ByVal Width, ByVal Height) As Long
Dim BMIF As BITMAPINFOHEADER
With BMIF
    .biSize = 40
    .biWidth = Width
    .biHeight = Height
    .biPlanes = 1
    .biBitCount = 24
End With

Dim hTempDC As Long
hTempDC = CreateCompatibleDC(hDC)

Dim hDIB As Long
hDIB = CreateDIBSection(hDC, BMIF, DIB_RGB_COLORS, PtrOut, 0, 0)
DeleteObject SelectObject(hTempDC, hDIB)
DeleteObject hDIB

CreateDIB24 = hTempDC
End Function

Private Function CalcPitch(ByVal Bits As Long, ByVal Width As Long) As Long
CalcPitch = (((Width * Bits - 1) \ 32) + 1) * 4
End Function

Private Sub Downgrade()
Dim BmpWidth As Long, BmpHeight As Long
BmpWidth = picImage.ScaleWidth
BmpHeight = picImage.ScaleHeight

Dim Z As Long, X As Long
Dim I&
Dim ThisPix As Color_t '当前像素颜色值
Dim DoAdjustBrightness As Long
DoAdjustBrightness = 1

'用VB自己的缩放绘图
picImage.Cls
picImage.PaintPicture picSrc.Picture, 0, 0, picImage.ScaleWidth, picImage.ScaleHeight

Dim hTempDC24 As Long, Ptr24 As Long, Pitch24 As Long, Line24() As RGB24
hTempDC24 = CreateDIB24(Ptr24, BmpWidth, BmpHeight)
Pitch24 = CalcPitch(24, BmpWidth)
ReDim Line24(BmpWidth - 1)

Erase m_ColorIndices
ReDim m_ColorIndices(BmpWidth * BmpHeight - 1)
Dim CIPtr As Long

'搬运原图到自己的DIB
BitBlt hTempDC24, 0, 0, BmpWidth, BmpHeight, picImage.hDC, 0, 0, vbSrcCopy

For Z = 0 To picImage.ScaleHeight - 1
    CIPtr = (picImage.ScaleHeight - 1 - Z) * BmpWidth
    '复制一行源RGB
    CopyMemory Line24(0), ByVal Ptr24, BmpWidth * 3
    For X = 0 To picImage.ScaleWidth - 1
        ThisPix.R = Line24(X).R
        ThisPix.G = Line24(X).G
        ThisPix.B = Line24(X).B
        If DoAdjustBrightness Then AdjustBrightness ThisPix
        I = GetNearestColor(ThisPix.R, ThisPix.G, ThisPix.B)
        m_ColorIndices(CIPtr) = I
        Line24(X).R = m_PaletteColors(I).R
        Line24(X).G = m_PaletteColors(I).G
        Line24(X).B = m_PaletteColors(I).B
        CIPtr = CIPtr + 1
    Next
    '复制索引颜色
    CopyMemory ByVal Ptr24, Line24(0), BmpWidth * 3
    
    Ptr24 = Ptr24 + Pitch24
Next

'显示
BitBlt picImage.hDC, 0, 0, BmpWidth, BmpHeight, hTempDC24, 0, 0, vbSrcCopy

'擦屁股
DeleteDC hTempDC24
End Sub

Private Sub Ordered_Dithering()
Dim BmpWidth As Long, BmpHeight As Long
BmpWidth = picImage.ScaleWidth
BmpHeight = picImage.ScaleHeight

Dim Z As Long, X As Long
Dim R&, G&, B&, I&
Dim ThisPix As Color_t '当前像素颜色值
Dim DoAdjustBrightness As Long
DoAdjustBrightness = 1

'用VB自己的缩放绘图
picImage.Cls
picImage.PaintPicture picSrc.Picture, 0, 0, picImage.ScaleWidth, picImage.ScaleHeight

Dim hTempDC24 As Long, Ptr24 As Long, Pitch24 As Long, Line24() As RGB24
hTempDC24 = CreateDIB24(Ptr24, BmpWidth, BmpHeight)
Pitch24 = CalcPitch(24, BmpWidth)
ReDim Line24(BmpWidth - 1)

Erase m_ColorIndices
ReDim m_ColorIndices(BmpWidth * BmpHeight - 1)
Dim CIPtr As Long

'搬运原图到自己的DIB
BitBlt hTempDC24, 0, 0, BmpWidth, BmpHeight, picImage.hDC, 0, 0, vbSrcCopy

For Z = 0 To picImage.ScaleHeight - 1
    CIPtr = (picImage.ScaleHeight - 1 - Z) * BmpWidth
    '复制一行源RGB
    CopyMemory Line24(0), ByVal Ptr24, BmpWidth * 3
    For X = 0 To picImage.ScaleWidth - 1
        ThisPix.R = Line24(X).R
        ThisPix.G = Line24(X).G
        ThisPix.B = Line24(X).B
        If DoAdjustBrightness Then AdjustBrightness ThisPix
        R = CLng(ThisPix.R) + m_RDiff * m_DitherMatrix((Z And &HF&) * m_MatrixSize + (X And &HF&)) \ 192
        G = CLng(ThisPix.G) + m_GDiff * m_DitherMatrix((Z And &HF&) * m_MatrixSize + (X And &HF&)) \ 192
        B = CLng(ThisPix.B) + m_BDiff * m_DitherMatrix((Z And &HF&) * m_MatrixSize + (X And &HF&)) \ 192
        I = GetNearestColor(R, G, B)
        m_ColorIndices(CIPtr) = I
        Line24(X).R = m_PaletteColors(I).R
        Line24(X).G = m_PaletteColors(I).G
        Line24(X).B = m_PaletteColors(I).B
        CIPtr = CIPtr + 1
    Next
    '复制索引颜色
    CopyMemory ByVal Ptr24, Line24(0), BmpWidth * 3
    
    Ptr24 = Ptr24 + Pitch24
Next

'显示
BitBlt picImage.hDC, 0, 0, BmpWidth, BmpHeight, hTempDC24, 0, 0, vbSrcCopy

'擦屁股
DeleteDC hTempDC24
End Sub

Private Sub Floyd_Steinberg_Dithering()
Dim BmpWidth As Long, BmpHeight As Long
BmpWidth = picImage.ScaleWidth
BmpHeight = picImage.ScaleHeight

Dim ThisPix As Color_t      '当前像素颜色值
Dim NextPix As Color_t      '下一个像素的误差扩散值
Dim Down3(2) As Color_t     '下一行三个像素的误差扩散值
Dim LinePix() As Color_t    '计算好的一整行像素的误差扩散值
Dim PixErr As Color_t       '误差
Dim DoAdjustBrightness As Long

Dim LU!, T!
Dim X&, Z&, I&

'用VB自己的缩放绘图
picImage.Cls
picImage.PaintPicture picSrc.Picture, 0, 0, picImage.ScaleWidth, picImage.ScaleHeight

'一个8bit用于存储目标数据，一个24bit用于存储源数据
Dim hTempDC24 As Long, Ptr24 As Long, Pitch24 As Long, Line24() As RGB24
hTempDC24 = CreateDIB24(Ptr24, BmpWidth, BmpHeight)
Pitch24 = CalcPitch(24, BmpWidth)
ReDim Line24(BmpWidth - 1)

Erase m_ColorIndices
ReDim m_ColorIndices(BmpWidth * BmpHeight - 1)
Dim CIPtr As Long

'搬运原图到自己的DIB
BitBlt hTempDC24, 0, 0, BmpWidth, BmpHeight, picImage.hDC, 0, 0, vbSrcCopy


'处理图片数据
ReDim LinePix(picImage.ScaleWidth - 1)
For Z = 0 To picImage.ScaleHeight - 1
    CIPtr = (picImage.ScaleHeight - 1 - Z) * BmpWidth
    '复制一行源RGB
    CopyMemory Line24(0), ByVal Ptr24, BmpWidth * 3
    For X = 0 To picImage.ScaleWidth - 1
        '颜色是用3个字节存储RGB通道的，将其拆开为3个Long
        ThisPix.R = Line24(X).R
        ThisPix.G = Line24(X).G
        ThisPix.B = Line24(X).B
        If DoAdjustBrightness Then AdjustBrightness ThisPix
        
        '计算新的颜色值
        ThisPix.R = ThisPix.R + NextPix.R + LinePix(X).R
        ThisPix.G = ThisPix.G + NextPix.G + LinePix(X).G
        ThisPix.B = ThisPix.B + NextPix.B + LinePix(X).B
        
        '限定偏差
        If ThisPix.R < 0 Then ThisPix.R = 0
        If ThisPix.G < 0 Then ThisPix.G = 0
        If ThisPix.B < 0 Then ThisPix.B = 0
        If ThisPix.R > 255 Then ThisPix.R = 255
        If ThisPix.G > 255 Then ThisPix.G = 255
        If ThisPix.B > 255 Then ThisPix.B = 255
        
        '取得调色板最接近颜色值
        I = GetNearestColor(ThisPix.R, ThisPix.G, ThisPix.B)
        
        '取得误差值
        PixErr.R = ThisPix.R - m_PaletteColors(I).R
        PixErr.G = ThisPix.G - m_PaletteColors(I).G
        PixErr.B = ThisPix.B - m_PaletteColors(I).B
        
        '向右扩散误差值
        NextPix.R = PixErr.R * 7 \ 16
        NextPix.G = PixErr.G * 7 \ 16
        NextPix.B = PixErr.B * 7 \ 16
        
        '然后将误差值向下扩散
        If X >= 1 Then LinePix(X - 1) = Down3(0)
        Down3(0).R = Down3(1).R + PixErr.R * 3 \ 16
        Down3(0).G = Down3(1).G + PixErr.G * 3 \ 16
        Down3(0).B = Down3(1).B + PixErr.B * 3 \ 16
        Down3(1).R = Down3(2).R + PixErr.R * 5 \ 16
        Down3(1).G = Down3(2).G + PixErr.G * 5 \ 16
        Down3(1).B = Down3(2).B + PixErr.B * 5 \ 16
        Down3(2).R = PixErr.R * 1 \ 16
        Down3(2).G = PixErr.G * 1 \ 16
        Down3(2).B = PixErr.B * 1 \ 16
        
        m_ColorIndices(CIPtr) = I
        Line24(X).R = m_PaletteColors(I).R
        Line24(X).G = m_PaletteColors(I).G
        Line24(X).B = m_PaletteColors(I).B
        CIPtr = CIPtr + 1
    Next
    LinePix(X - 1) = Down3(1)
    
    '复制索引颜色
    CopyMemory ByVal Ptr24, Line24(0), BmpWidth * 3
    
    Ptr24 = Ptr24 + Pitch24
Next

'显示
BitBlt picImage.hDC, 0, 0, BmpWidth, BmpHeight, hTempDC24, 0, 0, vbSrcCopy

'擦屁股
DeleteDC hTempDC24
End Sub

Private Sub AdjustBrightness(Col As Color_t)
Col.R = m_MinPalRGB.R + Col.R * m_PalMinMaxRGBDiff.R \ 255
Col.G = m_MinPalRGB.G + Col.G * m_PalMinMaxRGBDiff.R \ 255
Col.B = m_MinPalRGB.B + Col.B * m_PalMinMaxRGBDiff.R \ 255
End Sub

Private Sub Freeze()
On Error Resume Next

Dim Ctrl As Control
For Each Ctrl In Controls
    Ctrl.Enabled = False
Next
End Sub

Private Sub UnFreeze()
On Error Resume Next

Dim Ctrl As Control
For Each Ctrl In Controls
    Ctrl.Enabled = True
Next
End Sub

Private Sub Gen()
Freeze
Dim Z As Long, X As Long, Y As Long, I As Long, J As Long, Pid As Long, R As Long, P As Long, T As Long
Dim BmpWidth As Long, BmpHeight As Long
Dim StrDT() As Byte, StrBL() As Byte, StrTemp As Byte
Dim LoopDB As Long, LoopBI As Long
Dim TempHX() As Byte, TempHY() As Byte, TempHZ() As Byte, TempHLoopDB() As Byte, TempHLoopBI() As Byte
Dim HX As String, HY As String, HZ As String, BY As Long
Dim HLoopDB As String, HLoopBI As String
Dim StrP As Long

If Not IsBumpy Then
    BY = 1
End If

Dim XOff As Long, YOff As Long, ZOff As Long
XOff = 1
YOff = 1
ZOff = 1

BmpWidth = picImage.ScaleWidth
BmpHeight = picImage.ScaleHeight

Dim YPositions() As Long
ReDim YPositions(BmpWidth * BmpHeight - 1)

Dim BlockId() As Long
ReDim BlockId(m_NumColors - 1)
If IsBumpy Then
    For I = 0 To m_NumColors - 1 Step 3
        BlockId(I + 0) = (I + 1)
        BlockId(I + 1) = (I + 1)
        BlockId(I + 2) = (I + 1)
    Next
Else
    For I = 0 To m_NumColors - 1
        BlockId(I) = (I)
    Next
End If

Dim LastUp As Long, LastDown As Long
Dim Bumpy As Long
Dim HeightLimitBreak As Long
I = 0

Const Y_Min_Limit As Long = 0 '最小Y值
Const Y_Max_Limit As Long = 255 '最大Y值

'一列一列来，遍历整个位图
For X = 0 To BmpWidth - 1
    Y = YOff
    I = X
    LastUp = I
    LastDown = I
    For Z = 0 To BmpHeight - 1
        YPositions(I) = Y
        '深，中，浅，-1, 0, 1
        '当前像素亮度，取决于后方的方块的高度位置
        Bumpy = m_Bumpy(m_ColorIndices(I)) '后方的方块需要做出的调整
        
        If Bumpy Then
            Y = Y + Bumpy 'Y值此时是下一个方块的高度
            If Y > BY Then BY = Y
            If Bumpy < 0 Then
                '过低，则需抬高前面的方块
                If Y < Y_Min_Limit Then
                    For J = LastUp To I Step BmpWidth
                        YPositions(J) = YPositions(J) + 1
                        If YPositions(J) > Y_Max_Limit Then
                            YPositions(J) = Y_Min_Limit
                            HeightLimitBreak = 1
                        End If
                    Next
                    Y = Y_Min_Limit
                End If
            
                LastDown = I
            ElseIf Bumpy > 0 Then
                '过高，则要压低前面的方块
                If Y > Y_Max_Limit Then
                    For J = LastDown To I Step BmpWidth
                        YPositions(J) = YPositions(J) - 1
                        If YPositions(J) < Y_Min_Limit Then
                            YPositions(J) = Y_Max_Limit
                            HeightLimitBreak = 1
                        End If
                    Next
                    Y = Y_Max_Limit
                End If
                
                LastUp = I
            End If
        End If
        I = I + BmpWidth
    Next
Next

LoopDB = BmpWidth * BmpHeight * BY
LoopBI = BmpWidth * BmpHeight
TempHX = Replace(Format(Hex(BmpWidth), "@@@@"), " ", "0")
TempHY = Replace(Format(Hex(BY), "@@@@"), " ", "0")
TempHZ = Replace(Format(Hex(BmpHeight), "@@@@"), " ", "0")
TempHLoopDB = Replace(Format(Hex(LoopDB), "@@@@@@@@"), " ", "0")
TempHLoopBI = Replace(Format(Hex(LoopBI), "@@@@@@@@"), " ", "0")
HX = TempHX
HY = TempHY
HZ = TempHZ
HLoopDB = TempHLoopDB
HLoopBI = TempHLoopBI

ReDim StrDT(LoopDB)
ReDim StrBL(LoopDB)

'统计范围
Dim MinY As Long, MaxY As Long
MinY = Y_Max_Limit + 1
MaxY = Y_Min_Limit - 1
For I = 0 To UBound(YPositions)
    Y = YPositions(I) '懒得打字
    If Y < MinY Then MinY = Y
    If Y > MaxY Then MaxY = Y
Next

If HeightLimitBreak Then
    If MsgBox("错误：生成方块超过了高度限制。" & vbCrLf & "按下 [取消] 取消，[确定]继续", vbInformation Or vbOKCancel) = vbCancel Then
        UnFreeze
        Close #1
        Exit Sub
    End If
End If

Dim MapX As Long, MapZ As Long
Dim LastZ As Long, Num As Long
For MapX = 0 To BmpWidth - 1 Step 128
    For MapZ = 0 To BmpHeight - 1 Step 128
        For X = 0 To 127
            Dim LastBlock As Long, LastY As Long
            If MapX + X > BmpWidth - 1 Then Exit For
            I = MapZ * BmpWidth + MapX + X
            LastBlock = BlockId(m_ColorIndices(I))
            LastY = YPositions(I)
            LastZ = 0
            I = I + BmpWidth
            For Z = 1 To 127
            If LastY = 0 Then LastY = 1
                If MapZ + Z > BmpHeight - 1 Then Exit For
                If BlockId(m_ColorIndices(I)) <> LastBlock Or YPositions(I) <> LastY Then
                    If Z - LastZ <= 1 Then
                    StrP = (LastY - 1) * (BmpWidth * BmpHeight) + (ZOff + MapZ + LastZ - 1) * BmpWidth + XOff + MapX + X
                        StrBL(StrP) = m_Names(LastBlock)
                            
                                StrDT(StrP) = m_Nbt(LastBlock)
                            
                    Else
                        Num = (ZOff + MapZ + Z - 1) - (ZOff + MapZ + LastZ)
                        For T = 0 To Num
                            StrP = (LastY - 1) * (BmpWidth * BmpHeight) + (ZOff + MapZ + LastZ + T - 1) * BmpWidth + XOff + MapX + X
                            StrBL(StrP) = m_Names(LastBlock)
                                
                                    StrDT(StrP) = m_Nbt(LastBlock)
                                
                        Next
                    End If
                    LastBlock = BlockId(m_ColorIndices(I))
                    LastY = YPositions(I)
                    LastZ = Z
                End If
                I = I + BmpWidth
            Next
            If LastY = 0 Then LastY = 1
                If Z - LastZ <= 1 Then
                    StrP = (LastY - 1) * (BmpWidth * BmpHeight) + (ZOff + MapZ + LastZ - 1) * BmpWidth + XOff + MapX + X
                        StrBL(StrP) = m_Names(LastBlock)
                            
                                StrDT(StrP) = m_Nbt(LastBlock)
                            
                    Else
                        Num = (ZOff + MapZ + Z - 1) - (ZOff + MapZ + LastZ)
                        For T = 0 To Num
                            StrP = (LastY - 1) * (BmpWidth * BmpHeight) + (ZOff + MapZ + LastZ + T - 1) * BmpWidth + XOff + MapX + X
                            StrBL(StrP) = m_Names(LastBlock)
                                
                                    StrDT(StrP) = m_Nbt(LastBlock)
                                
                        Next
                End If
        Next
    Next
Next

Open App.Path & "\temp" For Binary As #1
Put #1, , Chr$(10) & Chr$(0) & Chr$(9) & "Schematic"
Put #1, , Chr$(2) & Chr$(0) & Chr$(6) & "Height"
Put #1, , CByte("&H" & CStr(Left(HY, 2)))
Put #1, , CByte("&H" & CStr(Right(HY, 2)))
Put #1, , Chr$(2) & Chr$(0) & Chr$(6) & "Length"
Put #1, , CByte("&H" & CStr(Left(HZ, 2)))
Put #1, , CByte("&H" & CStr(Right(HZ, 2)))
Put #1, , Chr$(2) & Chr$(0) & Chr$(5) & "Width"
Put #1, , CByte("&H" & CStr(Left(HX, 2)))
Put #1, , CByte("&H" & CStr(Right(HX, 2)))
Put #1, , Chr$(9) & Chr$(0) & Chr$(8) & "Entities" & Chr$(1) & Chr$(0) & Chr$(0) & Chr$(0) & Chr$(0) & Chr$(9) & Chr$(0) & Chr$(12) & "TileEntities" & Chr$(1) & Chr$(0) & Chr$(0) & Chr$(0) & Chr$(0) & Chr$(9) & Chr$(0) & Chr$(9) & "TileTicks" & Chr$(1) & Chr$(0) & Chr$(0) & Chr$(0) & Chr$(0) & Chr$(8) & Chr$(0) & Chr$(9) & "Materials" & Chr$(0) & Chr$(5) & "Alpha" & Chr$(7) & Chr$(0) & Chr$(4) & "Data"
Put #1, , CByte("&H" & CStr(Left(HLoopDB, 2)))
Put #1, , CByte("&H" & CStr(Mid(HLoopDB, 3, 2)))
Put #1, , CByte("&H" & CStr(Mid(HLoopDB, 5, 2)))
Put #1, , CByte("&H" & CStr(Right(HLoopDB, 2)))

For I = 0 To LoopDB - 1
    If Len(StrDT(I)) = 0 Then
        Put #1, , Chr$(0)
    Else
        Put #1, , CByte(StrDT(I))
    End If
Next

Put #1, , Chr$(7) & Chr$(0) & Chr$(6) & "Biomes"
Put #1, , CByte("&H" & CStr(Left(HLoopBI, 2)))
Put #1, , CByte("&H" & CStr(Mid(HLoopBI, 3, 2)))
Put #1, , CByte("&H" & CStr(Mid(HLoopBI, 5, 2)))
Put #1, , CByte("&H" & CStr(Right(HLoopBI, 2)))

For I = 0 To LoopBI - 1
        Put #1, , Chr$(0)
Next

Put #1, , Chr$(7) & Chr$(0) & Chr$(6) & "Blocks"
Put #1, , CByte("&H" & CStr(Left(HLoopDB, 2)))
Put #1, , CByte("&H" & CStr(Mid(HLoopDB, 3, 2)))
Put #1, , CByte("&H" & CStr(Mid(HLoopDB, 5, 2)))
Put #1, , CByte("&H" & CStr(Right(HLoopDB, 2)))

For I = 0 To LoopDB - 1
    If Len(StrBL(I)) = 0 Then
        Put #1, , Chr$(0)
    Else
        Put #1, , CByte(StrBL(I))
    End If
Next

Put #1, , Chr$(0)

Close #1

OutPut

UnFreeze

End Sub

Private Sub ApplyDithering()
If CalcMode = 0 Then
    Downgrade
ElseIf CalcMode = 1 Then
    Ordered_Dithering
Else
    Floyd_Steinberg_Dithering
End If
End Sub

Private Sub Exit_Click()
End
End Sub

Private Sub FSD_Click()
DG.Checked = False
OD.Checked = False
CalcMode = 2
FSD.Checked = True
End Sub

Private Sub Flat_Click()
Flat.Checked = True
Bumpy.Checked = False
IsBumpy = False
Load_Palette
ApplyDithering
End Sub

Private Sub DG_Click()
OD.Checked = False
FSD.Checked = False
CalcMode = 0
DG.Checked = True
End Sub

Private Sub MCImage_Click()

End Sub

Private Sub GetHelp_Click()
Call ShellExecute(hwnd, "open", "https://github.com/Tao0Lu/Image2Schematic", vbNullString, vbNullString, &H0)
End Sub

Private Sub Image2Schematic_Click()
Call ShellExecute(hwnd, "open", "https://github.com/Tao0Lu/Image2Schematic", vbNullString, vbNullString, &H0)
End Sub

Private Sub OD_Click()
DG.Checked = False
FSD.Checked = False
CalcMode = 1
OD.Checked = True
End Sub

Private Sub Palette_Click()
Palette_Change
End Sub

Private Sub Palette_Change()
Dim I As Long
'计算PaletteCount
For I = 1 To 21
PaletteCheck(I) = mnuPalette1_7(I).Visible
If mnuPalette1_7(I).Visible = True Then PaletteCount = PaletteCount + 1
Next
For I = 1 To 2
PaletteCheck(I) = mnuPalette1_8(I).Visible
If mnuPalette1_8(I).Visible = True Then PaletteCount = PaletteCount + 1
Next
For I = 1 To 3
PaletteCheck(I) = mnuPalette1_10(I).Visible
If mnuPalette1_10(I).Visible = True Then PaletteCount = PaletteCount + 1
Next
End Sub

Private Sub Form_Load()
Dim Path As String
Dim Image As String
Path = App.Path

If Dir(App.Path & "\gzip.exe") = "" Then
MsgBox "错误：gzip.exe丢失。" & vbCrLf & Err.Description, vbExclamation, "加载失败"
End
End If

Show
Load_Mune
Palette_Change
Flat.Checked = True
FSD.Checked = True
CalcMode = 2
IsBumpy = False

m_Width = picSrc.Width
m_Height = picSrc.Height
picImage.Move 0, 0, m_Width, m_Height
picImage_Resize

txtWidth.Text = m_Width
txtHeight.Text = m_Height
Load_Palette
ApplyDithering
End Sub

Private Sub Form_Resize()
On Error Resume Next
picImageView.Width = ScaleWidth - picImageView.Left
End Sub
Function OpenImage()
Dim OFN As OPENFILENAME
With OFN
    .lStructSize = Len(OFN)
    .hwndOwner = hwnd
    .lpstrFilter = Replace("图像文件 (.bmp .jpg .jpeg .gif)|*.bmp;*.jpg;*.jpeg;*.gif|所有文件|*.*|", "|", vbNullChar)
    .nFilterIndex = 1
    .lpstrFile = String(256, 0)
    .nMaxFile = 256
    .lpstrTitle = "选择一个图片文件"
    .flags = OFN_EXPLORER Or OFN_FILEMUSTEXIST Or OFN_HIDEREADONLY Or OFN_EXTENSIONDIFFERENT
End With
If GetOpenFileName(ByVal VarPtr(OFN)) Then
'这里不弄ByVal VarPtr的话……VB会把这个结构体里的所有字符串转换为ANSI
    OpenImage = Trim$(Replace(OFN.lpstrFile, vbNullChar, ""))
End If
End Function

Private Sub OpPalettes_Click(Index As Integer)
Load_Palette
End Sub



Private Sub LimitImageBoxPosition(X As Long, Y As Long)
If picImage.Width <= picImageView.ScaleWidth Then
    X = (picImageView.ScaleWidth - picImage.Width) \ 2
Else
    If X > 0 Then X = 0
    If X < picImageView.ScaleWidth - picImage.Width Then X = picImageView.ScaleWidth - picImage.Width
End If
If picImage.Height <= picImageView.ScaleHeight Then
    Y = (picImageView.ScaleHeight - picImage.Height) \ 2
Else
    If Y > 0 Then Y = 0
    If Y < picImageView.ScaleHeight - picImage.Height Then Y = picImageView.ScaleHeight - picImage.Height
End If
End Sub

Private Function GetDialog() As String
Dim rtn As Long, pos As Integer
Dim Save As OPENFILENAME
    Save.lStructSize = Len(Save)
    Save.hwndOwner = hwnd
    Save.hInstance = App.hInstance
    Save.lpstrFilter = "Schematic文件(*.schematic)"
    Save.lpstrDefExt = "schematic"
    Save.lpstrFile = "Image" & String$(255 - Len("Image"), 0)
    Save.nMaxFile = 255
    Save.lpstrTitle = "导出到"
    Save.flags = OFN_HIDEREADONLY + OFN_PATHMUSTEXIST + OFN_OVERWRITEPROMPT
    rtn = GetSaveFileName(Save)

    If rtn > 0 Then
        pos = InStr(Save.lpstrFile, Chr$(0))
        If pos > 0 Then
            GetDialog = Left$(Save.lpstrFile, pos - 1)
        End If
    End If
    
    Exit Function
    
myError:
    MsgBox "错误：操作错误。", vbCritical + vbOKOnly
End Function

Private Sub OpenFile_Click()
Dim Image As String
Image = OpenImage
If Image = "" Then Exit Sub
Load_Picture Image
End Sub

Private Sub picImage_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Static DragX As Single, DragY As Single
If Button And 1 Then
    Dim NewX As Long, NewY As Long
    NewX = picImage.Left + X - DragX
    NewY = picImage.Top + Y - DragY
    LimitImageBoxPosition NewX, NewY
    picImage.Move NewX, NewY
Else
    DragX = X
    DragY = Y
End If
End Sub

Private Sub picImage_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
If Data.Files.Count Then
    picImage.Cls
    m_DragdroppedFileName = Data.Files(1)
    tmrLoadDragdrop.Enabled = True
    tmrLoadDragdrop.Interval = 1
End If
End Sub

Private Sub picImage_Resize()
Dim X&, Y&

X = picImage.Left
Y = picImage.Top

LimitImageBoxPosition X, Y

picImage.Move X, Y
End Sub

Private Sub picImageView_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
picImage_OLEDragDrop Data, Effect, Button, Shift, X, Y
End Sub

Private Sub picImageView_Resize()
picImage_Resize
End Sub



Private Sub picVAdjust_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
Static DragY As Single
If Button And 1 Then
    Dim NewHeight As Single
    NewHeight = picOutput.Height + DragY - Y
    If NewHeight > ScaleHeight - 24 Then NewHeight = ScaleHeight - 24
    If NewHeight < 8 Then NewHeight = 8
    picOutput.Height = NewHeight
Else
    DragY = Y
End If
End Sub

Private Sub OutPut()
Dim Path As String, FileTemp As String
Dim I As Long, R As Long, P As Long
    Path = GetDialog()
    
    I = Shell(App.Path & "\gzip.exe -f """ & App.Path & "\temp""", vbNormalFocus)
    P = OpenProcess(SYNCHRONIZE, False, I)
    R = WaitForSingleObject(P, INFINITE)
    R = CloseHandle(P)
    
    I = Shell("cmd /c copy """ & App.Path & "\temp.gz"" " & Path & " /y", vbNormalFocus)
    P = OpenProcess(SYNCHRONIZE, False, I)
    R = WaitForSingleObject(P, INFINITE)
    R = CloseHandle(P)
    
    I = Shell("cmd /c del /f /q """ & App.Path & "\temp.gz""", vbNormalFocus)
    P = OpenProcess(SYNCHRONIZE, False, I)
    R = WaitForSingleObject(P, INFINITE)
    R = CloseHandle(P)
End Sub


Private Sub Preview_Click()
ApplyDithering
End Sub

Private Sub Save_Click()
Gen
End Sub

Private Sub tmrLoadDragdrop_Timer()
tmrLoadDragdrop.Enabled = False
tmrLoadDragdrop.Interval = 0
Load_Picture m_DragdroppedFileName
End Sub

Private Sub txtWidth_Change()
Dim NewWidth As Long

If m_HeightEdit Then
    m_HeightEdit = False
    Exit Sub
End If

m_WidthEdit = True

NewWidth = Val(txtWidth.Text)
If NewWidth Then
    If ChkRatio.Value Then
        txtHeight.Text = m_Height * NewWidth \ m_Width
    End If
End If

End Sub

Private Sub txtHeight_Change()
Dim NewHeight As Long

If m_WidthEdit Then
    m_WidthEdit = False
    Exit Sub
End If

m_HeightEdit = True

NewHeight = Val(txtHeight.Text)
If NewHeight Then
    If ChkRatio.Value Then
        txtWidth.Text = m_Width * NewHeight \ m_Height
    End If
End If

End Sub

Private Sub Load_Mune()
Dim I As Long
ReDim mnuPalette(26)
mnuPalette(1) = "石头"        '1
mnuPalette(2) = "草方块"      '2
mnuPalette(3) = "砂土"        '3
mnuPalette(4) = "橡木木板"    '4
mnuPalette(5) = "云杉木板"    '5
mnuPalette(6) = "水"          '6
mnuPalette(7) = "橡木树叶"    '7
mnuPalette(8) = "青金石块"    '8
mnuPalette(9) = "沙石"        '9
mnuPalette(10) = "蜘蛛网"      '10
mnuPalette(11) = "金块"        '11
mnuPalette(12) = "铁块"        '12
mnuPalette(13) = "TNT"         '13
mnuPalette(14) = "钻石块"      '14
mnuPalette(15) = "冰块"        '15
mnuPalette(16) = "粘土块"      '16
mnuPalette(17) = "地狱岩"      '17
mnuPalette(18) = "绿宝石块"    '18
mnuPalette(19) = "西瓜块"      '19
mnuPalette(20) = "红石块"      '20
mnuPalette(21) = "石英块"      '21
'1.8+
mnuPalette(22) = "海晶石"      '22
mnuPalette(23) = "红沙岩"      '23
'1.10+
mnuPalette(24) = "紫珀块"      '24
mnuPalette(25) = "地狱疣块"    '25
mnuPalette(26) = "骨块"        '26

ReDim PaletteCheck(26)
For I = 1 To 21
Load mnuPalette1_7(I)
mnuPalette1_7(I).Caption = mnuPalette(I)
PaletteCheck(I) = True
mnuPalette1_7(I).Visible = True
Next
For I = 1 To 2
Load mnuPalette1_8(I)
mnuPalette1_8(I).Caption = mnuPalette(I + 21)
PaletteCheck(I) = True
mnuPalette1_8(I).Visible = True
Next
For I = 1 To 3
Load mnuPalette1_10(I)
mnuPalette1_10(I).Caption = mnuPalette(I + 23)
PaletteCheck(I) = True
mnuPalette1_10(I).Visible = True
Next
End Sub

