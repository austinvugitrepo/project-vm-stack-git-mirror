#!/bin/sh
# This uses a presetup freebsd vm qcow2 image so no need to use -cdrom and -boot to install iso to qcow2  
exec flock -n /tmp/freebsdvm.lock -c "qemu-system-x86_64 -m 8G -smp 4 -accel kvm -drive file=/home/austin/cron-scripts/FreeBSD-15.0-RELEASE-amd64-ufs.qcow2,format=qcow2,if=virtio -nographic -netdev user,id=net0,hostfwd=tcp:0.0.0.0:2222-:22 -device virtio-net-pci,netdev=net0 -serial mon:stdio -cpu host"
