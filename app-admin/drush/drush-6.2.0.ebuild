# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-admin/drush/drush-5.8.ebuild,v 1.3 2013/03/25 20:52:50 ago Exp $

EAPI="5"

inherit bash-completion-r1

DESCRIPTION="Drush is a command line shell and scripting interface for Drupal"
HOMEPAGE="http://pear.drush.org/"
SRC_URI="https://github.com/drush-ops/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+examples"

DEPEND="dev-lang/php[cli,simplexml]
	dev-php/PEAR-Console_Table
	dev-php/PEAR-Console_Getopt"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e \
		"s!/share/doc/drush!/share/doc/${PF}!" \
		-e "s!README\.txt!\0.bz2!g" \
		includes/bootstrap.inc || die
	sed -i \
		-e "s!\.php'!.php.bz2'!" \
		-e "s!\.ini'!.ini.bz2'!" \
		-e "s!\.txt'!.txt.bz2'!" \
		-e "s!\.bashrc'!.bashrc.bz2'!" \
		commands/core/docs.drush.inc || die
	sed \
		-e "1,2d" \
		-e "5,11d" \
		drush.complete.sh > drush.bashcomp
}

src_install() {
	local docs="README.md docs"
	use examples && docs="${docs} examples"
	insinto /usr/share/drush
	doins -r .
	exeinto /usr/share/drush
	doexe drush
	dosym /usr/share/drush/drush /usr/bin/drush
	dodoc -r ${docs}
	# cleanup
	for i in ${docs} LICENSE.txt drush.bat examples includes/.gitignore \
		.gitignore .travis.yml drush.complete.sh ; do
		rm -rf "${D}/usr/share/drush/${i}"
	done
	keepdir /etc/drush
	newbashcomp drush.bashcomp drush
}
