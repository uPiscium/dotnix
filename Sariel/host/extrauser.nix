{ pkgs, ... }: {
  users.users.guest = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "guest";
    extraGroups = [ "networkmanager" ];
  };
}

