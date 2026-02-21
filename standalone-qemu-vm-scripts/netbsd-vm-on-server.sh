#!/bin/sh

exec flock -n /tmp/netbsdvm.lock -c "qemu-system-x86_64 -m 8G -smp 4 -accel kvm -drive file=/home/austin/cron-scripts/netbsd.qcow2,format=qcow2,if=virtio -nographic -netdev user,id=net0,hostfwd=tcp:0.0.0.0:2223-:22 -device virtio-net-pci,netdev=net0 -serial mon:stdio -cpu host"
