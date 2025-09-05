{ pkgs, ... }: {
  users.users.upiscium = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "uPiscium";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}

