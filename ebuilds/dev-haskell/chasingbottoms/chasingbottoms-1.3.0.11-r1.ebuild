# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

# ebuild generated by hackport 0.4.4.9999
#hackport: flags: -build-tests

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

MY_PN="ChasingBottoms"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="For testing partial and infinite values"
HOMEPAGE="http://hackage.haskell.org/package/ChasingBottoms"
SRC_URI="mirror://hackage/packages/archive/${MY_PN}/${PV}/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="amd64 x86"
IUSE=""

RESTRICT=test # takes a lot

RDEPEND=">=dev-haskell/mtl-1.1:=[profile?] <dev-haskell/mtl-2.3:=[profile?]
	>=dev-haskell/quickcheck-2.1:2=[profile?]
	>=dev-haskell/random-1.0:=[profile?] <dev-haskell/random-1.2:=[profile?]
	>=dev-haskell/syb-0.1.0.2:=[profile?] <dev-haskell/syb-0.5:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.9.2
"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	cabal_chdeps \
		'QuickCheck >= 2.1 && < 2.8' 'QuickCheck >= 2.1'
}

src_configure() {
	haskell-cabal_src_configure \
		--flag=-build-tests
}
