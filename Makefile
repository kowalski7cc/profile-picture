BASE = kowalski7cc-profile-picture
NAME = ${BASE}-${VERSION}
VERSION = 2.2.0-1
TAR = tar --exclude-vcs --exclude-vcs-ignores --exclude-backups -hcvzf
DIST = dist/${NAME}-${VERSION}.tar.xz


.EXPORT_ALL_VARIABLES:
_DH_OPTIONS = "--destdir=${PWD}"

all:
	@mkdir -p src/faces
	convert -quality 100 -resize 512 src/kowalski7cc.png src/faces/kowalski7cc.jpg

dist:
	@mkdir -p dist
	@${TAR} ${DIST} . debian/control

install:
	#~ GNOME
	@mkdir -p ${DESTDIR}/usr/share/pixmaps/faces/
	@install -m 644 -t ${DESTDIR}/usr/share/pixmaps/faces/ src/faces/kowalski7cc.jpg

	#~ KDE
	@mkdir -p ${DESTDIR}/usr/share/plasma/avatars/
	@install -m 644 -t ${DESTDIR}/usr/share/plasma/avatars/ src/faces/kowalski7cc.jpg

rpm:
	@mkdir -p dist
	@rpmbuild -bb --build-in-place -D "_rpmdir ${PWD}/dist" ${BASE}.spec

deb: 
	@mkdir -p dist
	@dpkg-buildpackage -A

clean:
	@rm -rf dist

.PHONY: all build install dist clean rpm