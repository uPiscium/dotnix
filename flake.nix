{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    xremap.url = "github:xremap/nix-flake";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = inputs: {
    nixosConfigurations = (import ./NixOS inputs).nixos;
    # {
    # ROGSTRIX = inputs.nixpkgs.lib.nixosSystem {
    #   system = "x86_64-linux";
    #   modules = [
    #     ./NixOS/common
    #   ];
    #   specialArgs = {
    #     inherit inputs;
    #   };
    # };
    # };
    homeConfigurations = (import ./NixOS inputs).home-manager;
    # {
    # ROGSTRIX-Home = inputs.home-manager.lib.homeManagerConfiguration {
    #   pkgs = import inputs.nixpkgs {
    #     system = "x86_64-linux";
    #     config.allowUnfree = true;
    #   };
    #   extraSpecialArgs = {
    #     inherit inputs;
    #   };
    #   modules = [
    #     ./homemanager
    #   ];
    # };
    # };
  };
}
