.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
WriteConsoleA PROTO, hConsoleOutput:DWORD, lpBuffer:DWORD, nNumberOfCharsToWrite:DWORD, lpNumberOfCharsWritten:DWORD, lpReserved:DWORD
GetStdHandle PROTO, nStdHandle:DWORD

.data
STDOUT_HANDLE DWORD ?
oh_my_msg db "oh my", 0
newline db 0Dh, 0Ah, 0  ; Newline character sequence
bytesWritten DWORD ?
name_msg db "Karan", 0  ; Your name

.code
main PROC
    ; Get the handle for the standard output (console)
    push -11  ; STD_OUTPUT_HANDLE = -11
    call GetStdHandle
    mov STDOUT_HANDLE, eax  ; Save the handle for later use

    mov ecx, 10  ; Loop counter from 10 to 1
print_loop:
    ; Check if the current number is even
    test ecx, 1  ; Test the least significant bit (1 for odd, 0 for even)
    jnz next_iteration  ; If the least significant bit is set, it's odd, so skip printing "oh my"

    ; Print "oh my"
    mov esi, OFFSET oh_my_msg
    mov edx, LENGTHOF oh_my_msg - 1  ; Length of the string
    push ecx  ; Preserve ECX across the call
    invoke WriteConsoleA, STDOUT_HANDLE, esi, edx, ADDR bytesWritten, 0
    mov esi, OFFSET newline
    mov edx, LENGTHOF newline - 1
    invoke WriteConsoleA, STDOUT_HANDLE, esi, edx, ADDR bytesWritten, 0
    pop ecx  ; Restore ECX after the call

next_iteration:
    dec ecx  ; Decrement loop counter
    jnz print_loop  ; test if the counter is zero and jump to print_loop if it isn't

    ; Print your name
    mov esi, OFFSET name_msg
    mov edx, LENGTHOF name_msg - 1
    invoke WriteConsoleA, STDOUT_HANDLE, esi, edx, ADDR bytesWritten, 0

    invoke ExitProcess, 0
main ENDP
END main
