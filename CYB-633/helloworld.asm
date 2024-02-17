.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
WriteConsoleA PROTO, hConsoleOutput:DWORD, lpBuffer:DWORD, 
nNumberOfCharsToWrite:DWORD, lpNumberOfCharsWritten:DWORD, 
lpReserved:DWORD
GetStdHandle PROTO, nStdHandle:DWORD

.data
msg db "Hello, world! I am Karan", 0 ; TODO: fix this line
chrsWritten DWORD ?

.code
main PROC
; write your code here
    push -11                  ; ; nStdHandle (INPUT -10 / OUTPUT -11 / ERROR -12)
    call GetStdHandle         ; returns handle to eax
    push 0                    ; lpReserved
    push OFFSET chrsWritten   ; lpNumberOfCharsWritten
    push LENGTHOF msg - 1     ; nNumberOfCharsToWrite TODO:fix this
    push OFFSET msg           ; *lpBuffer TODO: fix this line
    push eax                  ; hConsoleOutput
    call WriteConsoleA

INVOKE ExitProcess, 0     ; 0 is exit code
main ENDP
END main
