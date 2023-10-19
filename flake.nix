{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
  };

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      lib = pkgs.lib;
      kernels = import ./kernels.nix { inherit pkgs; };
    in
    {
      kernels = kernels;
      kernelFarm = pkgs.linkFarmFromDrvs "kernelfarm" kernels;
    };
}
