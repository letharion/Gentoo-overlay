# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="http://ftp.drupal.org/files/projects/drupalcs-7.x-${PV/_/-}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-php/PEAR-PHP_CodeSniffer"
RDEPEND="${DEPEND}"

S=/var/tmp/portage/dev-util/drupalcs-7.0/work/drupalcs

src_install() {
	insinto /usr/share/php/PHP/CodeSniffer/Standards/
	doins -r Drupal
}
