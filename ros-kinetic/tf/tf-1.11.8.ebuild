# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

inherit cmake-utils eutils

DESCRIPTION="tf is a package that lets the user keep track of multiple coordinate
frames over"
HOMEPAGE="http://www.ros.org/wiki/tf"
SRC_URI="https://github.com/ros-gbp/geometry-release/archive/release/kinetic/tf/1.11.8-0.tar.gz -> ${P}-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="x86 amd64 arm ~arm64"
PYTHON_DEPEND="3::3.5"

RDEPEND="
    ros-kinetic/geometry_msgs
    ros-kinetic/message_filters
    ros-kinetic/message_runtime
    ros-kinetic/rosconsole
    ros-kinetic/roscpp
    ros-kinetic/roswtf
    ros-kinetic/sensor_msgs
    ros-kinetic/std_msgs
    ros-kinetic/tf2
    ros-kinetic/tf2_ros
    media-gfx/graphviz
"
DEPEND="${RDEPEND}
    ros-kinetic/angles
    ros-kinetic/catkin
    ros-kinetic/message_generation
    ros-kinetic/rostest
"

SLOT="0"
CMAKE_BUILD_TYPE=RelWithDebInfo
ROS_PREFIX="opt/ros/kinetic"

src_unpack() {
    default
    mv *${P}* ${P}
    cd ${P}
    EPATCH_SOURCE="${FILESDIR}" EPATCH_SUFFIX="patch" \
                 EPATCH_FORCE="yes" epatch
}

src_configure() {
    append-cxxflags "-std=c++11"
    export DEST_SETUP_DIR="/${ROS_PREFIX}"
    local mycmakeargs=(
        -DCMAKE_INSTALL_PREFIX=${D}${ROS_PREFIX}
        -DCMAKE_PREFIX_PATH=/${ROS_PREFIX}
        -DPYTHON_INSTALL_DIR=lib64/python3.5/site-packages
        -DCATKIN_ENABLE_TESTING=OFF
        -DPYTHON_EXECUTABLE=/usr/bin/ros-python-kinetic
        -DCATKIN_BUILD_BINARY_PACKAGE=1
     )
    cmake-utils_src_configure
}

src_install() {
    cd ${WORKDIR}/${P}_build
    make install || die
}
