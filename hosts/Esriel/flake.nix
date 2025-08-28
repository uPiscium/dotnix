{ inputs, ... }:
let
  mkNixosSystem = (import ../utils.nix { inherit inputs; }).mkNixosSystem;
  mkHomeManagerConfiguration = (import ../utils.nix { inherit inputs; }).mkHomeManagerConfiguration;
in
{
  nixos = mkNixosSystem {
    system = "x86_64-linux";
    hostname = "Esriel";
    username = "upiscium";
    modules = [
      ./NixOS/host.nix
    ];
  };

  home-manager = mkHomeManagerConfiguration {
    system = "x86_64-linux";
    hostname = "Esriel";
    username = "upiscium";
    modules = [
      ./NixOS/home.nix
    ];
  };
}

