# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-admin/drush/drush-4.4.ebuild,v 1.1 2011/05/26 22:22:01 ramereth Exp $

EAPI="5"

inherit bash-completion-r1

DESCRIPTION="Drush is a command line shell and scripting interface for Drupal"
HOMEPAGE="http://drupal.org/project/drush"
SRC_URI="http://ftp.drupal.org/files/projects/${PN}-8.x-${PV/_/-}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+examples"

DEPEND="dev-lang/php[cli,simplexml]
	>=dev-php/PEAR-Console_Table-1.1.3"
RDEPEND="${DEPEND}"
S="${WORKDIR}/${PN}"

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
	local docs="README.txt docs"
	use examples && docs="${docs} examples"

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

	# cleanup
	for i in ${docs} LICENSE.txt drush.bat examples includes/.gitignore \
		.gitignore .travis.yml drush.complete.sh ; do
		rm -rf "${D}/usr/share/drush/${i}"
	done
	keepdir /etc/drush
	newbashcomp drush.bashcomp drush
}
