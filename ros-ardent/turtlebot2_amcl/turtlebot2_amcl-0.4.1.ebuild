# Copyright 2018 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{3_5,3_6} )

inherit ament-cmake

DESCRIPTION="Demo of turtlebot2 localization with amcl."
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros2-gbp/turtlebot2_demo-release/archive/release/ardent/${PN}/0.4.1-0.tar.gz -> ${PN}-ardent-release-${PV}.tar.gz"

LICENSE="Apache-2.0"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
IUSE="test"
RDEPEND="
	ros-ardent/amcl
	ros-ardent/ament_index_python
	ros-ardent/astra_camera
	ros-ardent/depthimage_to_laserscan
	ros-ardent/joy
	ros-ardent/launch
	ros-ardent/map_server
	ros-ardent/ros2run
	ros-ardent/teleop_twist_joy
	ros-ardent/tf2_ros
	ros-ardent/turtlebot2_drivers
	test? ( ros-ardent/ament_lint_auto )
	test? ( ros-ardent/ament_lint_common )
"
DEPEND="${RDEPEND}
	ros-ardent/ament_cmake
"

SLOT="0"
ROS_DISTRO="ardent"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
