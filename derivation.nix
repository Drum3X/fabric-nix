{
  lib,
  fetchFromGitHub,
  python312Packages,
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

python312Packages.buildPythonPackage {
  pname = "python-fabric";
  version = "0.0.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Fabric-Development";
    repo = "fabric";
    rev = "b40263bd15db9a7ad7fe7c764dd409aaa615622b";
    sha256 = "sha256-8HrzieeOj9dmRNXXV1AA6jV7COVYPnD7dK9npPxtER4=";
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

  dependencies = with python312Packages; [
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
