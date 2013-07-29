# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="HHVM, very fast php JIT"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=" dev-libs/libevent[hiphop]
>=net-misc/curl-7.28
dev-cpp/glog
>=dev-libs/jemalloc-3
dev-libs/libmemcached
sys-libs/libunwind
>=dev-libs/libmemcached-0.39
"

RDEPEND="${DEPEND}"
