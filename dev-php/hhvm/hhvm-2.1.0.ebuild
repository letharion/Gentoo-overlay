# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="HHVM, fast PHP JIT runtime"
HOMEPAGE="https://github.com/facebook/hiphop-php"
SRC_URI="https://github.com/facebook/hiphop-php/archive/HPHP-${PV}.tar.gz"

LICENSE="PHP-3.01"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

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
<=dev-libs/libmemcached-1.0.9
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

S="${WORKDIR}/hiphop-php-HPHP-${PV}"

src_prepare() {
  epatch "${FILESDIR}"/libdwarf_location.patch
}

src_configure() {
  export HPHP_HOME=$(pwd)

  mkdir customs

  export CMAKE_PREFIX_PATH=$(pwd)
  export LIBRARY_PATH="/usr/include/libdwarf/"

  cd customs
  git clone git://github.com/libevent/libevent.git
  cd libevent
  git checkout release-1.4.14b-stable
  cat ../../hphp/third_party/libevent-1.4.14.fb-changes.diff | patch -p1
  ./autogen.sh
  ./configure --prefix=$CMAKE_PREFIX_PATH
  make
  make install
  cd ../..

  cmake .
}

src_install() {
  die;
}
