# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="This package contains a collection of launch files that can be helpful in configuring
    the calibration stack to run on your robot."
HOMEPAGE="http://ros.org/wiki/calibration_launch"
SRC_URI="https://github.com/ros-gbp/calibration-release/archive/release/kinetic/calibration_launch/0.10.14-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/joint_states_settler
    ros-kinetic/urdfdom_py
    ros-kinetic/laser_cb_detector
    ros-kinetic/monocam_settler
    ros-kinetic/interval_intersection
"
DEPEND="
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