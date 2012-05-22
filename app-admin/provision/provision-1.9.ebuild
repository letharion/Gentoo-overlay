# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils

DESCRIPTION="Provision is an extension to drush that helps to quickly provision
Drupal sites. It forms the backend part of aegir."
HOMEPAGE="http://community.aegirproject.org"
SRC_URI="http://ftp.drupal.org/files/projects/${PN}-6.x-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="apache24"

DEPEND="app-admin/drush"
RDEPEND="${DEPEND}"
S="${WORKDIR}/${PN}"

src_prepare() {
	if use apache24 ; then
		epatch ${FILESDIR}/apache24_server_tpl_php.patch
	fi
}

src_install() {
	insinto /usr/share/drush/commands/provision

	doins -r db dns platform http

	for i in .context.site.inc .info .file.inc .context.platform.inc .api.php .config.inc .context.inc .service.inc .inc .drush.inc .context.server.inc _drushrc_alias.tpl.php _drushrc.tpl.php _drushrc_site.tpl.php; do
		doins provision${i}
	done

	doins aegir.make README.txt LICENSE.txt migrate.hostmaster.inc install.hostmaster.inc data_store.tpl.php

	# Ignored files: example.sudoers example example.drushrc.php tests parse.backend.inc upgrade.sh.txt release.sh
	# use examples && cp -R examples "${D}"/usr/share/doc/"${PF}"
}



