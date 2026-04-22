r::
{
    hwnd := WinExist("A")
    if !hwnd
        return

    pid := WinGetPID(hwnd)
    hProc := DllCall("OpenProcess", "UInt", 0x1F0FFF, "Int", false, "UInt", pid, "Ptr")

    if hProc
    {
        mod := DllCall("GetModuleHandle", "Str", "ntdll.dll", "Ptr")
        NtSuspendProcess := DllCall("GetProcAddress", "Ptr", mod, "AStr", "NtSuspendProcess", "Ptr")
        NtResumeProcess  := DllCall("GetProcAddress", "Ptr", mod, "AStr", "NtResumeProcess",  "Ptr")

        ; Suspend
        DllCall(NtSuspendProcess, "Ptr", hProc)
        Sleep 300
        ; Resume
        DllCall(NtResumeProcess, "Ptr", hProc)

        DllCall("CloseHandle", "Ptr", hProc)
    }
}