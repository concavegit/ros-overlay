# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="The diagnostic_analysis package can convert a log of diagnostics data
    into a series of CSV files. Robot logs are recorded with rosbag, and
    can be processed offline using the scripts in this package."
HOMEPAGE="http://www.ros.org/wiki/diagnostics_analysis"
SRC_URI="https://github.com/ros-gbp/diagnostics-release/archive/release/lunar/diagnostic_analysis/1.9.0-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-lunar/diagnostic_msgs
    ros-lunar/rosbag
    ros-lunar/roslib
"
DEPEND="${RDEPEND}
    ros-lunar/rostest
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
    cd ../../work
    source /opt/ros/lunar/setup.bash
    catkin_make_isolated --install --install-space="${D}" || die
}

pkg_postinst() {
    cd ${D}
    cp -R lib* /opt/ros/lunar
    cp -R share /opt/ros/lunar
    cp -R bin /opt/ros/lunar
    cp -R include /opt/ros/lunar
}