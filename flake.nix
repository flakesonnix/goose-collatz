{
  description = "Collatz Conjecture in Goose";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    goose.url = "github:aardappel/goose";
    goose.flake = false;
  };

  outputs = { self, nixpkgs, goose }@inputs: let
    pkgs = import nixpkgs { system = "x86_64-linux"; };
  in {
    checks."x86_64-linux".default = pkgs.runCommand "goose-collatz" {
      src = ./.;
      buildInputs = [ pkgs.cmake pkgs.gcc ];
    } ''
      export HOME=$(mktemp -d)
      cp -r $src/* .
      cmake -B build -S ${goose}
      cmake --build build -j
      ./build/goose build collatz.goose
      ./build/goose build test_collatz.goose
      mkdir -p $out/bin
      cp collatz $out/bin/
      cp test_collatz $out/bin/
      ./collatz
      ./test_collatz
    '';

    packages.x86_64-linux.default = pkgs.runCommand "goose-collatz-bin" {
      src = ./.;
      buildInputs = [ pkgs.cmake pkgs.gcc ];
    } ''
      export HOME=$(mktemp -d)
      cp -r $src/* .
      cmake -B build -S ${goose}
      cmake --build build -j
      ./build/goose build collatz.goose
      ./build/goose build test_collatz.goose
      mkdir -p $out/bin
      cp collatz $out/bin/
      cp test_collatz $out/bin/
    '';
  };
}
