# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

DESCRIPTION="Drush make is an extension to drush that can create a ready-to-use
drupal site from various sources."
HOMEPAGE="http://drupal.org/project/drush_make"
SRC_URI="http://ftp.drupal.org/files/projects/drush_make-${PV:0:1}.x-${PV:2:3}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="peytz"

# Drush make is a part of Drush 5
DEPEND="<app-admin/drush-5"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}"

src_install() {
	if use peytz; then
		epatch "${FILESDIR}"/peytz_drush_make-6.x-2.3.patch
		elog "Installing peytz patched version of drush make"
	fi

	epatch "${FILESDIR}"/adapt-to-release-history-xml.patch

	insinto /usr/share/drush/commands/make
	doins -r contrib

	# Do we have a way of actually executing these tests?
	#if use test; then
	#  doins -r test
	#fi

	doins drush_make.drush.inc drush_make.project.inc drush_make.utilities.inc INSTALL.txt README.txt drush_make.download.inc drush_make.generate.inc drush_make.test.inc
}
