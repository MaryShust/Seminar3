section .text
global _start

%macro pushn 1-*
    ; Сохраняем регистры на стек
    push rax
    push rbx
    push rcx
    push rdx
    push rsi
    push rdi
    push r8
    push r9
    push r10
    push r11
    push r12
    push r13
    push r14
    push r15

    %rep %0
        push %1         ; Пушим каждый из аргументов (регистры)
        %rotate 1
    %endrep
%endmacro

%macro popn 1-*
    %rep %0
        pop %1          ; Попим каждый из аргументов (регистры)
        %rotate 1
    %endrep

    ; Восстанавливаем все регистры общего назначения
    pop r15
    pop r14
    pop r13
    pop r12
    pop r11
    pop r10
    pop r9
    pop r8
    pop rdi
    pop rsi
    pop rdx
    pop rcx
    pop rbx
    pop rax
%endmacro

section .data
    message db 'Hello, World!', 0

_start:
    ; Пример использования макроса pushn для сохранения регистров
    pushn rax, rbx, rcx  ; Сохраняем rax, rbx и rcx в стек

    ; Временно изменяем значения регистров
    mov rax, 10
    mov rbx, 20
    mov rcx, 30

    ; Делаем что-то полезное с измененными регистрами
    add rax, rbx       ; rax = 10 + 20 = 30
    add rax, rcx       ; rax = 30 + 30 = 60

    ; Теперь восстанавливаем предыдущие значения регистров
    popn rax, rbx, rcx  ; Восстанавливаем rax, rbx и rcx из стека

    ; Завершаем программу
    mov rax, 60        ; системный вызов для выхода
    xor rdi, rdi       ; код возврата 0
    syscall
