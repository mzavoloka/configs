sudo fdisk /dev/sdc
g # create gpt partition table
n # add new partition
t 11 # change partition type to 11 "Microsoft basic data"
w # Save and exit
sudo mkfs.fat -F 32 /dev/sdc1 # won't fit if file size is >4GB
sudo umount /mnt/iso     && sudo mount ~/Downlods/windows.iso /mnt/iso
sudo umount /mnt/freshka && sudo mount /dev/sdc1 /mnt/freshka
sudo cp -r /mnt/iso/* /mnt/freshka # Copy files from iso to new partition
sudo umount /mnt/freshka
