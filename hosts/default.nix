{ inputs, ... }: {
  nixos = {
    Esriel = (import ./Esriel/flake.nix { inherit inputs; }).nixos;
  };

  home-manager = {
    Esriel = (import ./Esriel/flake.nix { inherit inputs; }).home-manager;
  };
}
