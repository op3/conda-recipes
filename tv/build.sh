[ -d "${PREFIX}/usr/share/X11/app-defaults" ] || install -d "${PREFIX}/share/X11/app-defaults"
./configure --prefix="" --with-appdefaultdir="${PREFIX}/share/X11/app-defaults"
make DESTDIR=${PREFIX} install
