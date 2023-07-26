#!/bin/bash
apt upgrade & apt update
apt remove python3
apt install software-properties-common
add-apt-repository ppa:deadsnakes/ppa
apt update
apt install python3.10

curl https://raw.githubusercontent.com/GoogleCloudPlatform/compute-gpu-installation/main/linux/install_gpu_driver.py --output install_gpu_driver.py
python3 install_gpu_driver.py
nvidia-smi

# https://cloud.google.com/compute/docs/disks/format-mount-disk-linux

lsblk nvme0n2
mkfs.ext4 -m 0 -E lazy_itable_init=0,lazy_journal_init=0,discard /dev/nvme0n2
mkdir -p /mnt/disk
mount -o auto /dev/nvme0n2 /mnt/disk
chmod a+w /mnt/disk

ln -s /mnt/disk/.cache /root/.cache

cd /mnt/disk

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

sh ./Miniconda3-latest-Linux-x86_64.sh

conda create -n python310 anaconda python=3.10
conda activate python310
conda install pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia

git clone https://github.com/tloen/alpaca-lora.git
