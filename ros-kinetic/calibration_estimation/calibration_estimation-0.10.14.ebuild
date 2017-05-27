# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Runs an optimization to estimate the a robot's kinematic parameters. This package is a
    generic rewrite of pr2_calibration_estimation."
HOMEPAGE="http://ros.org/wiki/calibration_estimation"
SRC_URI="https://github.com/ros-gbp/calibration-release/archive/release/kinetic/calibration_estimation/0.10.14-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/visualization_msgs
    ros-kinetic/urdfdom_py
    ros-kinetic/rospy
    ros-kinetic/sensor_msgs
    ros-kinetic/calibration_msgs
    ros-kinetic/python_orocos_kdl
    ros-kinetic/rostest
    dev-python/matplotlib
    dev-libs/scipy
"
DEPEND="${RDEPEND}
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
