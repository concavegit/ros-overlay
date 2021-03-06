# Copyright 2019 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{3_5,3_6} )

inherit ament-cmake

DESCRIPTION="Tools and utilities for ecl development."
HOMEPAGE="http://www.ros.org/wiki/ecl_tools"
SRC_URI="https://github.com/yujinrobot-release/${PN}-release/archive/release/crystal/${PN}/1.0.1-1.tar.gz -> ${PN}-crystal-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-crystal/ecl_build
	ros-crystal/ecl_license
"
DEPEND="${RDEPEND}
	ros-crystal/ament_cmake
"

SLOT="0"
ROS_DISTRO="crystal"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
