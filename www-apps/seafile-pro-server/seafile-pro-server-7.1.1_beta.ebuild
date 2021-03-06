# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6,7} )
inherit python-single-r1

DESCRIPTION="Meta package for Seafile Pro Edition, file sync share solution"
HOMEPAGE="https://github.com/haiwen/seafile-server/ http://www.seafile.com/"

LICENSE="GPL-2+-with-openssl-exception"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="fuse mysql psd"

#https://download.seafile.com/published/seafile-manual/upgrade/upgrade_notes_for_7.1.x.md
RDEPEND="${PYTHON_DEPS}
	$(python_gen_cond_dep '
	dev-python/pillow[${PYTHON_MULTI_USEDEP}]
	dev-python/pylibmc[${PYTHON_MULTI_USEDEP}]
	dev-python/django-simple-captcha[${PYTHON_MULTI_USEDEP}]
	dev-python/captcha[${PYTHON_MULTI_USEDEP}]
	dev-python/jinja[${PYTHON_MULTI_USEDEP}]
	dev-python/sqlalchemy[${PYTHON_MULTI_USEDEP}]
	psd? ( dev-python/psd-tools )
	dev-python/django-pylibmc[${PYTHON_MULTI_USEDEP}]
	dev-python/ldap3[${PYTHON_MULTI_USEDEP}]
	')

	fuse? ( sys-fs/fuse:* )
	mysql? ( || ( dev-python/mysqlclient dev-python/mysql-python ) )
	sys-libs/libselinux
	dev-libs/nss
	virtual/jre:*"

DEPEND="${RDEPEND}"
