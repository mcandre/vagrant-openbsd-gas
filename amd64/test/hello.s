.section ".note.openbsd.ident", "a"
  .align 2
  .long 8
  .long 4
  .long 1
  .asciz "OpenBSD"
  .long 0
  .align 2

.section .rodata

msg: .ascii "Hello World!\n"

.equ msg_len, .-msg
.equ sys_write, 4
.equ sys_exit, 1
.equ stdout, 1

.section .text

.global _start

_start:
  mov $sys_write, %rax
  mov $stdout, %rdi
  mov $msg, %rsi
  mov $msg_len, %rdx
  syscall

  mov $sys_exit, %rax
  xor %rdi, %rdi
  syscall
