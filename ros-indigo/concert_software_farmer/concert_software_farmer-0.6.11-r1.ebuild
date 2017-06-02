# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Concert Software farm is to manage software being utilised across services"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/yujinrobot-release/rocon_concert-release/archive/release/indigo/concert_software_farmer/0.6.11-1.tar.gz -> ${P}-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="x86 amd64 arm ~arm64"

RDEPEND="
    ros-indigo/concert_msgs
    ros-indigo/genpy
    ros-indigo/rocon_python_comms
    ros-indigo/rocon_python_utils
    ros-indigo/rocon_std_msgs
    ros-indigo/rospy
    dev-python/rospkg
"
DEPEND="${RDEPEND}
    ros-indigo/catkin
    dev-python/catkin_pkg
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/indigo"

src_unpack() {
    default
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
    source /${ROS_PREFIX}/setup.bash
    catkin_make_isolated --install --install-space="${D}/${ROS_PREFIX}" || die
    if [[ -e /${ROS_PREFIX}/setup.bash ]]; then
        rm -f ${D}/${ROS_PREFIX}/{.catkin,_setup_util.py,env.sh,setup.bash,setup.sh}
        rm -f ${D}/${ROS_PREFIX}/{setup.zsh,.rosinstall}
    fi
}