# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="Simple simulation interface and template for setting up a hardware interface for ros_control"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/davetcoleman/ros_control_boilerplate-release/archive/release/kinetic/ros_control_boilerplate/0.4.0-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/hardware_interface
    ros-kinetic/transmission_interface
    ros-kinetic/joint_limits_interface
    ros-kinetic/controller_manager
    ros-kinetic/sensor_msgs
    ros-kinetic/control_toolbox
    ros-kinetic/roscpp
    ros-kinetic/urdf
    ros-kinetic/rosparam_shortcuts
    ros-kinetic/control_msgs
    ros-kinetic/std_msgs
    ros-kinetic/trajectory_msgs
    ros-kinetic/actionlib
"
DEPEND="
    ros-kinetic/hardware_interface
    ros-kinetic/transmission_interface
    ros-kinetic/joint_limits_interface
    ros-kinetic/cmake_modules
    ros-kinetic/controller_manager
    ros-kinetic/sensor_msgs
    ros-kinetic/control_toolbox
    ros-kinetic/roscpp
    ros-kinetic/urdf
    ros-kinetic/rosparam_shortcuts
    ros-kinetic/control_msgs
    ros-kinetic/std_msgs
    ros-kinetic/trajectory_msgs
    ros-kinetic/actionlib
    dev-cpp/gflags
"

SLOT="0/0"
CMAKE_BUILD_TYPE=RelWithDebInfo

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
    echo ""
}

pkg_postinst() {
    cd ../work
    source /opt/ros/kinetic/setup.bash
    catkin_make_isolated --install --install-space="/opt/ros/kinetic" || die
}