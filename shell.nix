let
  pkgs = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
  }) {
    config = {
      allowUnfree = true;
    };
  };
in

pkgs.mkShell {
  nativeBuildInputs = with pkgs.buildPackages; [
    docker
    docker-compose
    fzf
    python3
    python312Packages.psycopg
    virtualenv
    zed-editor
  ];
}
