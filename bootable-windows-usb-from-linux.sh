sudo fdisk /dev/sdc
g # create gpt partition table
n # add new partition
mkfs.fat -F 32 /dev/sdc1 # won't fit if file size is >4GB
sudo mount ~/Downlods/windows.iso /mnt/iso
sudo mount /dev/sdc1 /mnt/freshka
sudo cp -r /mnt/iso/* /mnt/freshka # Copy files from iso to new partition
