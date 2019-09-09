#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
if A_IsCompiled
	Menu, Tray, Icon, f1-car.ico, -159
Menu, Tray, Tip, RL Custom Quickchat Macro`nCtrl+Shift+q for help
IniRead, cqc1, customqc.ini, CustomQuickChats, cqc1, %A_Space%
IniRead, cqc2, customqc.ini, CustomQuickChats, cqc2, %A_Space%
IniRead, cqc3, customqc.ini, CustomQuickChats, cqc3, %A_Space%
IniRead, cqc4, customqc.ini, CustomQuickChats, cqc4, %A_Space%
IniRead, cqc5, customqc.ini, CustomQuickChats, cqc5, %A_Space%
IniRead, cqc6, customqc.ini, CustomQuickChats, cqc6, %A_Space%
IniRead, cqc7, customqc.ini, CustomQuickChats, cqc7, %A_Space%
IniRead, cqc8, customqc.ini, CustomQuickChats, cqc8, %A_Space%
IniRead, cqc1_TeamOnly, customqc.ini, CustomQuickChats, cqc1_TeamOnly, %A_Space%
IniRead, cqc2_TeamOnly, customqc.ini, CustomQuickChats, cqc2_TeamOnly, %A_Space%
IniRead, cqc3_TeamOnly, customqc.ini, CustomQuickChats, cqc3_TeamOnly, %A_Space%
IniRead, cqc4_TeamOnly, customqc.ini, CustomQuickChats, cqc4_TeamOnly, %A_Space%
IniRead, cqc5_TeamOnly, customqc.ini, CustomQuickChats, cqc5_TeamOnly, %A_Space%
IniRead, cqc6_TeamOnly, customqc.ini, CustomQuickChats, cqc6_TeamOnly, %A_Space%
IniRead, cqc7_TeamOnly, customqc.ini, CustomQuickChats, cqc7_TeamOnly, %A_Space%
IniRead, cqc8_TeamOnly, customqc.ini, CustomQuickChats, cqc8_TeamOnly, %A_Space%

Gui, MyGui:+AlwaysOnTop +Disabled -SysMenu +Owner
Gui, MyGui:Font, s12 bold
Gui, MyGui:Add, Text,, About
Gui, MyGui:Font, s11 normal
Gui, MyGui:Add, Text,, Enjoy 8 new quickchats for Rocket League that are completely customizable.
Gui, MyGui:Add, Text,, Decided to change a quickchat? Just use a hotkey to open the editor.
Gui, MyGui:Add, Text,, And that's not all. Set your Rocket League video settings to Borderless and
Gui, MyGui:Add, Text,, get an On Screen Display showing your quickchats. Open the wordlist text
Gui, MyGui:Add, Text,, file and add as many chats as you'd like. When you activate Custom Quickchat
Gui, MyGui:Add, Text,, in game, a random quickchat from the text file will be shown!
Gui, MyGui:Add, Text,, Note: This is a macro so only PC players will be able to see custom quickchats.
Gui, MyGui:Font, s12 bold
Gui, MyGui:Add, Text,, How To Use
Gui, MyGui:Font, s11 normal
Gui, MyGui:Add, Text,, Pressing Ctrl+Shift+q will show/hide this help window.
Gui, MyGui:Add, Text,, Pressing Ctrl+`` (the key left of 1) will open the quickchat editor.
Gui, MyGui:Add, Text,, Pressing `` in game will show on screen display similar to pressing keys 1-4
Gui, MyGui:Add, Text,, in Rocket League. Then press keys 1-8 to send a custom quickchat.
Gui, MyGui:Add, Text,, To send a random quickchat from the text file, click 'r' afterwards.
Gui, MyGui:Font, s12 bold
Gui, MyGui:Add, Text,, Opening/Closing the Macro
Gui, MyGui:Font, s11 normal
Gui, MyGui:Add, Text,, Start customqc.exe to run the macro (it's running now). To exit the macro,
Gui, MyGui:Add, Text,, right-click it's notification icon on the bottom right of the screen.
Gui, MyGui:Add, Text,, Quickchats are only sent while Rocket League is in focus, so to keep the
Gui, MyGui:Add, Text,, macro running in the background, create a shortcut to customqc.exe and add
Gui, MyGui:Add, Text,, it to the startup folder.
Gui, MyGui:Font, s11 italics
Gui, MyGui:Add, Text,, Icon from https://icons8.com
GuiToggle := 0

CustomColor := "8c8c8c"
Gui +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui, Color, %CustomColor%
Gui, Font, s12 bold
Gui, Add, Text,, CUSTOM QUICKCHAT
Gui, Font, s12 normal
; Max custom quickchat char length is 30, for some reason...
Gui, Add, Text, vqc1, -----------------------------
Gui, Add, Text, vqc2, -----------------------------
Gui, Add, Text, vqc3, -----------------------------
Gui, Add, Text, vqc4, -----------------------------
Gui, Add, Text, vqc5, -----------------------------
Gui, Add, Text, vqc6, -----------------------------
Gui, Add, Text, vqc7, -----------------------------
Gui, Add, Text, vqc8, -----------------------------
Gui, Add, Text, vwl, -----------------------------
GuiControl,, qc1, 1
GuiControl,, qc2, 2
GuiControl,, qc3, 3
GuiControl,, qc4, 4
GuiControl,, qc5, 5
GuiControl,, qc6, 6
GuiControl,, qc7, 7
GuiControl,, qc8, 8
GuiControl,, wl, r
If cqc1 is not space
	GuiControl,, qc1, 1 %cqc1%
If cqc2 is not space
	GuiControl,, qc2, 2 %cqc2%
If cqc3 is not space
	GuiControl,, qc3, 3 %cqc3%
If cqc4 is not space
	GuiControl,, qc4, 4 %cqc4%
If cqc5 is not space
	GuiControl,, qc5, 5 %cqc5%
If cqc6 is not space
	GuiControl,, qc6, 6 %cqc6%
If cqc7 is not space
	GuiControl,, qc7, 7 %cqc7%
If cqc8 is not space
	GuiControl,, qc8, 8 %cqc8%
WinSet, Transparent, 200
;WinSet, TransColor, %CustomColor% 150

`::
SetTitleMatchMode, 3
If !WinActive("Rocket League (32-bit, DX9, Cooked)")
	Return
loopcount := 0
	Loop, Read, wordlist.txt
	{
		loopcount := loopcount + 1
	}
	Random, randomnum, 1, %loopcount%
	loopcount := 0
	Loop, Read, wordlist.txt
	{
		loopcount := loopcount + 1
		if (loopcount = randomnum) 
			rwl := A_LoopReadLine
	}
If rwl is not space
	GuiControl,, wl, r %rwl%
Gui, Show, x30 y420 NoActivate
Input, qcinput, T2 L1, {ESC}
Gui, Hide
If qcinput is space
	Return
If (qcinput = "1") {
	If (cqc1_TeamOnly = "false")
		Send t
	Else
		Send y
	Sleep 25
	SendInput {Raw}%cqc1%
	Send {Enter}
}
If (qcinput = "2") {
	If (cqc2_TeamOnly = "false")
		Send t
	Else
		Send y
	Sleep 25
	SendInput {Raw}%cqc2%
	Send {Enter}
}
If (qcinput = "3") {
	If (cqc3_TeamOnly = "false")
		Send t
	Else
		Send y
	Sleep 25
	SendInput {Raw}%cqc3%
	Send {Enter}
}
If (qcinput = "4") {
	If (cqc4_TeamOnly = "false")
		Send t
	Else
		Send y
	Sleep 25
	SendInput {Raw}%cqc4%
	Send {Enter}
}
If (qcinput = "5") {
	If (cqc5_TeamOnly = "false")
		Send t
	Else
		Send y
	Sleep 25
	SendInput {Raw}%cqc5%
	Send {Enter}
}
If (qcinput = "6") {
	If (cqc6_TeamOnly = "false")
		Send t
	Else
		Send y
	Sleep 25
	SendInput {Raw}%cqc6%
	Send {Enter}
}
If (qcinput = "7") {
	If (cqc7_TeamOnly = "false")
		Send t
	Else
		Send y
	Sleep 25
	SendInput {Raw}%cqc7%
	Send {Enter}
}
If (qcinput = "8") {
	If (cqc8_TeamOnly = "false")
		Send t
	Else
		Send y
	Sleep 25
	SendInput {Raw}%cqc8%
	Send {Enter}
}
If (qcinput = "r") {
	Send t
	Sleep 25
	SendInput {Raw}%rwl%
	Send {Enter}
}
Return

^`::
Run cqceditor.exe
Return

^+q::
If (GuiToggle = "0") {
	Gui, MyGui:Show, NoActivate, RL Custom Quickchat Help - Version: 1.4
	GuiToggle := 1
}
Else {
	Gui, MyGui:Hide
	GuiToggle := 0
}
Return