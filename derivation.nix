{
  lib,
  fetchFromGitHub,
  python3Packages,
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

python3Packages.buildPythonPackage {
  pname = "python-fabric";
  version = "0.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Fabric-Development";
    repo = "fabric";
    rev = "1134b7f96ecc54d2626788ad59b4717ed86e5cf4";
    sha256 = "sha256-t+tb+0isS/AloTd+HUkCvfpNXOl6RkkenIPxMsk++LA=";
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

  dependencies = with python3Packages; [
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
