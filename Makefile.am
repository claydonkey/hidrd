# Copyright (C) 2009-2010 Nikolai Kondrashov
#
# This file is part of hidrd.
#
# Hidrd is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# Hidrd is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with hidrd; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

SUBDIRS = m4 db include lib src

dist_noinst_SCRIPTS = bootstrap distcheck-all

ACLOCAL_AMFLAGS = -I m4/autoconf

if ENABLE_ADR
install-exec-am:
	@echo "Copying Libraries to android directory"
	@cp ${DESTDIR}/${bindir}/hidrd-convert ${srcdir}/hidrd-android/app/src/main/jniLibs/arm64-v8a/libhidrd-convert.so
	@cp ${DESTDIR}/${libdir}/*.so ${srcdir}/hidrd-android/app/src/main/jniLibs/arm64-v8a
	@cp ${DESTDIR}/${datadir}/xml/schema/hidrd.xsd ${srcdir}/hidrd-android/app/src/main/jniLibs/arm64-v8a/libhidrd.xsd.so
	@cp  ${srcdir}/src/mouse_descriptor.xml ${srcdir}/hidrd-android/app/src/main/jniLibs/arm64-v8a/libmouse_descriptor.xml.so
	@cp  ${srcdir}/src/mouse_descriptor.code ${srcdir}/hidrd-android/app/src/main/jniLibs/arm64-v8a/libmouse_descriptor.code.so
	@cp  ${srcdir}/src/mouse_descriptor.hex ${srcdir}/hidrd-android/app/src/main/jniLibs/arm64-v8a/libmouse_descriptor.hex.so
	@cp  ${srcdir}/src/*.so ${srcdir}/hidrd-android/app/src/main/jniLibs/arm64-v8a
endif
