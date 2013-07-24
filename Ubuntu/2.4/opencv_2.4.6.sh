arch=$(uname -m)
if [ "$arch" == "i686" -o "$arch" == "i386" -o "$arch" == "i486" -o "$arch" == "i586" ]; then
flag=1
else
flag=0
fi
echo "Installing OpenCV 2.4.6"

echo "Removing any pre-installed ffmpeg and x264"
sudo apt-get remove ffmpeg x264 libx264-dev
echo "Installing Dependenices"
sudo apt-get install libopencv-dev
sudo apt-get install build-essential checkinstall cmake pkg-config yasm
sudo apt-get install libtiff4-dev libjpeg-dev libjasper-dev
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev
sudo apt-get install python-dev python-numpy
sudo apt-get install libtbb-dev
sudo apt-get install libqt4-dev libgtk2.0-dev

echo "Installing x264..."
sudo apt-get install x264

echo "installing ffmpeg ..."
sudo apt-get install ffmpeg

echo "installing v4l..."
sudo apt-get install v4l-utils

echo "Downloading OpenCV 2.4.6"
wget -O OpenCV-2.4.6.tar.gz http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/2.4.6/opencv-2.4.6.tar.gz/download
echo "Installing OpenCV 2.4.6"
tar -xvzf OpenCV-2.4.6.tar.gz
cd opencv-2.4.6
mkdir build
cd build
cmake -D BUILD_SHARED_LIBS=OFF ..

make
sudo make install
sudo chmod a+w /etc/ld.so.conf
echo "/usr/local/lib" >> /etc/ld.so.conf
chmod a-w /etc/ld.so.conf
sudo ldconfig
echo "OpenCV 2.4.6 ready to be used"
