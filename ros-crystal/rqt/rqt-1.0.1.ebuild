# Copyright 2018 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{3_5,3_6} )

inherit ament-python

DESCRIPTION="rqt is a Qt-based framework for GUI development for ROS. It consists of thr[...]"
HOMEPAGE="http://ros.org/wiki/rqt"
SRC_URI="https://github.com/ros2-gbp/${PN}-release/archive/release/crystal/${PN}/1.0.1-0.tar.gz -> ${PN}-crystal-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-crystal/rqt_gui
	ros-crystal/rqt_gui_cpp
	ros-crystal/rqt_gui_py
	ros-crystal/rqt_py_common
"
DEPEND="${RDEPEND}
"

SLOT="0"
ROS_DISTRO="crystal"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
