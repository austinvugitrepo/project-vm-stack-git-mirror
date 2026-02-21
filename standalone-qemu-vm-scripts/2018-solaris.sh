#!/bin/sh

exec flock -n /tmp/solaris.lock -c "qemu-system-x86_64  -m 4G -smp 4 -M q35 -enable-kvm -drive file=/home/austin/cron-scripts/solaris.qcow2,if=none,id=hd0,cache=none -device ahci,id=ahci -device ide-hd,drive=hd0,bus=ahci.0 -nographic -serial mon:stdio -netdev user,id=net0,hostfwd=tcp:0.0.0.0:2225-:22 -device e1000,netdev=net0 -cpu host"
