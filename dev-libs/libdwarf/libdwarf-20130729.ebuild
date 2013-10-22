# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit flag-o-matic

DESCRIPTION="Library to deal with DWARF Debugging Information Format"
HOMEPAGE="http://reality.sgiweb.org/davea/dwarf.html"
SRC_URI="http://reality.sgiweb.org/davea/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/elfutils"
RDEPEND="${DEPEND}"

S=${WORKDIR}/dwarf-${PV}/${PN}

pkg_pretend() {
	ewarn "At the time of writing, the website for downloading libdwarf sources"
	ewarn "appear to be down. This overlay contains a 'scripts' directory. If necessary, run"
	ewarn "scripts/libdwarf.sh ${PV}-b ${PV}"
	ewarn "to generate a new libdwarf distributable file from git."
}

src_prepare() {
	append-cflags -fPIC || die
}

src_configure() {
	econf --enable-shared
}

src_install() {
	dolib.a libdwarf.a || die
	dolib.so libdwarf.so || die

	insinto /usr/include/libdwarf
	doins dwarf.h libdwarf.h || die

	dodoc NEWS README CHANGES || die
}
