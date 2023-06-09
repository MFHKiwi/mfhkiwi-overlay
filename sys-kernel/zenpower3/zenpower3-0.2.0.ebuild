
EAPI=7

inherit linux-mod toolchain-funcs

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
MODULE_NAMES="zenpower(hwmon:)"
BUILD_TARGETS="all"
S="${WORKDIR}/zenpower3"
BUILD_PARAMS="CC=$(tc-getCC) LD=$(tc-getLD) NM=$(tc-getNM) AR=$(tc-getAR)"

pkg_setup() {
	linux-mod_pkg_setup
}
