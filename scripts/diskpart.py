from os import system
import sys
from time import sleep
device = sys.argv[1]
print(device)

system(f"parted -a optimal {device} - print")
print("* Creating GPT Label")
system(f"parted -a optimal {device} - mklabel gpt")
print("* Creating bios boot partition")
system(f"parted -a optimal {device} - mkpart primary 1mib 3mib")
system(f"parted -a optimal {device} - name 1 grub")
system(f"parted -a optimal {device} - set 1 bios_grub on")
print("* Creating EFI Partition")
system(f"parted -a optimal {device} - mkpart primary 3mib 131mib")
system(f"parted -a optimal {device} - name 2 boot")
print("* Making swap partition")
system(f"parted -a optimal {device} - mkpart primary 131mib 8323mib")
system(f"parted -a optimal {device} - name 3 swap")
print("* Making rootfs")
system(f"parted -a optimal {device} - mkpart primary 643mib -1")
system(f"parted -a optimal {device} - name 4 rootfs")
print("* Setting EFI Partition as EFI partition...")
system(f"parted -a optimal {device} - set 2 boot on")
system(f"parted -a optimal {device} - print")



print("Partitioning success!")