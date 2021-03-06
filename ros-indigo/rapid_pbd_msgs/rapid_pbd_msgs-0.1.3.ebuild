# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="Messages for rapid_pbd"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/jstnhuang-release/${PN}-release/archive/release/indigo/${PN}/0.1.3-0.tar.gz -> ${PN}-indigo-release-${PV}.tar.gz"

LICENSE="MIT"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-indigo/actionlib_msgs
	ros-indigo/control_msgs
	ros-indigo/geometry_msgs
	ros-indigo/message_runtime
	ros-indigo/moveit_msgs
	ros-indigo/sensor_msgs
	ros-indigo/trajectory_msgs
"
DEPEND="${RDEPEND}
	ros-indigo/catkin
	ros-indigo/message_generation
"

SLOT="0"
ROS_DISTRO="indigo"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
