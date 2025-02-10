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
    ROGSTRIX = mkNixosSystem {
      system = "x86_64-linux";
      hostname = "ROGSTRIX";
      username = "upiscium";
      modules = [
        ./ROGSTRIX/host.nix
      ];
    };
    MinecraftServer = mkNixosSystem {
      system = "x86_64-linux";
      hostname = "MinecraftServer";
      username = "upiscium";
      modules = [
        ./MinecraftServer/host.nix
      ];
    };
  };

  home-manager = {
    ROGSTRIX = mkHomeManagerConfiguration {
      system = "x86_64-linux";
      username = "upiscium";
      modules = [
        ./ROGSTRIX/home.nix
      ];
    };
    MinecraftServer = mkHomeManagerConfiguration {
      system = "x86_64-linux";
      username = "upiscium";
      modules = [
        ./MinecraftServer/home.nix
      ];
    };
  };
}
