# Copyright 2018 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5,3_6} )

inherit ros-cmake

DESCRIPTION="Default configuration of the different robots supported by the Care-O-bot s[...]"
HOMEPAGE="http://ros.org/wiki/cob_default_robot_config"
SRC_URI="https://github.com/ipa320/cob_robots-release/archive/release/indigo/${PN}/0.6.9-0.tar.gz -> ${PN}-indigo-release-${PV}.tar.gz"

LICENSE="Apache-2.0"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-indigo/cob_supported_robots
	ros-indigo/roslaunch
"
DEPEND="${RDEPEND}
	ros-indigo/catkin
"

SLOT="0"
ROS_DISTRO="indigo"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
