#!/bin/bash
#!/bin/bash
apt upgrade & apt update
apt remove python3
apt install software-properties-common
add-apt-repository ppa:deadsnakes/ppa
apt update
apt install python3.10

# you can mount a disk if necessary.
# 1. find the external disk name:
# lsblk
# DO NOT format the disk since it's used by the trainning server as well
# 2. mkdir -p /mnt/disk
# 3. mount -o auto /dev/nvme0n2 /mnt/disk
# 4. chmod a+w /mnt/disk

# LOTS of stuff will be in ~/.cache
ln -s /mnt/disk/.cache /root/.cache

pip install pytorch torchvision torchaudio

git clone https://github.com/ggerganov/llama.cpp.git

pip install pyqt5 --config-settings --confirm-license= --verbose

pip install llama-cpp-python
