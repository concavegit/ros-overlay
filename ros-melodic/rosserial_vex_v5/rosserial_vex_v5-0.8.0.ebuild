# Copyright 2018 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5,3_6} )

inherit ros-cmake

DESCRIPTION="rosserial for the VEX Cortex V5 Robot Brain platform."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros-gbp/rosserial-release/archive/release/melodic/${PN}/0.8.0-0.tar.gz -> ${PN}-melodic-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-melodic/rospy
	ros-melodic/rosserial_client
	ros-melodic/rosserial_python
"
DEPEND="${RDEPEND}
	ros-melodic/catkin
"

SLOT="0"
ROS_DISTRO="melodic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
