#!/bin/bash

# EE192 setup script for Beaglebone Blue using only the Robot Control
# Library.  Run this only once.

# INSTALL THE ROBOT CONTROL LIBRARY --------------------------------------
# For more information, see http://www.strawsondesign.com/docs
# /librobotcontrol/installation.html
# Specifically, Method 2: Install from Debian Package or Repository

# Download the latest Robot Control Library package from Strawson Design
wget  https://github.com/StrawsonDesign/librobotcontrol/releases/download/V1.0.4/librobotcontrol_1.0.4_armhf.deb

# Install the Robot Control Library
sudo dpkg -i librobotcontrol_1.0.4_armhf.deb

# Clone the Robot Control Library source code for reference
git clone https://github.com/StrawsonDesign/librobotcontrol.git


# SET UP TEMPLATE PROJECT ------------------------------------------------
# For more information, see http://strawsondesign.com/docs/librobotcontrol/
# project_template.html
cp -r /usr/share/robotcontrol/rc_project_tepmlate ~/rename_this_project


# OTHER ------------------------------------------------------------------

# Install other packages that Justin thinks are useful
sudo apt-get install vim -y
