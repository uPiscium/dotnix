local keymap = vim.keymap

-- builtin
keymap.set("i", "hj", "<ESC>", { noremap = true, silent = true })
keymap.set("i", "<C-b>", "<ESC>", { noremap = true, silent = true })
keymap.set("n", "j", "gj", { noremap = true, silent = true })
keymap.set("n", "k", "gk", { noremap = true, silent = true })
keymap.set("v", "j", "gj", { noremap = true, silent = true })
keymap.set("v", "k", "gk", { noremap = true, silent = true })
keymap.set("t", "<ESC>", "<C-\\><C-n>", { noremap = true, silent = true })
keymap.set("t", "<C-[>", "<C-\\><C-n>", { noremap = true, silent = true })
keymap.set("n", "<C-b>h", "<cmd>BufferPrevious<CR>", { noremap = true, silent = true })
keymap.set("n", "<C-b><C-h>", "<cmd>BufferPrevious<CR>", { noremap = true, silent = true })
keymap.set("n", "<C-b>l", "<cmd>BufferNext<CR>", { noremap = true, silent = true })
keymap.set("n", "<C-b><C-l>", "<cmd>BufferNext<CR>", { noremap = true, silent = true })
keymap.set("n", "<C-b>d", "<cmd>BufferDelete<CR>", { noremap = true, silent = true })
keymap.set("n", "<C-b><C-d>", "<cmd>BufferClose<CR>", { noremap = true, silent = true })
keymap.set("n", "<C-i>", "<C-a>", { noremap = true, silent = true }) -- increment
keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true }) -- select all

-- plugins
-- Neo-tree
keymap.set("n", "<Space>e", "<cmd>Neotree<CR>", { noremap = true, silent = true })
-- ohters in neo-tree.lua

-- telescope
keymap.set("n", "<Space>g", "<cmd>Telescope git_files<CR>", { noremap = true, silent = true })
keymap.set("n", "<Space>f", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
keymap.set("n", "<Space>o", "<cmd>Telescope oldfiles<cr>", { noremap = true, silent = true })
keymap.set("n", "<Space>r", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })

-- lightspeed
keymap.set("n", "s", "<Plug>Lightspeed_s", { noremap = true, silent = true })

-- builtin lsp
keymap.set("n", "gn", "<cmd>lua vim.lsp.buf.rename()<CR>", { silent = true }) -- rename
keymap.set("n", "gm", "<cmd>lua vim.lsp.buf.format()<CR>", { silent = true }) -- format
keymap.set("n", "GE", vim.diagnostic.goto_prev, { silent = true }) -- go to previous diagnostic
keymap.set("n", "gE", vim.diagnostic.goto_prev, { silent = true }) -- go to previous diagnostic
keymap.set("n", "ge", vim.diagnostic.goto_next, { silent = true }) -- go to next diagnostic
keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, { silent = true }) -- go to definition
keymap.set("n", "gt", require("telescope.builtin").lsp_type_definitions, { silent = true }) -- go to type definition

-- markdown-preview
keymap.set("n", "<C-m>d", "<Plug>MarkdownPreviewToggle", { noremap = false, silent = true })

-- toggleterm
keymap.set("n", "<Space>tv", "<cmd>ToggleTerm direction=vertical size=100<CR>", { noremap = true, silent = true })
keymap.set("n", "<Space>th", "<cmd>ToggleTerm direction=horizontal size=12<CR>", { noremap = true, silent = true })
keymap.set("n", "<Space>tf", "<cmd>ToggleTerm direction=float<CR>", { noremap = true, silent = true })
keymap.set("n", "<Space>tt", "<cmd>lua tig_toggle()<CR>", { noremap = true, silent = true })
keymap.set("t", "<C-n>", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })

-- camel-case-motion
keymap.set("n", "cw", "<Plug>CamelCaseMotion_w", { noremap = true, silent = true })
-- keymap.set("n", "cb", "<Plug>CamelCaseMotion_b", { noremap = true, silent = true })
-- keymap.set("n", "ce", "<Plug>CamelCaseMotion_e", { noremap = true, silent = true })
keymap.set("n", "ycw", "v<Plug>CamelCaseMotion_iwy", { noremap = true, silent = true })
-- keymap.set("n", "vb", "v<Plug>CamelCaseMotion_ib", { noremap = true, silent = true })
-- keymap.set("n", "ve", "v<Plug>CamelCaseMotion_ie", { noremap = true, silent = true })
keymap.set("n", "dcw", "d<Plug>CamelCaseMotion_w", { noremap = true, silent = true })
-- keymap.set("n", "dcb", "d<Plug>CamelCaseMotion_b", { noremap = true, silent = true })
-- keymap.set("n", "de", "d<Plug>CamelCaseMotion_e", { noremap = true, silent = true })
