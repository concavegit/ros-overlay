# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Python library to assist in publishing markers easily"
HOMEPAGE="http://ros.org/wiki/easy_markers"
SRC_URI="https://github.com/wu-robotics/wu_ros_tools/archive/release/kinetic/easy_markers/0.2.4-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/visualization_msgs
    ros-kinetic/tf
    ros-kinetic/roslib
    ros-kinetic/rospy
    ros-kinetic/geometry_msgs
    ros-kinetic/interactive_markers
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
