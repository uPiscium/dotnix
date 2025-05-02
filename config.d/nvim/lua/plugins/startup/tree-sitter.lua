return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      local ts = require("nvim-treesitter.configs")
      ts.setup({
        event = "BufRead",
        ensure_installed = {
          "bash",
          "c",
          "cpp",
          "css",
          "dockerfile",
          "go",
          "gomod",
          "graphql",
          "html",
          "java",
          "javascript",
          "json",
          "lua",
          "python",
          "regex",
          "rust",
          "toml",
          "tsx",
          "typescript",
          "yaml",
          -- "markdown",
          "cmake",
          "xml",
          "git_config",
          "gitcommit",
          "gitignore",
          "jsdoc",
          "latex",
          "markdown",
          "markdown_inline",
          "diff",
          "vimdoc",
          "typst"
        },
        highlight = {
          enable = true,
          disable = { "latex" },
          additional_vim_regex_highlighting = { "letex", "markdown" },
        },
        indent = {
          enable = true,
        },
        tree_docs = {
          enable = true,
        },
        autotag = {
          enable = true,
        },
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = 1000,
        },
      })
    end
  },
  {
    "nvim-treesitter/nvim-tree-docs",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  }
}
