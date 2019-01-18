# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit perl-module

DESCRIPTION="A BibTeX replacement for users of biblatex"
HOMEPAGE="http://biblatex-biber.sourceforge.net/ https://github.com/plk/biber/"
SRC_URI="https://github.com/plk/biber/archive/v${PV}.tar.gz  -> ${P}.tar.gz"

LICENSE="|| ( Artistic-2 GPL-1 GPL-2 GPL-3 )"
SLOT="0"
KEYWORDS="amd64"
IUSE="doc test"

RDEPEND=">=dev-lang/perl-5.16
	dev-perl/autovivification
	dev-perl/Business-ISBN
	dev-perl/Business-ISMN
	dev-perl/Business-ISSN
	dev-perl/Class-Accessor
	dev-perl/Data-Compare
	dev-perl/Data-Dump
	dev-perl/Data-Uniqid
	dev-perl/Date-Simple
	dev-perl/Encode-EUCJPASCII
	dev-perl/Encode-HanExtra
	dev-perl/Encode-JIS2K
	dev-perl/File-Slurp-Unicode
	dev-perl/IPC-Run3
	dev-perl/libwww-perl[ssl]
	>=dev-perl/Lingua-Translit-0.25
	dev-perl/List-AllUtils
	>=dev-perl/List-MoreUtils-0.408.0
	dev-perl/Log-Log4perl
	dev-perl/LWP-Protocol-https
	dev-perl/Regexp-Common
	dev-perl/Readonly
	dev-perl/Readonly-XS
	dev-perl/Text-Roman
	>=dev-perl/Text-BibTeX-0.720.0
	dev-perl/URI
	dev-perl/Unicode-LineBreak
	>=virtual/perl-Unicode-Normalize-1.230.0
	dev-perl/XML-LibXML
	dev-perl/XML-LibXML-Simple
	dev-perl/XML-LibXSLT
	dev-perl/XML-SAX-Base
	dev-perl/XML-Writer
	~dev-tex/biblatex-3.4
	virtual/perl-IPC-Cmd
	>=virtual/perl-Unicode-Collate-1.140.0"
DEPEND="${RDEPEND}
	dev-perl/Config-AutoConf
	dev-perl/Module-Build
	test? ( dev-perl/File-Which
			dev-perl/Test-Differences
			dev-perl/Test-Pod
			dev-perl/Test-Pod-Coverage
			~virtual/perl-Unicode-Collate-1.140.0 )"

SRC_TEST="parallel"

PATCHES=(
	"${FILESDIR}"/${PN}-2.4-drop-mozilla-ca.patch
	"${FILESDIR}"/${PN}-2.5-unescaped-left-brace-in-regex.patch
	)

src_install(){
	perl-module_src_install
	use doc && dodoc -r doc
}

src_test() {
	BIBER_SKIP_DEV_TESTS=1 perl-module_src_test
}