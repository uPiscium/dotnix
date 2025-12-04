{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;

    extraLuaPackages = ps: [ ps.magick ps.tiktoken_core ];
    extraPackages = with pkgs; [
      # Executables
      # ansible
      deno
      (clang-tools.override {
        enableLibcxx = true;
      })
      # clang
      gcc15
      gnumake
      nodejs
      tree-sitter
      imagemagick
      nodejs-slim
      tree-sitter

      # LSP and formatters
      bash-language-server
      cmake-language-server
      dockerfile-language-server
      efm-langserver
      lua-language-server
      nil
      nixpkgs-fmt
      nixpkgs-lint
      pyright
      python312Packages.jedi-language-server
      ruff
      rust-analyzer
      glsl_analyzer
      shellcheck
      stylelint-lsp
      stylua
      taplo
      tinymist
      typstyle
      vim-language-server
      yaml-language-server
      yamlfmt
      yamllint
    ];
  };

  home.file.".config/nvim" = {
    source = ../../config.d/nvim;
    recursive = true;
  };

  home.file.".config/mcphub" = {
    source = ../../config.d/mcphub;
    recursive = true;
  };
}
