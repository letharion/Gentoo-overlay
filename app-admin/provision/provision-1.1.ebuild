# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Provision is an extension to drush that helps to quickly provision
Drupal sites. It forms the backend part of aegir."
HOMEPAGE="http://community.aegirproject.org"
SRC_URI="http://ftp.drupal.org/files/projects/provision-6.x-1.1.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-admin/drush"
RDEPEND="${DEPEND}"
S="${WORKDIR}/${PN}"

src_install() {
#./aegir.make
#./data_store.tpl.php
#./example
#./example.drushrc.php
#./example.sudoers
#./install.hostmaster.inc
#./migrate.hostmaster.inc
#./parse.backend.inc

	doins -r db dns platform http
	insinto /usr/share/drush/commands/provision

	for i in .api.php .config.inc .context.inc .context.platform.inc \
	.context.server.inc .context.site.inc .drush.inc .file.inc .inc .info \
	.service.inc _drushrc.tpl.php _drushrc_site.tpl.php _drushrc_alias.tpl.php ; do
		doins provision${i}
	done

#release.sh
#./upgrade.sh.txt

#	insinto /usr/share/drush
#	doins -r .
#	exeinto /usr/share/drush
#	doexe drush
#	dosym /usr/share/drush/drush /usr/bin/drush
#	dodoc -r ${docs}
	# cleanup
#	for i in ${docs} LICENSE.txt drush.bat examples includes/.gitignore ; do
#		rm -rf "${D}/usr/share/drush/${i}"
#	done

#	use examples && cp -R examples "${D}"/usr/share/doc/"${PF}"
}
