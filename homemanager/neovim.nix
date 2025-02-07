{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;

    extraPackages = with pkgs; [
      deno
      gnumake
      nodejs
      tree-sitter
    ];
  };

  home.file.".config/nvim" = {
    source = ../config.d/nvim;
    recursive = true;
  };
}
