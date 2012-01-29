# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit games

DESCRIPTION="Dwar fortress is an ascii-drawn strategy game where you control the lives of a group of dwarves."
HOMEPAGE="http://www.bay12games.com/dwarves/"
SRC_URI="http://www.bay12games.com/dwarves/df_31_25_linux.tar.bz2"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	cd df_linux
	dodoc README.linux "command line.txt" readme.txt "release notes.txt" || die

	insinto /usr/share/games/dwarffortress
	doins -r data g_src libs raw sdl || die
	# Avoid collision with the df tool

	exeinto /usr/games/bin
	mv df dwarffortress || die
	doexe dwarffortress || die
}
