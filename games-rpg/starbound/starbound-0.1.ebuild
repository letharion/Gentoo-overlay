# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit games

DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="media-libs/libpng:1.2
x11-libs/tslib
media-libs/libcaca"
RDEPEND="${DEPEND}"

src_unpack() {
  mkdir -p ${S}
}

src_install() {
  echo -n ""
}
