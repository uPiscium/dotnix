{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    viAlias = true;

    extraLuaPackages = ps: [ ps.magick ps.tiktoken_core ];
    extraPackages = with pkgs; [
      deno
      gnumake
      nodejs
      tree-sitter
      imagemagick
      deno
      nodejs-slim
      tree-sitter
      bash-language-server
      clang-tools
      cmake-language-server
      matlab-language-server
      csharp-ls
      dockerfile-language-server-nodejs
      efm-langserver
      haskell-language-server
      haskellPackages.lsp
      lua-language-server
      nil
      nixpkgs-fmt
      nixpkgs-lint
      nodePackages.eslint
      nodePackages.prettier
      pyright
      python311Packages.debugpy
      ruff
      rust-analyzer
      glsl_analyzer
      shellcheck
      stylelint-lsp
      stylua
      tailwindcss-language-server
      taplo
      texlab
      tinymist
      typescript-language-server
      typstyle
      vim-language-server
      vscode-langservers-extracted
      yaml-language-server
      yamlfmt
      yamllint
    ];
  };

  home.file.".config/nvim" = {
    source = ../../config.d/nvim;
    recursive = true;
  };
}
