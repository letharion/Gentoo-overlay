# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit flag-o-matic

DESCRIPTION="Library to deal with DWARF Debugging Information Format"
HOMEPAGE="http://reality.sgiweb.org/davea/dwarf.html"
SRC_URI="https://dl.dropboxusercontent.com/s/2b684dqdki1ivc4/libdwarf-20130207.tar.gz?token_hash=AAHzVMIuAoTCLKqa845gbqCpFHu9cEvZtsgsJV3xQZal7Q&dl=1 -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/elfutils"
RDEPEND="${DEPEND}"

S=${WORKDIR}/dwarf-${PV}/${PN}

pkg_pretend() {
	ewarn "At the time of writing, the website for downloading libdwarf sources"
	ewarn "appear to be down. This ebuild currently points to my private"
	ewarn "dropbox account"
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
