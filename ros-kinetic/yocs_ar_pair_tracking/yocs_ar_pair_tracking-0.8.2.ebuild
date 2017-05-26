# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="The AR pair tracking package"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/yujinrobot-release/yujin_ocs-release/archive/release/kinetic/yocs_ar_pair_tracking/0.8.2-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/sensor_msgs
    ros-kinetic/roscpp
    ros-kinetic/std_msgs
    ros-kinetic/ar_track_alvar_msgs
    ros-kinetic/geometry_msgs
    ros-kinetic/yocs_msgs
    ros-kinetic/yocs_math_toolkit
    ros-kinetic/yocs_ar_marker_tracking
"
DEPEND="
    ros-kinetic/sensor_msgs
    ros-kinetic/roscpp
    ros-kinetic/std_msgs
    ros-kinetic/ar_track_alvar_msgs
    ros-kinetic/geometry_msgs
    ros-kinetic/yocs_msgs
    ros-kinetic/yocs_math_toolkit
    ros-kinetic/yocs_ar_marker_tracking
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