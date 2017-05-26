# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6

DESCRIPTION="iRobot Create ROS driver node
    
    ROS bindings for the Create/Roomba driver.
    
    This is based on otl_roomba driver by OTL, ported to use
    create_driver's implementation instead. 
    This also contains a 'bonus' feature from the turtlebot 
    driver by Xuwen Cao and Morgan Quigley."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/turtlebot-release/turtlebot_create-release/archive/release/kinetic/create_node/2.3.1-0.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"

RDEPEND="
    ros-kinetic/python_orocos_kdl
    ros-kinetic/rospy
    ros-kinetic/diagnostic_msgs
    ros-kinetic/nav_msgs
    ros-kinetic/create_driver
    ros-kinetic/dynamic_reconfigure
    ros-kinetic/message_runtime
    ros-kinetic/tf
    ros-kinetic/geometry_msgs
"
DEPEND="
    ros-kinetic/rospy
    ros-kinetic/diagnostic_msgs
    ros-kinetic/nav_msgs
    ros-kinetic/create_driver
    ros-kinetic/dynamic_reconfigure
    ros-kinetic/tf
    ros-kinetic/message_generation
    ros-kinetic/geometry_msgs
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