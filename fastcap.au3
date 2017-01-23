#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=G:\Internet\Unsorted\cuff.ico
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_Run_Tidy=y
#AutoIt3Wrapper_Run_Au3Stripper=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <ScreenCapture.au3>
#include <Date.au3>
#Region ### START Koda GUI section ### Form=
$main = GUICreate("FastCap", 76, 48, -1, -1, -1, BitOR($WS_EX_TOOLWINDOW, $WS_EX_WINDOWEDGE))
$saveBtn = GUICtrlCreateButton("Save To", 0, 0, 75, 25)
$author = GUICtrlCreateLabel("By Arsh", 20, 28, 40, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

$saveTo = RegRead("HKEY_CURRENT_USER\Software\FastCap", "Save")

HotKeySet("{PRINTSCREEN}", "capture")

Func capture()
	$h = _ScreenCapture_Capture("")
	_ScreenCapture_SaveImage($saveTo & "\" & StringReplace(StringReplace(_Now(), "/", "-"), ":", "-") & ".png", $h)
EndFunc   ;==>capture

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $saveBtn
			RegWrite("HKEY_CURRENT_USER\Software\FastCap", "Save", "REG_SZ", FileSelectFolder("Select folder to save screenshots in", $saveTo))
			Sleep(100)
	EndSwitch
WEnd
