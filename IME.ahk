#Persistent ; 

ProcessList := ["bfv.exe", "notepad.exe"] ; 在这里添加进程名，注意进程名是否正确以及格式，使用英文逗号
CapsLocked := 0
LoopActive := 1 ; 

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