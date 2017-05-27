# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION=""
HOMEPAGE="http://ros.org/wiki/kni"
SRC_URI="https://github.com/uos-gbp/katana_driver-release/archive/release/kinetic/kni/1.0.8-0.tar.gz"

LICENSE="GPL"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    dev-libs/boost
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
