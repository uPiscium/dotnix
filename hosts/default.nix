{ ... }:
let
  Esriel = builtins.getFlake ./Esriel;
in
{
  nixos = {
    Esriel = Esriel.nixos;
  };

  home-manager = {
    Esriel = Esriel.home-manager;
  };
}

