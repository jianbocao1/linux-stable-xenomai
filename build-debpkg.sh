# $make mrproper
# $cp config_xenomai.kernel_debug .config
# $make olddefconfig

DEBTYPE=bindeb-pkg
#DEBTYPE=deb-pkg

make $DEBTYPE LOCALVERSION=-next KDEB_PKGVERSION=1 -j16 2>&1 | tee build.log
