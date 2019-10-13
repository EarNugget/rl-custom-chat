Imports System.IO
Imports System.Runtime.InteropServices
Imports System.Text

Public Class Form1
    Dim p() As Process
    Dim File
    Dim TestDir = Environment.CurrentDirectory + "/chats.ini"
    <DllImport("kernel32.dll", SetLastError:=True)>
    Private Shared Function GetPrivateProfileString(ByVal lpAppName As String, ByVal lpKeyName As String, ByVal lpDefault As String, ByVal lpReturnedString As StringBuilder, ByVal nSize As Integer, ByVal lpFileName As String) As Integer
    End Function

    <DllImport("kernel32.dll", SetLastError:=True)>
    Private Shared Function WritePrivateProfileString(ByVal lpAppName As String, ByVal lpKeyName As String, ByVal lpString As String, ByVal lpFileName As String) As Boolean
    End Function

    Public Shared Function ReadINI(ByVal File As String, ByVal Section As String, ByVal Key As String) As String
        Dim sb As New StringBuilder(500)
        GetPrivateProfileString(Section, Key, "", sb, sb.Capacity, File)
        Return sb.ToString
    End Function

    Public Shared Sub WriteINI(ByVal File As String, ByVal Section As String, ByVal Key As String, ByVal Value As String)
        WritePrivateProfileString(Section, Key, Value, File)
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        If Dir$(TestDir) <> "" Then
            File = Environment.CurrentDirectory + "/chats.ini"
        Else
            File = Environment.CurrentDirectory + "/resource/chats.ini"
        End If
        If Not TextBox1.Text = "" Then
            WriteINI(File, "CustomQuickChats", "cqc1", TextBox1.Text)
            If Not CheckBox1.Checked = True Then WriteINI(File, "CustomQuickChats", "cqc1_TeamOnly", "false") Else WriteINI(File, "CustomQuickChats", "cqc1_TeamOnly", "true")
        End If
        If Not TextBox3.Text = "" Then
            WriteINI(File, "CustomQuickChats", "cqc2", TextBox3.Text)
            If Not CheckBox2.Checked = True Then WriteINI(File, "CustomQuickChats", "cqc2_TeamOnly", "false") Else WriteINI(File, "CustomQuickChats", "cqc2_TeamOnly", "true")
        End If
        If Not TextBox4.Text = "" Then
            WriteINI(File, "CustomQuickChats", "cqc3", TextBox4.Text)
            If Not CheckBox3.Checked = True Then WriteINI(File, "CustomQuickChats", "cqc3_TeamOnly", "false") Else WriteINI(File, "CustomQuickChats", "cqc3_TeamOnly", "true")
        End If
        If Not TextBox2.Text = "" Then
            WriteINI(File, "CustomQuickChats", "cqc4", TextBox2.Text)
            If Not CheckBox4.Checked = True Then WriteINI(File, "CustomQuickChats", "cqc4_TeamOnly", "false") Else WriteINI(File, "CustomQuickChats", "cqc4_TeamOnly", "true")
        End If
        If Not TextBox8.Text = "" Then
            WriteINI(File, "CustomQuickChats", "cqc5", TextBox8.Text)
            If Not CheckBox8.Checked = True Then WriteINI(File, "CustomQuickChats", "cqc5_TeamOnly", "false") Else WriteINI(File, "CustomQuickChats", "cqc5_TeamOnly", "true")
        End If
        If Not TextBox7.Text = "" Then
            WriteINI(File, "CustomQuickChats", "cqc6", TextBox7.Text)
            If Not CheckBox7.Checked = True Then WriteINI(File, "CustomQuickChats", "cqc6_TeamOnly", "false") Else WriteINI(File, "CustomQuickChats", "cqc6_TeamOnly", "true")
        End If
        If Not TextBox6.Text = "" Then
            WriteINI(File, "CustomQuickChats", "cqc7", TextBox6.Text)
            If Not CheckBox6.Checked = True Then WriteINI(File, "CustomQuickChats", "cqc7_TeamOnly", "false") Else WriteINI(File, "CustomQuickChats", "cqc7_TeamOnly", "true")
        End If
        If Not TextBox5.Text = "" Then
            WriteINI(File, "CustomQuickChats", "cqc8", TextBox5.Text)
            If Not CheckBox5.Checked = True Then WriteINI(File, "CustomQuickChats", "cqc8_TeamOnly", "false") Else WriteINI(File, "CustomQuickChats", "cqc8_TeamOnly", "true")
        End If
        TextBox1.Clear()
        TextBox2.Clear()
        TextBox3.Clear()
        TextBox4.Clear()
        TextBox5.Clear()
        TextBox6.Clear()
        TextBox7.Clear()
        TextBox8.Clear()
        CheckBox1.Checked = False
        CheckBox2.Checked = False
        CheckBox3.Checked = False
        CheckBox4.Checked = False
        CheckBox5.Checked = False
        CheckBox6.Checked = False
        CheckBox7.Checked = False
        CheckBox8.Checked = False
        Label3.Text = ReadINI(File, "CustomQuickChats", "cqc1")
        Label4.Text = ReadINI(File, "CustomQuickChats", "cqc2")
        Label7.Text = ReadINI(File, "CustomQuickChats", "cqc3")
        Label8.Text = ReadINI(File, "CustomQuickChats", "cqc4")
        Label17.Text = ReadINI(File, "CustomQuickChats", "cqc5")
        Label18.Text = ReadINI(File, "CustomQuickChats", "cqc6")
        Label13.Text = ReadINI(File, "CustomQuickChats", "cqc7")
        Label14.Text = ReadINI(File, "CustomQuickChats", "cqc8")
        If ReadINI(File, "CustomQuickChats", "cqc1_TeamOnly") = "true" Then CheckBox1.Checked = True
        If ReadINI(File, "CustomQuickChats", "cqc2_TeamOnly") = "true" Then CheckBox2.Checked = True
        If ReadINI(File, "CustomQuickChats", "cqc3_TeamOnly") = "true" Then CheckBox3.Checked = True
        If ReadINI(File, "CustomQuickChats", "cqc4_TeamOnly") = "true" Then CheckBox4.Checked = True
        If ReadINI(File, "CustomQuickChats", "cqc5_TeamOnly") = "true" Then CheckBox8.Checked = True
        If ReadINI(File, "CustomQuickChats", "cqc6_TeamOnly") = "true" Then CheckBox7.Checked = True
        If ReadINI(File, "CustomQuickChats", "cqc7_TeamOnly") = "true" Then CheckBox6.Checked = True
        If ReadINI(File, "CustomQuickChats", "cqc8_TeamOnly") = "true" Then CheckBox5.Checked = True
        If Not Dir$(TestDir) <> "" Then
            p = Process.GetProcessesByName("customqc")
            If p.Count > 0 Then
                For Each SubProcess As Process In p
                    SubProcess.Kill()
                    SubProcess.WaitForExit()
                    Process.Start(Environment.CurrentDirectory + "/customqc.exe")
                Next
            End If
        End If
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If Dir$(TestDir) <> "" Then
            Process.Start(Path.GetFullPath(Path.Combine(Environment.CurrentDirectory, "..\")))
        Else
            Process.Start(Environment.CurrentDirectory)
        End If
    End Sub
End Class