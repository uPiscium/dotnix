{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = inputs:
    let
      mkNixosSystem = (import ../utils.nix { inherit inputs; }).mkNixosSystem;
      mkHomeManagerConfiguration = (import ../utils.nix { inherit inputs; }).mkHomeManagerConfiguration;
      hostname = "Michael";
      username = "upiscium";
    in
    {
      nixosConfigurations.host = mkNixosSystem {
        system = "x86_64-linux";
        hostname = hostname;
        username = username;
        modules = [
          ./host
        ];
      };

      homeConfigurations.home = mkHomeManagerConfiguration {
        system = "x86_64-linux";
        hostname = hostname;
        username = username;
        modules = [
          ./home
        ];
      };
    };
}
