# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-admin/drush/drush-4.4.ebuild,v 1.1 2011/05/26 22:22:01 ramereth Exp $

EAPI=5

DESCRIPTION="Drush is a command line shell and scripting interface for Drupal"
HOMEPAGE="http://drupal.org/project/drush"
SRC_URI="https://github.com/${PN}-ops/${PN}/archive/${PV}.tar.gz"
#SRC_URI="http://ftp.drupal.org/files/projects/${PN}-7.x-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DEPEND="dev-lang/php[cli,simplexml]
	>=dev-php/PEAR-Console_Table-1.1.3"
RDEPEND="${DEPEND}"

src_install() {
	local docs="README.md docs"

	insinto /usr/share/drush
	doins -r .
	exeinto /usr/share/drush
	doexe drush
	dosym /usr/share/drush/drush /usr/bin/drush
	dodoc -r ${docs}
	# cleanup
	for i in ${docs} LICENSE.txt drush.bat examples includes/.gitignore ; do
		rm -rf "${D}/usr/share/drush/${i}"
	done

	use examples && cp -R examples "${D}"/usr/share/doc/"${PF}"
}
