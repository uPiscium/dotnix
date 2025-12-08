{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;

    extraLuaPackages = ps: [ ps.magick ps.tiktoken_core ];
    extraPackages = with pkgs; [
      # Executables
      deno
      (clang-tools.override {
        enableLibcxx = true;
      })
      gcc
      glibc
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

  home.file.".clang-tidy".source = ../../config.d/clangd/.clang-tidy;
  home.file.".config/clangd/config.yaml".source = ../../config.d/clangd/config.yaml;
}
