# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="A controller for driving a differential drive base to a pose goal or along a path specified by multiple poses.
    A pose consists of a 2D position (x,y) and a 1D orientation (theta)."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/yujinrobot-release/yujin_ocs-release/archive/release/kinetic/yocs_diff_drive_pose_controller/0.8.2-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/nodelet
    ros-kinetic/yocs_controllers
    ros-kinetic/sensor_msgs
    ros-kinetic/roscpp
    ros-kinetic/ecl_threads
    ros-kinetic/std_msgs
    ros-kinetic/tf
    ros-kinetic/geometry_msgs
    ros-kinetic/yocs_math_toolkit
    ros-kinetic/pluginlib
"
DEPEND="
    ros-kinetic/nodelet
    ros-kinetic/yocs_controllers
    ros-kinetic/sensor_msgs
    ros-kinetic/roscpp
    ros-kinetic/ecl_threads
    ros-kinetic/std_msgs
    ros-kinetic/tf
    ros-kinetic/geometry_msgs
    ros-kinetic/yocs_math_toolkit
    ros-kinetic/pluginlib
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