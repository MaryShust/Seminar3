section .data
    ; Объявляем строки для использования
    msg1 db "Hello, world!", 0
    msg2 db "Hello from the assembly!", 0

section .text
global _start

; Определяем макрос для сохранения регистров на стек
%macro pushn 1-*
    %rep %0
        push %1
        %rotate 1
    %endrep
%endmacro

; Определяем макрос для восстановления регистров с стека
%macro popn 1-*
    %rep %0
        pop %1
        %rotate 1
    %endrep
%endmacro

_start:
    ; Используем макрос pushn, чтобы сохранить регистры rax и rbx на стек
    pushn rax, rbx, rcx

    ; Изменяем значения регистров
    mov rax, 5
    mov rbx, 10
    mov rcx, 15

    ; Проводим некоторую операцию
    add rax, rbx       ; rax = 5 + 10 = 15
    add rax, rcx       ; rax = 15 + 15 = 30

    ; Восстанавливаем регистры из стека
    popn rcx, rbx, rax

    ; Завершение программы
    mov rax, 60        ; системный вызов для выхода
    xor rdi, rdi       ; код возврата 0
    syscall
