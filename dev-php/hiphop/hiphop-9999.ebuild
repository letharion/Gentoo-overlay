# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Hiphop, converts php into c++"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-util/re2c
dev-cpp/tbb
dev-libs/libmemcached
dev-libs/libevent[hiphop]
net-misc/curl[hiphop]
net-libs/c-client
>=dev-util/cmake-2.6
>=sys-devel/gcc-4.3[cxx]
>=dev-libs/boost-1.37
sys-devel/flex
sys-devel/bison
dev-db/mysql
dev-libs/libxml2
dev-libs/libmcrypt
>=dev-libs/icu-4.2
dev-libs/openssl
sys-devel/binutils
sys-libs/libcap
media-libs/gd
sys-libs/zlib
dev-libs/oniguruma
dev-libs/libpcre
dev-libs/expat"

RDEPEND="${DEPEND}"
