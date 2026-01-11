.data
	x: .long 15
	y: .long 5
	sum: .space 4
.text
.global_start

_start:
	mov x, %eax
	mov y, %ebx
	add %ebx, %eax
	mov %eax, sum

etexit:
	mov $1, %eax
	mov $0, %ebx
	int $0x80
