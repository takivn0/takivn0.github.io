$LButton::
{
    while GetKeyState("LButton","P")
    {
        Click("Left")
        Sleep(1)
    }
}