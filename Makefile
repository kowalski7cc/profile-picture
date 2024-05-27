VERSION := 2.0.0
BASE = kowalski7cc-profile-picture
NAME = ${BASE}-${VERSION}

TAR = tar --exclude=.git --exclude=.gitkeep --exclude=dist --exclude=*.tar.xz -hcvzf
DIST = dist/${NAME}.tar.xz


.EXPORT_ALL_VARIABLES:
_DH_OPTIONS = "--destdir=${PWD}"

dist:
	@mkdir -p dist
	@${TAR} ${DIST} .

install:
	@mkdir -p ${DESTDIR}/usr/share/pixmaps/faces/
	@install -m 644 -t ${DESTDIR}/usr/share/pixmaps/faces/ src/faces/*.png

rpm:
	@mkdir -p dist
	@rpmbuild -bb --build-in-place -D "_rpmdir ${PWD}/dist" -D "version ${VERSION}" ${BASE}.spec

deb: 
	@mkdir -p dist
	@dpkg-buildpackage -us -uc -b

clean:
	@rm -rf dist
