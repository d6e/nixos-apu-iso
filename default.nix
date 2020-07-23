let pkgs = import <nixpkgs> {};
in pkgs.callPackage "${<nixpkgs>}/nixos/default.nix" {}
