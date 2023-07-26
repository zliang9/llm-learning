#!/bin/bash
#!/bin/bash
apt upgrade & apt update
apt remove python3
apt install software-properties-common
add-apt-repository ppa:deadsnakes/ppa
apt update
apt install python3.10

mkdir -p /mnt/disk
mount -o auto /dev/{your_disk_name} /mnt/disk
chmod a+w /mnt/disk

# LOTS of stuff will be in ~/.cache
ln -s /mnt/disk/.cache /root/.cache

pip install pytorch torchvision torchaudio

git clone https://github.com/ggerganov/llama.cpp.git

pip install pyqt5 --config-settings --confirm-license= --verbose

pip install llama-cpp-python
