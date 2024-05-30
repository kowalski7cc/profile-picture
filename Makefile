BASE = kowalski7cc-profile-picture
NAME = ${BASE}-${VERSION}

TAR = tar --exclude=.git --exclude=.gitkeep --exclude=dist --exclude=debian/.debhelper --exclude=debian/debhelper-build-stamp --exclude=debian/kowalski7cc-profile-picture.substvars --exclude=debian/files --exclude=debian/kowalski7cc-profile-picture --exclude=*.tar.xz --exclude=src/faces -hcvzf
DIST = dist/${NAME}.tar.xz


.EXPORT_ALL_VARIABLES:
_DH_OPTIONS = "--destdir=${PWD}"

all:
	convert -quality 100 -resize 512 src/kowalski7cc.png src/faces/kowalski7cc.jpg

dist:
	@mkdir -p dist
	@${TAR} ${DIST} .

install:
	@mkdir -p ${DESTDIR}/usr/share/pixmaps/faces/
	@install -m 644 -t ${DESTDIR}/usr/share/pixmaps/faces/ src/faces/*.jpg

rpm:
	@mkdir -p dist
	@rpmbuild -bb --build-in-place -D "_rpmdir ${PWD}/dist" -D "version ${VERSION}" ${BASE}.spec

deb: 
	@mkdir -p dist
	@dpkg-buildpackage -us -uc -b

clean:
	@rm -rf dist
