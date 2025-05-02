return {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "main",
	dependencies = {
		{
			"github/Copilot.vim",
			config = function()
				vim.g.copilot_filetypes = {
					markdown = true,
					yaml = true,
					toml = true,
					gitcommit = true,
					text = true,
				}
			end,
			event = "InsertEnter",
		},
		{ "nvim-lua/plenary.nvim" },
	},
	opts = {
		model = "gemini-2.5-pro-preview-03-25",
		debug = true,
	},
  build = "make tiktoken",
	-- build = function()
	-- 	vim.defer_fn(function()
	-- 		vim.cmd("UpdateRemotePlugins")
	-- 		vim.notify("CopilotChat - Updated remote plugins. Please restart Neovim.")
	-- 	end, 3000)
	-- end,
}
