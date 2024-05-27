Name:       kowalski7cc-profile-picture
Version:    %{version}
Release:    1
Summary:    Kowalski Dragon user profile picture
License:    CC-BY-SA-4.0
BuildArch:  noarch
Source0:    kowalski7cc-profile-picture.tar.xz

%description
Kowalski Dragon user profile picture

%prep
%setup -q -c -n %{name}-%{version}

%install
%make_install

%files
/usr/share/pixmaps/faces/kowalski-dragon.png

%changelog
%autochangelog
