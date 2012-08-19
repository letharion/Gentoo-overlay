# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Meta package providing dependencies for a Drupal dev environment"
HOMEPAGE="N/A"
#SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-admin/drush
dev-db/mysql
dev-lang/php[apache2]
|| (
	net-proxy/squid
	>=app-admin/drush-5
)
www-servers/varnish
dev-php/pecl-uploadprogress
dev-util/drupalcs"

RDEPEND="${DEPEND}"
