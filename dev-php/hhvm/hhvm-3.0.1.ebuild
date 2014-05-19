# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils cmake-utils
if [ ${PV} = "9999" ]; then
	inherit git-2
fi

DESCRIPTION="HHVM, fast PHP JIT runtime"
HOMEPAGE="https://github.com/facebook/hhvm"
if [ ${PV} = "9999" ]; then
	EGIT_REPO_URI="https://github.com/facebook/hhvm.git"
	EGIT_HAS_SUBMODULES="true"
else
	SRC_URI="https://codeload.github.com/facebook/${PN}/tar.gz/HHVM-${PV} -> ${P}.tar.gz"
fi

LICENSE="PHP-3.01"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug imagemagick"

DEPEND="app-arch/bzip2
dev-cpp/glog
dev-cpp/tbb
virtual/mysql
>=dev-libs/boost-1.49
dev-libs/cloog-ppl
dev-libs/elfutils
dev-libs/icu
dev-libs/jemalloc[stats]
dev-libs/libdwarf
dev-libs/libmcrypt
dev-libs/libmemcached
dev-libs/libpcre
dev-libs/libxml2
dev-libs/oniguruma
dev-libs/openssl
dev-util/google-perftools
imagemagick? ( media-gfx/imagemagick )
media-libs/gd[jpeg,png]
net-libs/c-client[kerberos]
net-nds/openldap
sys-devel/gcc[cxx]
sys-devel/binutils
sys-libs/libcap
sys-libs/libunwind
sys-libs/ncurses
sys-libs/readline
sys-libs/zlib"

RDEPEND="${DEPEND}"
CMAKE_IN_SOURCE_BUILD="true"

if [ ${PV} = "9999" ]; then
	S="${WORKDIR}/hhvm-${PV}"
else
	S="${WORKDIR}/hhvm-HHVM-${PV}"
fi

src_prepare() {
	epatch "${FILESDIR}"/libdwarf_location.patch
}

src_configure() {
	export HPHP_HOME=$(pwd)
	export CMAKE_PREFIX_PATH=$(pwd)
	export LIBRARY_PATH="/usr/include/libdwarf/"

	if [ ! ${PV} = "9999" ]; then
		# Get folly. Move folly to a separate package later.
		cd hphp/submodules || die
		git clone https://github.com/facebook/folly.git || die
		cd folly || die
		git checkout d9c79af || die
		cd ../../.. || die
	fi

	CMAKE_BUILD_TYPE="Release"
	if use debug; then
		CMAKE_BUILD_TYPE="Debug"
	fi

	cmake-utils_src_configure
}

src_install() {
	dobin hphp/hhvm/hhvm
}
