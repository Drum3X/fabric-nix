{
  pkgs ? import <nixpgs> { },
}:
pkgs.mkShell {
  name = "fabric-shell";
  packages = with pkgs; [
    ruff # Linter

    # Dependencies
    gtk3
    gtk-layer-shell
    cairo
    gobject-introspection
    libdbusmenu-gtk3
    gdk-pixbuf
    gnome.gnome-bluetooth
    cinnamon.cinnamon-desktop
    (python313.withPackages (
      ps: with ps; [
        setuptools
        wheel
        build
        click
        pycairo
        pygobject3
        pygobject-stubs
        loguru
        psutil
        python-fabric
      ]
    ))
  ];
}
