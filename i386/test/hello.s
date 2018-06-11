.section ".note.openbsd.ident", "a"
  .align 2
  .long 8
  .long 4
  .long 1
  .asciz "OpenBSD"
  .long 0
  .align 2

.data

.equ sys_write, 4
.equ sys_exit, 1
.equ stdout, 1
.equ kernel, 0x80

msg: .ascii "Hello World!\n"
.equ msg_len, .-msg

.text

.global _start

_start:
  push $msg_len
  push $msg
  push $stdout
  push %eax
  mov $sys_write, %eax
  int $kernel
  add $12, %esp

  push $0
  push %eax
  mov $sys_exit, %eax
  int $kernel
