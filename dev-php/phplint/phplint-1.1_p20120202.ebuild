# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="http://www.icosaedro.it/${PN}/${PN}-pure-c-${PV/p/}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/boehm-gc"
RDEPEND="${DEPEND}"

S="${WORKDIR}/phplint-pure-c-${PV/p/}"

src_install() {
	exeinto /usr/bin
	doexe phpl
}
