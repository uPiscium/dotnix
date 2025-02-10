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
    NAS = mkNixosSystem {
      system = "x86_64-linux";
      hostname = "NAS";
      username = "upiscium";
      modules = [
        ./NAS/host.nix
      ];
    };
    NixServer = mkNixosSystem {
      system = "x86_64-linux";
      hostname = "ArchServer";
      username = "upiscium";
      modules = [
        ./NixServer/host.nix
      ];
    };
    ROGSTRIX = mkNixosSystem {
      system = "x86_64-linux";
      hostname = "ROGSTRIX";
      username = "upiscium";
      modules = [
        ./ROGSTRIX/host.nix
      ];
    };
    WireGuard = mkNixosSystem {
      system = "x86_64-linux";
      hostname = "WireGuard";
      username = "upiscium";
      modules = [
        ./WireGuard/host.nix
      ];
    };
  };

  home-manager = {
    upiscium-ArchServer = mkHomeManagerConfiguration {
      system = "x86_64-linux";
      username = "upiscium";
      modules = [
        ./ArchServer/home.nix
      ];
    };
    upiscium-NAS = mkHomeManagerConfiguration {
      system = "x86_64-linux";
      username = "upiscium";
      modules = [
        ./NAS/home.nix
      ];
    };
    upiscium-ROGSTRIX = mkHomeManagerConfiguration {
      system = "x86_64-linux";
      username = "upiscium";
      modules = [
        ./ROGSTRIX/home.nix
      ];
    };
    upiscium-WireGuard = mkHomeManagerConfiguration {
      system = "x86_64-linux";
      username = "upiscium";
      modules = [
        ./WireGuard/home.nix
      ];
    };
  };
}
