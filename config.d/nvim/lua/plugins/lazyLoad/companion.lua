return {
	"olimorris/codecompanion.nvim",
	keys = {
		{
			"<Space>cf",
			":CodeCompanion<CR>",
			mode = { "n", "v" },
			silent = true,
		},
		{
			"<Space>cc",
			":CodeCompanionChat<CR>",
			mode = { "n", "v" },
			silent = true,
		},
		{
			"<Space>ca",
			":CodeCompanionAction<CR>",
			mode = { "n", "v" },
			silent = true,
		},
	},

	config = function()
		require("codecompanion").setup({
			adapters = {
				ollama_remote = function()
					return require("codecompanion.adapters").extend("ollama", {
						name = "ollama_remote",
						env = {
							url = "http://sahaquiel.iruma.arc:11434",
						},
						parameters = {
							sync = true,
						},
						schema = {
							model = {
								default = "qwen2.5-coder:14b",
							},
							num_ctx = {
								default = 16384,
							},
							num_predict = {
								default = -1,
							},
						},
					})
				end,
			},
			strategies = {
				chat = {
					adapter = "ollama_remote",
					roles = {
						llm = function(adapter)
							return "  CodeCompanion (" .. adapter.formatted_name .. ")"
						end,
						user = "  Me",
					},
					keymaps = {
						send = {
							modes = {
								n = "<C-Enter>",
								i = "<C-Enter>",
								v = "<C-Enter>",
							},
						},
						-- send_and_close = {
						-- 	modes = {
						-- 		n = "<C-q>",
						-- 		i = "<C-q>",
						-- 		v = "<C-q>",
						-- 	},
						-- },
						-- close = {
						-- modes = {
						-- 	n = "<Esc>",
						-- 	i = "<Esc>",
						-- 	v = "<Esc>",
						-- },
						-- },
					},
				},
				inline = {
					adapter = "ollama_remote",
				},
				agent = {
					adapter = "ollama_remote",
				},
			},
			display = {
				chat = {
					auto_scroll = false,
					show_header_separator = true,
				},
			},
		})
	end,
	opts = {
		allow_insecure = true,
		language = "japanese",
		extensions = {
			mcphub = {
				callback = "mcphub.extensions.codecompanion",
				opts = {
					make_vars = true,
					make_slash_commands = true,
					show_result_in_chat = true,
				},
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"ravitemer/mcphub.nvim",
	},
}
