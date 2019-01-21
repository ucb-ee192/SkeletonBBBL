#!/bin/bash

# EE192 setup script for Beaglebone Blue using ROS.  Run this only once.

# INSTALL THE ROBOT CONTROL LIBRARY --------------------------------------
# For more information, see http://www.strawsondesign.com/docs
# /librobotcontrol/installation.html
# Method 2: Install from Debian Package or Repository

cd ~/

# Download the latest Robot Control Library package from Strawson Design
wget  https://github.com/StrawsonDesign/librobotcontrol/releases/download/V1.0.4/librobotcontrol_1.0.4_armhf.deb

# Install the Robot Control Library
sudo dpkg -i librobotcontrol_1.0.4_armhf.deb

# Clone the Robot Control Library source code for reference
git clone https://github.com/StrawsonDesign/librobotcontrol.git


# INSTALL ROS ------------------------------------------------------------
# For more information, see http://wiki.ros.org/melodic/Installation/Ubuntu

# Setup packages.ros.org and keys
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

# Install ROS melodic
sudo apt-get update
sudo apt install ros-melodic-ros-base -y

# Setup rosdep
sudo rosdep init
rosdep update

# Set up the ROS environment: source the ROS setup.bash when the terminal
# opens.  We can also tell .bashrc to source the catkin_ws setup.bash in a
# later step.
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# Install tools and dependencies for building ROS packages
sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential -y

# Setup the catkin workspace
mkdir -p ~/catkin_ws/src # Create the catkin_ws and src folders
cd ~/catkin_ws/
catkin_make # Initialize the catkin workspace

# Install usb_cam from source
cd src
git clone https://github.com/ros-drivers/usb_cam.git

# Clone the EE192 Skeleton code
git clone https://github.com/ucb-ee192/SkeletonROS.git

cd ~/catkin_ws/
catkin_make
cd ~

# source the ~/catkin_ws/devel/setup.bash file as well when terminal starts
echo "source /home/ubuntu/catkin_ws/devel/setup.bash" >> ~/.bashrc


# OTHER ------------------------------------------------------------------

# Install other packages that Justin thinks are useful
sudo apt-get install vim -y
