@echo off
set X=1920
set Y=1080
set QEMU_PATH=.\qemu\qemu-system-x86_64w.exe
start "" "%QEMU_PATH%" -L .\qemu\share -cdrom slackware64-15.0-install-dvd.iso -boot c -m 4G -accel whpx -accel tcg -cpu qemu64,+aes,+pclmulqdq,+popcnt,hv_relaxed,hv_spinlocks=0x1fff,hv_vapic,hv_synic,hv_stimer -smp 6,sockets=1,cores=3,threads=2 -drive file=slack.qcow2,format=qcow2,if=virtio,cache=unsafe,aio=threads -device virtio-vga-gl,max_outputs=1,blob=true,hostmem=1024M,xres=%X%,yres=%Y% -display sdl,gl=on -audiodev sdl,id=snd0,out.frequency=48000,out.buffer-count=4 -device intel-hda -device hda-output,audiodev=snd0 -netdev user,id=net0,hostfwd=tcp:0.0.0.0:6767-:22 -device virtio-net-pci,netdev=net0 -device virtio-tablet-pci -device virtio-keyboard-pci -device virtio-rng-pci -device virtio-balloon-pci -rtc base=localtime,clock=host
exit