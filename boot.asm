
    org 0x7C00
    JMP		entry

	DB		0x90
	DB		"HELLOIPL"		; 启动扇区名称（8字节）
	DW		512				; 每个扇区（sector）大小（必须512字节）
	DB		1				; 簇（cluster）大小（必须为1个扇区）
	DW		1				; FAT起始位置（一般为第一个扇区）
	DB		2				; FAT个数（必须为2）
	DW		224				; 根目录大小（一般为224项）
	DW		2880			; 该磁盘大小（必须为2880扇区1440*1024/512）
	DB		0xf0			; 磁盘类型（必须为0xf0）
	DW		9				; FAT的长度（必??9扇区）
	DW		18				; 一个磁道（track）有几个扇区（必须为18）
	DW		2				; 磁头数（必??2）
	DD		0				; 不使用分区，必须是0
	DD		2880			; 重写一次磁盘大小
	DB		0,0,0x29		; 意义不明（固定）
	DD		0xffffffff		; （可能是）卷标号码
	DB		"HELLO-OS   "	; 磁盘的名称（必须为11字?，不足填空格）
	DB		"FAT12   "		; 磁盘格式名称（必??8字?，不足填空格）
	RESB	18				; 先空出18字节

entry:
    mov ax, cs
    mov ds, ax
    mov es, ax
    call Dispstr
    jmp $
Dispstr:
    mov ax,bootmessage
    mov bp,ax
	mov cx,16
	mov ax,0x01301
	mov bx,0x0c
    mov dl,0
    int 0x10
    ret
bootmessage:  		
db "hello-os-world"
times 510-($-$$)  	db 0
dw  0xaa55