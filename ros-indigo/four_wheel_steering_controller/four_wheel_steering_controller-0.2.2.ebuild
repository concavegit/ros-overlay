# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Controller for a four wheel steering mobile base."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/Romea/romea_controllers-release/archive/release/indigo/four_wheel_steering_controller/0.2.2-0.tar.gz -> ${P}-${PV}.tar.gz"

LICENSE="GPLv3"

KEYWORDS="x86 amd64 arm ~arm64"

RDEPEND="
    ros-indigo/controller_interface
    ros-indigo/four_wheel_steering_msgs
    ros-indigo/nav_msgs
    ros-indigo/realtime_tools
    ros-indigo/tf
    ros-indigo/urdf_vehicle_kinematic
"
DEPEND="${RDEPEND}
    ros-indigo/catkin
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