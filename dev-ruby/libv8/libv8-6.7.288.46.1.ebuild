# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

USE_RUBY="ruby23 ruby24 ruby25"

inherit ruby-fakegem

DESCRIPTION="Distributes the V8 JavaScript engine in binary and source forms"
HOMEPAGE="http://github.com/cowboyd/libv8"
SRC_URI="mirror://rubygems/${P}.gem"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND+="sys-libs/ncurses:5"

each_ruby_configure() {
	${RUBY} -C ext/libv8 extconf.rb || die "extconf failed"
}

each_ruby_compile() {
	einfo "COMPILING"
	emake V=1 -C ext/libv8
#	cp ext/libv8/libv8$(get_modname) lib/libv8 || die "cp failed"
}