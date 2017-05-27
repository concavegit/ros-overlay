# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Assorted filters designed to operate on 2D planar laser scanners,
    which use the sensor_msgs/LaserScan type."
HOMEPAGE="http://ros.org/wiki/laser_filters"
SRC_URI="https://github.com/ros-gbp/laser_filters-release/archive/release/kinetic/laser_filters/1.8.3-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/message_filters
    ros-kinetic/sensor_msgs
    ros-kinetic/laser_geometry
    ros-kinetic/filters
    ros-kinetic/tf
    ros-kinetic/pluginlib
    ros-kinetic/roscpp
    ros-kinetic/angles
"
DEPEND="${RDEPEND}
    ros-kinetic/rostest
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/kinetic"

src_unpack() {
    wget -O ${P}.tar.gz ${SRC_URI}
    tar -xf ${P}.tar.gz
    rm -f ${P}.tar.gz
    mv *${P}* ${P}
}

src_configure() {
    mkdir ${WORKDIR}/src
    cp -R ${WORKDIR}/${P} ${WORKDIR}/src/${P}
}

src_compile() {
    echo ""
}

src_install() {
    cd ../../work
    source /opt/ros/kinetic/setup.bash
    catkin_make_isolated --install --install-space="${D}/${ROS_PREFIX}" || die
    rm -f ${D}/${ROS_PREFIX}/{.catkin,_setup_util.py,env.sh,setup.bash,setup.sh}
    rm -f ${D}/${ROS_PREFIX}/{setup.zsh,.rosinstall}
}
