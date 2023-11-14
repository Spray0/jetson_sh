#!/bin/bash
echo hello jetson nano!

sudo add-apt-repository "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ xenial main multiverse restricted universe"
sudo apt update
sudo apt install -y libjasper1 libjasper-dev
sudo apt install -y build-essential checkinstall cmake pkg-config yasm git gfortran uzip
sudo apt install -y libjpeg8-dev libjasper-dev libpng12-dev libtiff5-dev libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine2-dev libv4l-dev
sudo apt install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgtk2.0-dev libtbb-dev libatlas-base-dev libfaac-dev libmp3lame-dev libtheora-dev libvorbis-dev libxvidcore-dev libopencore-amrnb-dev libopencore-amrwb-dev x264 v4l-utils
sudo apt install -y python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

cd ~/Downloads
wget -O opencv.zip https://github.com/opencv/opencv/archive/refs/tags/4.7.0.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/refs/tags/4.7.0.zip
unzip opencv.zip
unzip opencv_contrib.zip
cd opencv-4.7.0
mkdir build
cd build

cmake \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX=/usr/local \
-DOPENCV_ENABLE_NONFREE=1 \
-DBUILD_opencv_python2=1 \
-DBUILD_opencv_python3=1 \
-DWITH_FFMPEG=1 \
-DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda \
-DCUDA_ARCH_BIN=5.3 \
-DCUDA_ARCH_PTX=5.3 \
-DWITH_CUDA=1 \
-DENABLE_FAST_MATH=1 \
-DCUDA_FAST_MATH=1 \
-DWITH_CUBLAS=1 \
-DOPENCV_GENERATE_PKGCONFIG=1 \
-DOPENCV_EXTRA_MODULES_PATH=/home/jetson/Downloads/opencv_contrib-4.7.0/modules \
..
