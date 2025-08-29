{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    cifs-utils
    curl
    lshw
    neovim
    nix-index
    usbutils
    vim
    wget
    zsh
  ];
  environment.pathsToLink = [ "/share/zsh" ];

  programs = {
    git = {
      enable = true;
    };
    vim.enable = true;
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
    };
    zsh = {
      enable = true;
    };
    nix-ld.enable = true;
  };
}
