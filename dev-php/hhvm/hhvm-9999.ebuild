<<<<<<< HEAD
# Copyright 1999-2012 Gentoo Foundation
=======
# Copyright 1999-2013 Gentoo Foundation
>>>>>>> Copy the old hiphop ebuild to a newer hhvm one. Update ebuilds to work better with hhvm.
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

<<<<<<< HEAD
DESCRIPTION="HHVM, very fast php JIT"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
=======
DESCRIPTION="HHVM, fast PHP JIT runtime"
HOMEPAGE="https://github.com/facebook/hiphop-php"
# SRC_URI="https://github.com/facebook/hiphop-php/archive/HPHP-${PV}.tar.gz"

LICENSE="PHP-3.01"
>>>>>>> Copy the old hiphop ebuild to a newer hhvm one. Update ebuilds to work better with hhvm.
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

<<<<<<< HEAD
DEPEND=" dev-libs/libevent[hiphop]
>=net-misc/curl-7.28
dev-cpp/glog
>=dev-libs/jemalloc-3
dev-libs/libmemcached
sys-libs/libunwind
>=dev-libs/libmemcached-0.39
"

RDEPEND="${DEPEND}"
=======
# Uncertain dependencies
# libcurl4-openssl-dev
# php5-mcrypt php5-imagick

DEPEND="app-arch/bzip2
dev-cpp/glog
dev-cpp/tbb
virtual/mysql
>=dev-libs/boost-1.48
dev-libs/cloog-ppl
dev-libs/elfutils
dev-libs/icu
dev-libs/jemalloc[stats]
dev-libs/libmcrypt
dev-libs/libmemcached
dev-libs/libpcre
dev-libs/libxml2
dev-libs/oniguruma
dev-libs/openssl
dev-util/cmake
dev-util/google-perftools
media-libs/gd[jpeg,png]
net-libs/c-client
net-nds/openldap
sys-devel/gcc[cxx]
sys-devel/binutils
sys-libs/libcap
sys-libs/libunwind
sys-libs/ncurses
sys-libs/readline
sys-libs/zlib"

RDEPEND="${DEPEND}"

S="${D}/hiphop-php-HPHP"

src_compile() {
  ls -lha
}
>>>>>>> Copy the old hiphop ebuild to a newer hhvm one. Update ebuilds to work better with hhvm.
