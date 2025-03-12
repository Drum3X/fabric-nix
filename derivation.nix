{
  lib,
  fetchFromGitHub,
  python313Packages,
  gtk3,
  gtk-layer-shell,
  cairo,
  gobject-introspection,
  libdbusmenu-gtk3,
  gdk-pixbuf,
  cinnamon,
  gnome,
  pkg-config,
  wrapGAppsHook3,
}:

python313Packages.buildPythonPackage {
  pname = "python-fabric";
  version = "0.0.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "drum3x";
    repo = "fabric";
    rev = "ca629ac4030048a9c63c6e780386af9ce42cef4c";
    sha256 = "sha256-foaSZgk9XhaLTgrVIMvxhedYaA6aBlrX8lnUysje1Og=";
  };

  nativeBuildInputs = [
    pkg-config
    wrapGAppsHook3
    gobject-introspection
    cairo
  ];

  propagatedBuildInputs = [
    gtk3
    gtk-layer-shell
    libdbusmenu-gtk3
    cinnamon.cinnamon-desktop
    gnome.gnome-bluetooth
  ];

  dependencies = with python313Packages; [
    setuptools
    click
    pycairo
    pygobject3
    pygobject-stubs
    loguru
    psutil
  ];

  meta = {
    changelog = "";
    description = ''
      next-gen framework for building desktop widgets using Python (check the rewrite branch for progress)
    '';
    homepage = "https://github.com/Fabric-Development/fabric";
    license = lib.licenses.agpl3Only;
    maintainers = with lib.maintainers; [ ];
  };
}
