# Copyright 2018 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="Interface for using ROS with the <a href=\"http://gazebosim.org/\">Gazebo</[...]"
HOMEPAGE="http://gazebosim.org/tutorials?cat=connect_ros"
SRC_URI="https://github.com/ros-gbp/${PN}-release/archive/release/indigo/${PN}/2.4.16-1.tar.gz -> ${PN}-indigo-release-${PV}.tar.gz"

LICENSE="( BSD LGPL-2 Apache-2.0 )"
KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-indigo/gazebo_msgs
	ros-indigo/gazebo_plugins
	ros-indigo/gazebo_ros
"
DEPEND="${RDEPEND}
	ros-indigo/catkin
"

SLOT="0"
ROS_DISTRO="indigo"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
