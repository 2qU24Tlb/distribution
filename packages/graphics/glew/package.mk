# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2022-present BrooksyTech (https://github.com/brooksytech)

PKG_NAME="glew"
PKG_VERSION="2.2.0"
PKG_LICENSE="BSD"
PKG_SITE="http://glew.sourceforge.net/"
PKG_URL="${SOURCEFORGE_SRC}/glew/glew/${PKG_VERSION}/${PKG_NAME}-${PKG_VERSION}.tgz"
PKG_DEPENDS_TARGET="toolchain libX11"
PKG_SHORTDESC="GLEW - The OpenGL Extension Wrangler Library"
PKG_TOOLCHAIN="cmake"

pre_configure() {
  PKG_CMAKE_SCRIPT=${PKG_BUILD}/build/cmake/CMakeLists.txt
}

pre_configure_target() {
        PKG_CMAKE_OPTS_TARGET+="        -DBUILD_UTILS=OFF \
					-DGLEW_REGAL=OFF \
					-DGLEW_OSMESA=OFF \
					-DGLEW_X11=ON \
                                        -DGLEW_EGL=ON \
                                        -DBUILD_SHARED_LIBS=ON"
                                        }

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/
  cp $PKG_BUILD/lib/libGLEW* $INSTALL/usr/lib/
}
