{
  description = "Run/Build Fabric with Nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/24.11";
    utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs, utils, ... }:
    utils.lib.eachDefaultSystem (
      system:
      let
        overlay = import ./overlay.nix;
        pkgs = nixpkgs.legacyPackages.${system}.extend overlay;
      in
      {
        formatter = pkgs.nixfmt-rfc-style;
        packages.default = pkgs.python3Packages.python-fabric;
        devShells.default = pkgs.callPackage ./shell.nix { };
        overlays.default = overlay;
      }
    );
}
