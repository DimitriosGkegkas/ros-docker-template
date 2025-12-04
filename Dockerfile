FROM ubuntu:20.04 AS base

# Set non-interactive mode for apt-get
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8

# Installing ros-noetic-desktop based from here http://wiki.ros.org/noetic/Installation/Ubuntu
RUN apt-get update && \
    apt-get install locales && \
    locale-gen en_US.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

RUN apt install -y software-properties-common && \
    add-apt-repository universe && \
    apt-get update && \
    apt-get install -y curl gnupg2 lsb-release && \
    sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -

RUN apt update && \
    apt upgrade -y && \
    apt install -y ros-noetic-desktop && \
    apt install -y python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential

RUN rosdep init && \
    rosdep update

RUN echo "source /opt/ros/noetic/setup.bash" >> /etc/bash.bashrc

RUN apt-get update && apt-get install -y \
    libeigen3-dev \
    libyaml-cpp-dev \
    ros-noetic-rviz-visual-tools

RUN mkdir -p /catkin_ws/src
WORKDIR /catkin_ws