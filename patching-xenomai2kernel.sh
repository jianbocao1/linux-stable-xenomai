# $git clone https://github.com/finomeng/xenomai-mirror.git /tmp/xenomai-mirror.next-5.4
# $cd /tmp/xenomai-mirror.next-5.4
# $git checkout -t origin/wip/next-5.4-porting


dir_xenomai="/tmp/xenomai-mirror.next-5.4"
#dir_linux="/x/linux/ws.linux-stable-xenomai/5.4.59"
dir_linux=$(pwd)
ARCH=x86

${dir_xenomai}/scripts/prepare-kernel.sh \
	--linux=${dir_linux} --arch=$ARCH \
	--outpatch=${dir_xenomai}/xenomai-kernel.patch

patch -d ${dir_linux} -p1 -i ${dir_xenomai}/xenomai-kernel.patch

# to clean up patched but not commited file (in kernel dir):
# $git checkout .
# $git clean -df

# build xenomai userspace libs after git clone:
# $cd /tmp/xenomai-mirror
# $./scripts/bootstrap

# $./configure --prefix=/opt/xenomai-next --with-core=cobalt  --enable-smp  --enable-pshared
# $make -j4
# #sudo make install

# copy the xenomai userspace libs to test device (assume allowed root login via ssh)
# scp -r /opt/xenomai-next root@ip-or-hostname:/opt
