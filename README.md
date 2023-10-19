# Use nix for kernel bisects

*Disclaimer: This is WIP*

This flake can be used to build a number of kernel commits for the sake of bisecting a bug.
The basic idea is this:

- configure a number of kernels you want to prebuild
- `nix build .#kernelFarm` over night with remote builders
- all requested kernels are now prebuilt in your nix store
- do the actual bisecting by replacing the kernel in you nixosConfiguration (`boot.kernelPackages = pkgs.linuxPackagesFor SELECTED_KERNEL_HERE`)
