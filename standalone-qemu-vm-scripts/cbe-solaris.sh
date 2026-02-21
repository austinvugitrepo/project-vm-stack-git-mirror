#!/bin/sh

exec flock -n /tmp/solaris.lock -c "qemu-system-x86_64 -m 8G -smp 4 -accel kvm -drive file=/home/austin/cron-scripts/solaris.qcow2,if=virtio,format=qcow2 -nographic -serial mon:stdio -netdev user,id=net0,hostfwd=tcp:0.0.0.0:2225-:22 -device virtio-net-pci,netdev=net0 -cpu host"
