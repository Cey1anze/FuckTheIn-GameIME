#Persistent ;

ProcessList := ["bfv.exe", "csgo.exe", "r5apex.exe"]
CapsLocked := 0
LoopActive := 1

ProcessListMsg := "当前已添加的进程有：" . "`n"
For Each, Process in ProcessList
{
    ProcessListMsg .= Process . "`n"
}
MsgBox, %ProcessListMsg%

MsgBox, 4, 添加进程, 是否要添加一个exe进程到ProcessList中
IfMsgBox, Yes
{
    FileSelectFile, SelectedFile, 3, , 选择exe文件

    if (SelectedFile <> "") {
        loop, %SelectedFile%
          ShortName := A_LoopFileShortName
        ; 读取文件的内容
        FileRead, ScriptContent, IME.ahk

        ; 匹配ProcessList列表
        if (RegExMatch(ScriptContent, "(ProcessList\s*:=\s*\[)(.*)(\])", match)) {
            ; 提取现有的ProcessList
            existingList := match2

            ; 检查选择的文件是否已经在ProcessList
            if (!RegExMatch(existingList, "\b" . ShortName . "\b")) {
                ; 将选择的文件名追加到ProcessList
                newProcessList := existingList . ", " . """" . ShortName . """"
                ; 替换原来的ProcessList
                modifiedScriptContent := RegExReplace(ScriptContent, "(ProcessList\s*:=\s*\[)(.*)(\])", "$1" . newProcessList . "$3")

                ; 写入修改后的内容回到ahk文件
                FileDelete, IME.ahk
                FileAppend, %modifiedScriptContent%, IME.ahk, UTF-8
                MsgBox, 成功将 %ShortName% 添加到进程列表中！
            } else {
                MsgBox, 文件 %ShortName% 已经在进程列表中！
            }
        } else {
            MsgBox, 在ahk文件中未找到进程列表
        }
    } else {
        MsgBox, 没有选择任何文件
    }
    reload
}

Loop
{
    If LoopActive
    {
        ProcessExists := 0 ; 

        For Each, Process in ProcessList
        {
            Process, Exist, %Process% ; 检查进程是否存在

            If ErrorLevel ; 
            {
                ProcessExists := 1 ; 表示至少有一个进程存在
                Break ; 跳出循环，不再检查其他进程
            }
        }

        If ProcessExists
        {
            SetCapsLockState, AlwaysOn ; 
            CapsLocked := 1
        }
        Else
        {
            SetCapsLockState, Off ; 
            CapsLocked := 0
        }
    }

    Sleep, 1000 ; 每秒检查一次进程状态
}

return

F1::
If !CapsLocked
    {
        SetCapsLockState, AlwaysOn ; 
        CapsLocked := 1
        LoopActive := 1 ; 
    }
    Else
    {
        SetCapsLockState, Off ; 
        CapsLocked := 0
        LoopActive := 0 ; 
    }
return