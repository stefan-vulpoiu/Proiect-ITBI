.data
        x: .long 15
        y: .long 5
        sum: .space 4
.text
.global main

main:
        mov x, %eax
        mov y, %ebx
        add %ebx, %eax
        mov %eax, sum

etexit:
        mov $1, %eax
        mov sum, %ebx
        int $0x80
