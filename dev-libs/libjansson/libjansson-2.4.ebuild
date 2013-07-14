EAPI="5"

DESCRIPTION="Jansson is a C library for encoding, decoding and manipulating JSON data."
HOMEPAGE="http://www.digip.org/jansson"
SRC_URI="http://www.digip.org/jansson/releases/jansson-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}/jansson-${PV}

src_install() {
    local lib_dir=src/.libs/

	dolib.a ${lib_dir}libjansson.a
	dolib.so ${lib_dir}libjansson.so*

	#insinto /usr/include
	#doins dwarf.h libdwarf.h
}
