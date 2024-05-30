Name:       kowalski7cc-profile-picture
Version:    2.1.0
Release:    1
Summary:    Kowalski Dragon user profile picture
License:    CC-BY-SA-4.0
BuildArch:  noarch
Source0:    kowalski7cc-profile-picture.tar.xz

%description
Kowalski Dragon user profile picture

%prep
%setup -q -c -n %{name}-%{version}

%build
%make_build

%install
%make_install

%files
%license COPYING Attribution
%dir %{_datadir}/pixmaps/faces
%{_datadir}/pixmaps/faces/kowalski-dragon.png

%changelog
%autochangelog
