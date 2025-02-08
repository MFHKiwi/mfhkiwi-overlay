
EAPI=8

inherit linux-info linux-mod-r1

case ${PV} in
9999)
	inherit git-r3
	EGIT_REPO_URI="https://git.exozy.me/a/zenpower3"
	;;
*)
	KEYWORDS="~amd64 ~x86"
	SRC_URI="https://git.exozy.me/a/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	;;
esac

DESCRIPTION="A Linux kernel driver for reading temperature, voltage(SVI2), current(SVI2) and power(SVI2) for AMD Zen family CPUs."
HOMEPAGE="https://git.exozy.me/a/zenpower3"

LICENSE="GPL-2"
SLOT="0"

CONFIG_CHECK="HWMON PCI AMD_NB"
S="${WORKDIR}/zenpower3"

pkg_setup() {
	linux-mod-r1_pkg_setup
}

src_compile() {
	local modlist=( zenpower=hwmon )
	local modargs=( KERN_DIR="${KV_OUT_DIR}" KERN_VER="${KV_FULL}" TARGET="${KV_FULL}" )
	linux-mod-r1_src_compile
}

