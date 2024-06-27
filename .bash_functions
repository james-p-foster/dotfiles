#!/usr/bin/env bash

ROS1() {
    source /opt/ros/noetic/setup.bash
    echo "ROS1 exported"
}

ROS2() {
    source /opt/ros/galactic/setup.bash
    echo "ROS2 exported"
}

# Assumes building all packages
build() {
    if [ $ROS_VERSION == 1 ]; then
        catkin build "$@"
    fi
    if [ $ROS_VERSION == 2 ]; then
        colcon build --cmake-args "$@" --event-handlers=console_direct+
    fi
}

# Assumes cleaning all packages
clean() {
    if [ $ROS_VERSION == 1 ]; then
        echo "Calling catkin clean -y..."
        catkin clean -y
    fi
    if [ $ROS_VERSION == 2 ]; then
        echo "Removing build/, install/, log/"
        rm -r build/ install/ log/
    fi 
}

paths() {
  export PATH=$1/bin:$PATH
  export CMAKE_PREFIX_PATH=$1/include:$CMAKE_PREFIX_PATH
  export LD_LIBRARY_PATH=$1/lib:$LD_LIBRARY_PATH
  export PYTHONPATH=$1/lib/python3/site-packages:$PYTHONPATH
  export PYTHONPATH=$1/lib/python3/dist-packages:$PYTHONPATH
  export PYTHONPATH=$1/lib/python3.10/site-packages:$PYTHONPATH
  export PYTHONPATH=$1/lib/python3.10/dist-packages:$PYTHONPATH
  export PKG_CONFIG_PATH=$1/lib/pkgconfig:$PKG_CONFIG_PATH
  export ROS_PACKAGE_PATH=$1/share:$ROS_PACKAGE_PATH
  echo "Paths for $1 exported"
}

gitprofile() {
    # If number of arguments is 0 (no desired profile passed), then print out
    # the local git config
    if [ $# -eq 0 ]; then
        echo "Local git credentials:"
        git config user.name
        git config user.email
    fi
}

firefox_open () {
    num_lines=$(sed -n '$=' $1)
    url_count=0

    for ((i=1; i<=num_lines; i++))
    do
        line=$(sed "${i}q;d" $1)
        if [[ $line =~ .*"http://".* ]] || [[ $line =~ .*"https://".* ]]
        then
            firefox --new-tab $line
            let "url_count+=1"
        fi
    done
    echo "Opened $url_count tabs."
}

set_brightness() {
    brightness=$1
    if (( $(echo "$brightness > 1" | bc -l) )) || (( $(echo "$brightness < 0.2" | bc -l) ))
    then
        echo "Invalid brightness setting: pass a brightness between 0.2 and 1"
    else
        xrandr --output DP-0 --brightness $brightness
        xrandr --output DP-2 --brightness $brightness
        xrandr --output DP-4.8 --brightness $brightness
    fi
}
