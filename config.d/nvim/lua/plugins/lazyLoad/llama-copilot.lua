return {
	"Faywyn/llama-copilot.nvim",
	config = function()
		require("llama-copilot").setup({
			host = "192.168.11.90",
			port = "11434",
			model = "qwen3:14b",
			max_completion_size = -1, -- use -1 for limitless
			debug = false,
		})
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
