# Copyright 2017 Open Source Robotics Foundation
# Distributed under the terms of the BSD license

EAPI=6
PYTHON_COMPAT=( python{2_7,3_5} )

inherit ros-cmake

DESCRIPTION="Capture is a set of tools to capture objects in 3D and perform odometry"
HOMEPAGE="http://wg-perception.github.io/capture"
SRC_URI="https://github.com/ros-gbp/object_recognition_capture-release/archive/release/kinetic/object_recognition_capture/0.3.2-0.tar.gz -> ${PN}-release-${PV}.tar.gz"

LICENSE="BSD"

KEYWORDS="~x86 ~amd64 ~arm ~arm64"
RDEPEND="
	ros-kinetic/ecto
	ros-kinetic/ecto_image_pipeline
	ros-kinetic/ecto_opencv
	ros-kinetic/ecto_openni
	ros-kinetic/ecto_ros
	ros-kinetic/object_recognition_core
	dev-libs/boost
"
DEPEND="${RDEPEND}
	ros-kinetic/catkin
"

SLOT="0"
ROS_DISTRO="kinetic"
ROS_PREFIX="opt/ros/${ROS_DISTRO}"

