return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		language = "Japanese",
		allow_insecure = false, -- Allow insecure connections?
		cache_models_for = 1800, -- Cache adapter models for this long (seconds)
		proxy = "http://192.168.11.90:11434", -- [protocol://]host[:port] e.g. socks5://127.0.0.1:9999
		show_defaults = true, -- Show default adapters
		show_model_choices = true, -- Show model choices when changing adapter
		require("codecompanion").setup({
			adapters = {
				ollama = function()
					return require("codecompanion.adapters").extend("ollama", {
						schema = {
							model = {
								default = "qwen:14b",
							},
						},
					})
				end,
			},
			-- The default adapter to use
			strategies = {
				chat = {
					adapter = "ollama",
				},
				inline = {
					adapter = "ollama",
				},
				agent = {
					adapter = "ollama",
				},
			},
		}),
	},
}
