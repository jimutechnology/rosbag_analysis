#!/bin/bash
# To get the package:
# git clone https://github.com/cwru-robotics/cwru-ros-pkg.git
mkdir -p $1
# ./../cwru-ros-pkg/catkin/src/cwru_base_hydro/rosbag_to_matlab/scripts/bag_to_mat.py "$1.bag" $1
./bag_to_mat.py "$1.bag" $1
