# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="Provision is an extension to drush that helps to quickly provision
Drupal sites. It forms the backend part of aegir."
HOMEPAGE="http://community.aegirproject.org"
SRC_URI="http://ftp.drupal.org/files/projects/${PN}-7.x-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="apache24 hhvm"

DEPEND="app-admin/drush"
RDEPEND="${DEPEND}"
S="${WORKDIR}/${PN}"

src_prepare() {
	if use apache24 ; then
		epatch ${FILESDIR}/apache24_server_tpl_php.patch
		epatch ${FILESDIR}/apache24_platform_tpl_php.patch
	fi
	if use apache24 ; then
	    echo "Supposed to patch for HHVM vhost files here"
		die
	fi
}

src_install() {
	insinto /usr/share/drush/commands/provision

	doins -r Provision db Symfony http dns platform

	for i in context.inc inc service.inc api.php info drush.inc file.inc; do
		doins provision.${i}
	done

	doins LICENSE.txt install.hostmaster.inc README.txt uninstall.hostmaster.inc subdirs migrate.hostmaster.inc parse.backend.inc aegir.make

	# Ignored files: 
	# HACKING_2x.mdwn debian example.sudoers upgrade.sh.txt release.sh provision-tests example.drushrc.php

	# use examples && cp -R examples "${D}"/usr/share/doc/"${PF}"
}

