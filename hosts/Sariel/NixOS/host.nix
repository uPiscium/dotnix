# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./firewall.nix
      ./hardware.nix
      ./wireguard.nix

      ../../common/NixOS
      ../../module/NixOS/asusctl.nix
      ../../module/NixOS/desktop.nix
      ../../module/NixOS/docker/rootless.nix
      ../../module/NixOS/network.nix
      ../../module/NixOS/steam.nix
    ]
    ++ (with inputs.nixos-hardware.nixosModules; [
      common-cpu-intel
      common-pc-ssd
    ]);

  hardware.graphics = {
    enable = true;
  };

  # Bootloader.
  # boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wireguard-tools
  ];


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
