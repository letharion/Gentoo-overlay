# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_PHP="php7-2 php7-3 php7-4"
PHP_EXT_NAME="ast"
#PHP_EXT_INIT="yes"
#PHP_EXT_ZENDEXT="no"
#DOCS="CREDITS"

inherit php-ext-pecl-r3

KEYWORDS="~amd64"

DESCRIPTION="Extension exposing PHP 7 abstract syntax tree"
LICENSE="BSD"
SLOT="7"
IUSE=""

DEPEND="dev-lang/php"
RDEPEND="${DEPEND}"
