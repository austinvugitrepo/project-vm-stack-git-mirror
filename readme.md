# *Austin's Virtual Machine Stack*

## Dependencies:

+ 1. QEMU

+ 2. KVM

+ 3. LIBVIRT

# How to use:

My VM Stack can be either run together or independently so for example you can choose to run qemu by itself, qemu with kvm, or qemu, kvm, and libvirt together. An example of running qemu+kvm with file lock enabled: (to prevent running the script again while vm is active)

```bash

exec flock -n /tmp/freebsdvm.lock -c "qemu-system-x86_64 -m 8G -smp 4 -accel kvm -drive file=/home/austin/cron-scripts/FreeBSD-15.0-RELEASE-amd64-ufs.qcow2,format=qcow2,if=virtio -nographic -netdev user,id=net0,hostfwd=tcp:0.0.0.0:2222-:22 -device virtio-net-pci,netdev=net0 -serial mon:stdio -cpu host"

```

or using one of my libvirt xmls:

to register the vm once:

```bash

virsh define freebsd.xml

```

to start the vm:

```bash

virsh start freebsd

```

# OpenBSD VMM hypervisor config

This is exclusive to **OpenBSD** and can be found under the vmm hypervisor folder which contains my vm specifications for launching them

# Windows x86_64 QEMU batch files

I have provided batch files for my VMs that for the most part works well with Intel/AMD Windows x86-64 hosts and are mostly plug in play (usually needs WHPX aka Hyper V but on API level but can fallback on TCG)
you can find them under forqemuWindows64 or whatever i called it in the repo.
 
**NOTE:** I will not provide the actual qcow2s because well...They are my vms, you can make your own qcow2s tho and use my configurations if you like :D



