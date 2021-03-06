# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="Ecto is a hybrid C/Python development framework for constructing and maintaini"
HOMEPAGE="http://plasmodic.github.io/ecto/"
SRC_URI="https://github.com/ros-gbp/ecto-release/archive/release/indigo/ecto/0.6.12-0.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-indigo/xdot
	dev-libs/boost
	dev-lang/python
"
DEPEND="${RDEPEND}
	ros-indigo/catkin
"

SLOT="0"
ROS_DISTRO="indigo"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

