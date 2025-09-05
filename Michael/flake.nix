{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = inputs:
    let
      mkNixosSystem = (import ../utils.nix { inherit inputs; }).mkNixosSystem;
      mkHomeManagerConfiguration = (import ../utils.nix { inherit inputs; }).mkHomeManagerConfiguration;
    in
    {
      nixosConfigurations.host = mkNixosSystem {
        system = "x86_64-linux";
        hostname = "Michael";
        username = "upiscium";
        modules = [
          ./host
        ];
      };

      homeConfigurations.home = mkHomeManagerConfiguration {
        system = "x86_64-linux";
        hostname = "Michael";
        username = "upiscium";
        modules = [
          ./home
        ];
      };
    };
}
