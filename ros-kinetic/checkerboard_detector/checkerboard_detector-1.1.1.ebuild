# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION=""
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/tork-a/jsk_recognition-release/archive/release/kinetic/checkerboard_detector/1.1.1-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/jsk_recognition_msgs
    ros-kinetic/cv_bridge
    ros-kinetic/eigen_conversions
    ros-kinetic/dynamic_reconfigure
    ros-kinetic/rosconsole
    ros-kinetic/sensor_msgs
    ros-kinetic/image_geometry
    ros-kinetic/posedetection_msgs
    ros-kinetic/dynamic_tf_publisher
    ros-kinetic/roscpp
    ros-kinetic/tf2
    ros-kinetic/message_filters
    ros-kinetic/tf
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
