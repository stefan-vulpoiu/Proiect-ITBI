.data
	number: .float 2.718281828
	logResult: .space 4
.text
.global main
main:
	flds number
	subl $4, $esp
	fstps 0(%esp)
	call logf
	fstps logResult
	addl $4, %esp
et_exit:
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
