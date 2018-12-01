# Copyright 2018 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{3_5,3_6} )

inherit ament-cmake

DESCRIPTION="Implement the ROS middleware interface using PrismTech OpenSplice static co[...]"
HOMEPAGE="https://wiki.ros.org"
SRC_URI="https://github.com/ros2-gbp/rmw_opensplice-release/archive/release/crystal/${PN}/0.6.0-0.tar.gz -> ${PN}-crystal-release-${PV}.tar.gz"

LICENSE="Apache-2.0"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
IUSE="test"
RDEPEND="
	ros-crystal/rmw
	ros-crystal/rosidl_generator_c
	ros-crystal/rosidl_generator_cpp
	ros-crystal/rosidl_typesupport_opensplice_c
	ros-crystal/rosidl_typesupport_opensplice_cpp
	test? ( ros-crystal/ament_lint_auto )
	test? ( ros-crystal/ament_lint_common )
	=sci-libs/opensplice-6.7.*
"
DEPEND="${RDEPEND}
	ros-crystal/ament_cmake
	ros-crystal/opensplice_cmake_module
	ros-crystal/rcutils
	ros-crystal/rosidl_cmake
	ros-crystal/rosidl_generator_dds_idl
"

SLOT="0"
ROS_DISTRO="crystal"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"
