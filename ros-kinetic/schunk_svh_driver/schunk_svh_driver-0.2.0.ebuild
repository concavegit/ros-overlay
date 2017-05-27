# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="SVH Driver wrapper to enable control of the Schunk five finger hand"
HOMEPAGE="http://www.ros.org/wiki/schunk_svh_driver"
SRC_URI="https://github.com/fzi-forschungszentrum-informatik/schunk_svh_driver-release/archive/release/kinetic/schunk_svh_driver/0.2.0-0.tar.gz"

LICENSE="LGPL"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/std_msgs
    ros-kinetic/xacro
    ros-kinetic/dynamic_reconfigure
    ros-kinetic/rqt_gui_py
    ros-kinetic/rospy
    ros-kinetic/sensor_msgs
    ros-kinetic/urdf
    ros-kinetic/fzi_icl_comm
    ros-kinetic/fzi_icl_core
    ros-kinetic/rqt_gui
    ros-kinetic/roscpp
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
