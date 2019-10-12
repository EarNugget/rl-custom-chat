#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 3
Menu, Tray, Tip, RL Custom Quickchat Macro`nCtrl+Shift+q for help
IniRead, cqc1, resource\customqc.ini, CustomQuickChats, cqc1, %A_Space%
IniRead, cqc2, resource\customqc.ini, CustomQuickChats, cqc2, %A_Space%
IniRead, cqc3, resource\customqc.ini, CustomQuickChats, cqc3, %A_Space%
IniRead, cqc4, resource\customqc.ini, CustomQuickChats, cqc4, %A_Space%
IniRead, cqc5, resource\customqc.ini, CustomQuickChats, cqc5, %A_Space%
IniRead, cqc6, resource\customqc.ini, CustomQuickChats, cqc6, %A_Space%
IniRead, cqc7, resource\customqc.ini, CustomQuickChats, cqc7, %A_Space%
IniRead, cqc8, resource\customqc.ini, CustomQuickChats, cqc8, %A_Space%
IniRead, cqc1_TeamOnly, resource\customqc.ini, CustomQuickChats, cqc1_TeamOnly, %A_Space%
IniRead, cqc2_TeamOnly, resource\customqc.ini, CustomQuickChats, cqc2_TeamOnly, %A_Space%
IniRead, cqc3_TeamOnly, resource\customqc.ini, CustomQuickChats, cqc3_TeamOnly, %A_Space%
IniRead, cqc4_TeamOnly, resource\customqc.ini, CustomQuickChats, cqc4_TeamOnly, %A_Space%
IniRead, cqc5_TeamOnly, resource\customqc.ini, CustomQuickChats, cqc5_TeamOnly, %A_Space%
IniRead, cqc6_TeamOnly, resource\customqc.ini, CustomQuickChats, cqc6_TeamOnly, %A_Space%
IniRead, cqc7_TeamOnly, resource\customqc.ini, CustomQuickChats, cqc7_TeamOnly, %A_Space%
IniRead, cqc8_TeamOnly, resource\customqc.ini, CustomQuickChats, cqc8_TeamOnly, %A_Space%
CL_file := "customlist_1.txt"

CustomColor := "8c8c8c"
Gui, NotifGUI:+LastFound +AlwaysOnTop -Caption +ToolWindow
Gui, NotifGUI:Color, %CustomColor%
WinSet, Transparent, 200
Gui, NotifGUI:Font, s12 normal
Gui, NotifGUI:Add, Text, vCLS, CustomList 1 Selected

Gui, HelpGUI:+AlwaysOnTop +Disabled -SysMenu +Owner
Gui, HelpGUI:Font, s12 bold
Gui, HelpGUI:Add, Text,, About
Gui, HelpGUI:Font, s11 normal
Gui, HelpGUI:Add, Text,, Enjoy 8 new quickchats for Rocket League that are completely customizable. Decided to
Gui, HelpGUI:Add, Text,, change a quickchat? Just use a hotkey to open the editor. And that's not all. Set your Rocket
Gui, HelpGUI:Add, Text,, League video settings to Borderless and get an On Screen Display showing your quickchats.
Gui, HelpGUI:Add, Text,, Open one of the CustomList text files and add as many chats as you'd like. When you activate
Gui, HelpGUI:Add, Text,, Custom Quickchat in game, a random quickchat from the text file will be shown!
Gui, HelpGUI:Add, Text,, Note: This is a macro so only PC players will be able to see custom quickchats.
Gui, HelpGUI:Font, s12 bold
Gui, HelpGUI:Add, Text,, Opening/Closing the Macro
Gui, HelpGUI:Font, s11 normal
Gui, HelpGUI:Add, Text,, Start customqc.exe to run the macro (it's running now). To exit the macro, right-click its
Gui, HelpGUI:Add, Text,, notification icon on the bottom right of the screen. Quickchats are only sent while Rocket
Gui, HelpGUI:Add, Text,, League is in focus so to keep the macro running in the background, create a shortcut to
Gui, HelpGUI:Add, Text,, customqc.exe and add it to the startup folder.
Gui, HelpGUI:Font, s12 bold
Gui, HelpGUI:Add, Text,, How To Use
Gui, HelpGUI:Font, s11 normal
Gui, HelpGUI:Add, Text,, • Press Ctrl+`` (the key left of 1) to open the quickchat editor.
Gui, HelpGUI:Add, Text,, • Press `` in game to show on screen display similar to pressing keys 1-4 in Rocket League.
Gui, HelpGUI:Add, Text,, Then press keys 1-8 to send a custom quickchat. To send a random quickchat from the text
Gui, HelpGUI:Add, Text,, file, click 'r' afterwards.
Gui, HelpGUI:Add, Text,, • Press r + keys 1-4 to change the selected CustomList.
Gui, HelpGUI:Add, Text,, • Press Ctrl+Shift+r open the selected CustomList text file.
Gui, HelpGUI:Add, Text,, • Press Ctrl+Shift+q to show/hide this help window.
Gui, HelpGUI:Add, Text,, • Press Ctrl+Shift+v to show/hide the changelog.
Gui, HelpGUI:Add, Text,, • Press Ctrl+Alt+`` to give cqc a reload.
Gui, HelpGUI:Font, s11 italics
Gui, HelpGUI:Add, Text,, Icon from https://icons8.com
GuiToggle1 := 0

Gui, ChangesGUI:+AlwaysOnTop +Disabled -SysMenu +Owner
Gui, ChangesGUI:Font, s12 bold
Gui, ChangesGUI:Add, Text,, v1.5 | 10/12/2019
Gui, ChangesGUI:Font, s11 normal
Gui, ChangesGUI:Add, Text,, • Added multiple CustomList text files and the ability to set the selected list
Gui, ChangesGUI:Add, Text,, via hotkey (r + keys 1-4 to select list)
Gui, ChangesGUI:Add, Text,, • Added this changelog window (Ctrl+Shift+v)
Gui, ChangesGUI:Add, Text,, • Added hotkey to open selected CustomList (Ctrl+Shift+r)
Gui, ChangesGUI:Add, Text,, • Restored native function to hijacked keys such as the `` key
Gui, ChangesGUI:Add, Text,, • Minor UI changes
GuiToggle2 := 0

CustomColor := "8c8c8c"
Gui +LastFound +AlwaysOnTop -Caption +ToolWindow
Gui, Color, %CustomColor%
WinSet, Transparent, 200
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
; WinSet, Transparent, 200
;WinSet, TransColor, %CustomColor% 150

~`::
If !WinActive("Rocket League (32-bit, DX9, Cooked)")
	Return
loopcount := 0
	Loop, Read, resource\%CL_file%
	{
		loopcount := loopcount + 1
	}
	Random, randomnum, 1, %loopcount%
	loopcount := 0
	Loop, Read, resource\%CL_file%
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

~r & 1::
CL_file := "customlist_1.txt"
GuiControl, NotifGUI:, CLS, CustomList 1 Selected
Gui, NotifGUI:Show, x30 y160 NoActivate
Sleep, 2000
Gui, NotifGUI:Hide
Return

~r & 2::
CL_file := "customlist_2.txt"
GuiControl, NotifGUI:, CLS, CustomList 2 Selected
Gui, NotifGUI:Show, x30 y160 NoActivate
Sleep, 2000
Gui, NotifGUI:Hide
Return

~r & 3::
CL_file := "customlist_3.txt"
GuiControl, NotifGUI:, CLS, CustomList 3 Selected
Gui, NotifGUI:Show, x30 y160 NoActivate
Sleep, 2000
Gui, NotifGUI:Hide
Return

~r & 4::
CL_file := "customlist_4.txt"
GuiControl, NotifGUI:, CLS, CustomList 4 Selected
Gui, NotifGUI:Show, x30 y160 NoActivate
Sleep, 2000
Gui, NotifGUI:Hide
Return

^+r::
Run resource\%CL_file%
Return

^`::
Run resource\cqceditor.exe
Return

^+q::
If (GuiToggle1 = "0") {
	Gui, HelpGUI:Show, NoActivate, RL Custom Quickchat Help - Version: 1.5
	GuiToggle1 := 1
}
Else {
	Gui, HelpGUI:Hide
	GuiToggle1 := 0
}
Return

^+v::
If (GuiToggle2 = "0") {
	Gui, ChangesGUI:Show, NoActivate, Changelog
	GuiToggle2 := 1
}
Else {
	Gui, ChangesGUI:Hide
	GuiToggle2 := 0
}
Return

^!`::
Reload
Sleep, 1000
GuiControl, NotifGUI:, CLS, Script failed to reload
Gui, NotifGUI:Show, x30 y160 NoActivate
Sleep, 2000
Gui, NotifGUI:Hide
Return

; In cqceditor, change open wordlist button to open CQC folder or something
; Cqceditor needs an update...