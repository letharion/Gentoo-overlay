# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Composer is a PHP package manager"
HOMEPAGE="http://getcomposer.org"
SRC_URI="http://getcomposer.org/download/${PV/_/-}/${PN}.phar"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	# Satisfy portage.
	mkdir ${P}
}

src_prepare() {
	cp "../../distdir/composer.phar" composer
}

src_install() {
	dobin composer
}
