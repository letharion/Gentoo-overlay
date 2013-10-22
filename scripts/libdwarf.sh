#!/bin/bash
cd /tmp
git clone git://git.code.sf.net/p/libdwarf/code libdwarf-code
cd libdwarf-code
git checkout ${1}
sed -i 's/hm=\/home\/davea\/web4\/gweb\/pagedata/hm=$(pwd)/' BLDLIBDWARFTAR
./BLDLIBDWARFTAR ${2}
cp /var/tmp/libdwarf-${2}.tar.gz /usr/portage/distfiles
