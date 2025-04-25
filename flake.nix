{
  description = "Dev Central; NUR, scripts and development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in {
        devShells.lua = let
          lua = pkgs.lua5_4.withPackages (ps: with ps; [ lua-curl lua-cjson ]);
        in pkgs.mkShell { buildInputs = [ lua ]; };
      });
}
