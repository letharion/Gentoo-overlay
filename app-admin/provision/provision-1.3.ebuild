# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Provision is an extension to drush that helps to quickly provision
Drupal sites. It forms the backend part of aegir."
HOMEPAGE="http://community.aegirproject.org"
SRC_URI="http://ftp.drupal.org/files/projects/${PN}-6.x-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-admin/drush"
RDEPEND="${DEPEND}"
S="${WORKDIR}/${PN}"

src_install() {

	#We ignore some stuff
	# example
	# example.drushrc.php
	# example.sudoers
	# README.txt
	# LICENSE.txt

	insinto /usr/share/drush/commands/provision

	doins -r db dns platform http

	for i in .context.platform.inc .context.server.inc .api.php \
_drushrc.tpl.php .inc _drushrc_alias.tpl.php .info .service.inc \
_drushrc_site.tpl.php .context.inc .context.site.inc .file.inc \
.config.inc .drush.inc; do
		doins provision${i}
	done
	doins migrate.hostmaster.inc data_store.tpl.php release.sh upgrade.sh.txt \
parse.backend.inc aegir.make install.hostmaster.inc

#	use examples && cp -R examples "${D}"/usr/share/doc/"${PF}"
}

