{ pkgs, ... }:
let
  lib = pkgs.lib;
  kernelSrcs = {
    linux_6_5_5_00 = {
      rev = "2309983b0ac063045af3b01b0251dfd118d45449";
      hash = "sha256-MdsnNw0WOdkL1OLcieDJO8R/5mazh7LzJgAd6ske0UM=";
      version = "6.5.5";
    };
    linux_6_5_5_01_e6dbd0bb = {
      rev = "e6dbd0bb6946e31d647a9460f56800bc96f21173";
      hash = "sha256-yPEgkJY79J8vR4jsiZwVh5v49sx33UXnsi/veYuiPb4=";
      version = "6.5.5";
    };
    linux_6_5_5_02_d10fd533 = {
      rev = "d10fd53393cc5de4b9cf1a4b8f9984f0a037aa51";
      hash = "sha256-Jz+ewsiFANcMYlm9vmNT2QnbaAKnCqXBEFVBE1xTc8g=";
      version = "6.5.5";
    };
    linux_6_5_5_03_56ad3015 = {
      rev = "56ad3015e39e6a093cfa9c077846bdbe3d8b6607";
      hash = "sha256-1NTUVWsQitqlBx4ra2HzaOYC1wDblOpjNNRR0Ts+n+4=";
      version = "6.5.5";
    };
    linux_6_5_5_04_806bd126 = {
      rev = "806bd126ec5dec359fe095a9fae53653eaab56f1";
      hash = "sha256-twcHMRXRFvO89LiEGzd4muYPY4KWSXzYl8rCSDafLgw=";
      version = "6.5.5";
    };
    linux_6_5_5_05_7bc7cbf9 = {
      rev = "7bc7cbf9ef695e830146d8b374b20274ada4837f";
      hash = "sha256-OVdCmVraF7Sk7ykIvqNZVOCiTxmUx4qFt4hilWTQwTU=";
      version = "6.5.5";
    };
    linux_6_5_5_06_7bcb9254 = {
      rev = "7bcb92540536e654be2c592b68d47bc529ebfa37";
      hash = "sha256-OnhXZOHhtUExluTKJb27VzRWrqSNJwcS3vvv5B8bU6k=";
      version = "6.5.5";
    };
    linux_6_5_5_07_59a05138 = {
      rev = "59a051389e1433b1a9abd258f3b4278b5e30654d";
      hash = "sha256-8uVEe+/xDPO1iH0hxPz1al9Aqi19BoGVzJZUbYhOmZI=";
      version = "6.5.5";
    };
    linux_6_5_5_08_73b4e302 = {
      rev = "73b4e302165b402d2059c92c00edc2f5c2eb203a";
      hash = "sha256-61IFuE5J2KTjY6MJPMW0bfqf4hTgL6zJfFIDIBsFDBQ=";
      version = "6.5.5";
    };
    linux_6_5_5_09_ef1054fb = {
      rev = "ef1054fb901aff291f83c4349523ee5359386026";
      hash = "sha256-2ZOGByCHvRiBgk0Y6GqyjudQ+mZMKxkIf6vwLtz7sTY=";
      version = "6.5.5";
    };
    linux_6_5_5_10_d82b1eaf = {
      rev = "d82b1eaf907103c2ad3b8888a279e9fc47cea317";
      hash = "sha256-BVi0bgi0KQRv8MdhIUdOKE4ErmEAAvaJvauO9ZcLlBU=";
      version = "6.5.5";
    };
    linux_6_5_6_0 = {
      rev = "0c3f363d1c150050b2ecec2af04f3c96fa2c66de";
      hash = "sha256-20JlNquEiqpoUxIiJx8kTZMBwSUeVcuCcEvIysyBnwo=";
      version = "6.5.6";
    };
  };
in

lib.mapAttrsToList
  (name: config:
  ((pkgs.linux_6_5.overrideAttrs (_: {
    name = name;
  })).override {
    argsOverride = rec {
      src = pkgs.fetchFromGitHub
        {
          owner = "torvalds";
          repo = "linux";
          rev = config.rev;
          hash = config.hash;
        };

      version = config.version;
      modDirVersion = config.version;
    };
  }))
  kernelSrcs
