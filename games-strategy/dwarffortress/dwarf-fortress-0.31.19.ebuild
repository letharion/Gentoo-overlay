# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit games

DESCRIPTION="Dwarf Fortress is a single player fantasy game in ascii graphics"
HOMEPAGE="http://www.bay12games.com/dwarves/"

VERSION=${PV/0./}
VERSION=${VERSION//./_}
SRC_URI="http://www.bay12games.com/dwarves/df_${VERSION}_linux.tar.bz2"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-emulation/emul-linux-x86-sdl"
RDEPEND="${DEPEND}"

S=${WORKDIR}/df_linux

src_install() {
	INSTPATH=/opt/games/dwarffortress
	ls
	insinto $INSTPATH
	exeinto $INSTPATH

	#Ugly hack. The df script should just be replaced with a new one, but how?
	sed -i '/^DF_DIR=/d' df
	sed -i 's/cd "\${DF_DIR}/cd "\/opt\/games\/dwarffortress\//' df

	dodoc README.linux readme.txt "release notes.txt" "file changes.txt" "command line.txt" || die

	doins -r data raw sdl || die
	#DF won't start without 666 rw to data/index
	chmod 666 data/index || die

	doexe df || die

	insinto $INSTPATH/libs
	exeinto $INSTPATH/libs

	#Could the first and last be replaced by system files?
	#libgraphics seems to be on github? And/or is that the g_src dir?
	doins "libs/libgcc_s.so.1" "libs/libgraphics.so" "libs/libstdc++.so.6" || die

	doexe libs/Dwarf_Fortress || die

	dosym $INSTPATH/df /usr/bin/dwarffortress || die

	#Should depend on specific verion of emul-linux-x86-sdl or libsdl?
	dosym /usr/lib32/libSDL.so $INSTPATH/libs/libSDL-1.2.so.0 || die

	#Ensure no writing of logdata to /opt
	dosym /var/log/dwarffortress.log $INSTPATH/gamelog.txt

	#chgrp -R games $INSTPATH
}
