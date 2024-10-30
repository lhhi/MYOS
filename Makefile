
helloos.img: boot.bin
	./z_tools/edimg.exe imgin:./z_tools/fdimg0at.tek \
		wbinimg src:boot.bin len:512 from:0 to:0 imgout:helloos.img

boot.bin : boot.asm 
	nasm boot.asm -o boot.bin
img :
	./z_tools/make.exe -r helloos.img
run :
	./z_tools/make.exe img
	copy helloos.img .\z_tools\qemu\fdimage0.bin
	./z_tools/make.exe -C ./z_tools/qemu

