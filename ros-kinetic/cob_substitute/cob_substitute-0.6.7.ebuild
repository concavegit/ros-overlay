# Copyright 2018 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="cob_substitute"
HOMEPAGE="http://ros.org/wiki/cob_substitute"
SRC_URI="https://github.com/ipa320/${PN}-release/archive/release/kinetic/${PN}/0.6.7-0.tar.gz -> ${PN}-kinetic-release-${PV}.tar.gz"

LICENSE="Apache-2.0"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-kinetic/cob_docker_control
	ros-kinetic/cob_reflector_referencing
	ros-kinetic/cob_safety_controller
"
DEPEND="${RDEPEND}
	ros-kinetic/catkin
"

SLOT="0"
ROS_DISTRO="kinetic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
