# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="The goto_crossing package provides a goToGoal behavior  to a crossing center i"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/lama-imr/lama_utilities-release/archive/release/indigo/goto_crossing/0.1.8-0.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-indigo/angles
	ros-indigo/geometry_msgs
	ros-indigo/lama_msgs
	ros-indigo/message_runtime
	ros-indigo/roscpp
	ros-indigo/std_msgs
	ros-indigo/std_srvs
"
DEPEND="${RDEPEND}
	ros-indigo/catkin
	ros-indigo/message_generation
"

SLOT="0"
ROS_DISTRO="indigo"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

