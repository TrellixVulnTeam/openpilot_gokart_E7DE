#!/bin/bash
tmux new -d -s carla-sim
tmux send-keys "./launch_openpilot.sh" ENTER
tmux neww
tmux send-keys "export ROS_MASTER_URI=http://192.168.150.136:11311 ; export ROS_IP=192.168.150.107 ; source /opt/ros/noetic/setup.bash ; . /opt/ros/noetic/setup.bash ; cd gokart_controllerx ; python bridge_hamid.pyX  $*" ENTER
tmux neww
tmux send-keys "./../replay/ui.py $*" ENTER
tmux a -t carla-sim
