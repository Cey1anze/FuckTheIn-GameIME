#Persistent

; 读取ini文件
IniRead, ProcessList, IME.ini, Settings, ProcessList

CapsLocked := 0
ProcessExists := 0
LoopEnabled := 1

ProcessListMsg := "当前已添加的程序有：`n"
Loop, Parse, ProcessList, `,
{
    ProcessListMsg .= Trim(A_LoopField) . "`n"
}

MsgBox, %ProcessListMsg%

MsgBox, 4, 添加程序, 是否要添加一个exe程序到列表中
IfMsgBox, Yes
{
    FileSelectFile, SelectedFile, 3, , 选择exe文件, Executable Files (*.exe)

    If (SelectedFile <> "")
    {
        loop, %SelectedFile%
          ShortName := A_LoopFileShortName

        ; 是否已存在
        If !InStr(ProcessList, ShortName)
        {
            ; 添加
            ProcessList .= ", " . ShortName
            ; 更新ini文件
            IniWrite, %ProcessList%, IME.ini, Settings, ProcessList
            MsgBox, %ShortName% 已添加到列表中！
        }
        Else
        {
            MsgBox, %ShortName% 已经在列表中！
        }
    }
    Else
    {
        MsgBox, 没有选择任何程序
    }
    reload
}


Loop
{
    Sleep, 1000 ; 每秒检查一次进程状态
    For Each, Process in StrSplit(ProcessList, ", ")
    {
        Process, Exist, %Process% ; 检查进程是否存在

        If ErrorLevel ;
        {
            ProcessExists := 1 ;
            Break ; 跳出循环，不再检查其他进程
        }
        Else
        {
            ProcessExists := 0
        }
    }
    If (ProcessExists = 1 && CapsLocked = 0) ; 检测到进程锁定大写, 按键激活后不锁定大写
    {
        SetCapsLockState, AlwaysOn ;
        CapsLocked := 1
    }
    If (ProcessExists = 0 && CapsLocked = 1) ; 进程结束后及未检测到时关闭大写锁定
    {
        SetCapsLockState, Off ;
        CapsLocked := 0
    }


}

return

F1::
If LoopEnabled = 0
{
    SetCapsLockState, AlwaysOn ;
    LoopEnabled := 1
}
Else
{
    SetCapsLockState, Off ;
    LoopEnabled := 0
}

return