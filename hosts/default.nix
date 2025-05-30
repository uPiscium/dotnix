inputs:
let
  mkNixosSystem =
    { system, hostname, username, modules }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system modules;
      specialArgs = {
        inherit inputs hostname username;
      };
    };

  mkHomeManagerConfiguration =
    { system, username, modules }:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
      extraSpecialArgs = {
        inherit inputs username;
        pkgs-stable = import inputs.nixpkgs-stable {
          inherit system;
          config = {
            allowUnfree = true;
          };
        };
      };
      modules = modules ++ [
        {
          home = {
            inherit username;
            homeDirectory = "/home/${username}";
            stateVersion = "24.11";
          };
          programs.home-manager.enable = true;
        }
      ];
    };
in
{
  nixos = {
    Michael = mkNixosSystem {
      # ROGSTRIX
      system = "x86_64-linux";
      hostname = "Michael";
      username = "upiscium";
      modules = [
        ./Michael/NixOS/host.nix
      ];
    };
    Ramiel = mkNixosSystem {
      # Dnsmasq Server
      system = "x86_64-linux";
      hostname = "Ramiel";
      username = "upiscium";
      modules = [
        ./Ramiel/NixOS/host.nix
      ];
    };
    Sandalphon = mkNixosSystem {
      # Nginx NAPT Server
      system = "x86_64-linux";
      hostname = "Sandalphon";
      username = "upiscium";
      modules = [
        ./Sandalphon/NixOS/host.nix
      ];
    };
    Sariel = mkNixosSystem {
      # Zenbook
      system = "x86_64-linux";
      hostname = "Sariel";
      username = "upiscium";
      modules = [
        ./Sariel/NixOS/host.nix
      ];
    };
    Uriel = mkNixosSystem {
      # WireGuard Server
      system = "x86_64-linux";
      hostname = "Uriel";
      username = "upiscium";
      modules = [
        ./Uriel/NixOS/host.nix
      ];
    };
  };

  home-manager = {
    Michael = mkHomeManagerConfiguration {
      system = "x86_64-linux";
      username = "upiscium";
      modules = [
        ./Michael/NixOS/home.nix
      ];
    };
    Ramiel = mkHomeManagerConfiguration {
      system = "x86_64-linux";
      username = "upiscium";
      modules = [
        ./Ramiel/NixOS/home.nix
      ];
    };
    Sandalphon = mkHomeManagerConfiguration {
      system = "x86_64-linux";
      username = "upiscium";
      modules = [
        ./Sandalphon/NixOS/home.nix
      ];
    };
    Sariel = mkHomeManagerConfiguration {
      system = "x86_64-linux";
      username = "upiscium";
      modules = [
        ./Sariel/NixOS/home.nix
      ];
    };
    Uriel = mkHomeManagerConfiguration {
      system = "x86_64-linux";
      username = "upiscium";
      modules = [
        ./Uriel/NixOS/home.nix
      ];
    };
  };
}
