#!/bin/xonsh

rm -f /output/bsd.img
cp /input/bsd.img /output/

vars = $(env).split()
for var in vars:
  print(var)
print("==================================================================")
print("====================    FILTERING VARS    ========================")
print("==================================================================")
for VAR_TO_EXCLUDE in ["PATH=","PWD=","SHELL_TYPE","LOADED_RC_FILES","TERM=","XONSH","HOME=","BASH_COMPLETIONS=","ARGS=","SHLVL="]:
  vars = [ var for var in vars if not VAR_TO_EXCLUDE in var ]

for var in vars:
  print(var)

with open("iso/env","w") as file:
  lines = [ 'echo "export {VARNAME}={VARVALUE}" >> ~/.bash_profile\n'.format(VARNAME=var.split("=")[0], VARVALUE=var.split("=")[1] ) for var in vars if "=" in var ]
  file.writelines(lines)

more iso/env

chmod +x iso/env


mkisofs -iso-level 3 -J -joliet-long -rock -input-charset utf-8 -o ./env.iso ./iso

qemu-system-x86_64 -enable-kvm -m 6144  -drive format=raw,id=HDD,file=/output/bsd.img -netdev user,id=net0 -device e1000,netdev=net0 -drive file=env.iso,media=cdrom -smp 2 -vnc :1 -k fr
