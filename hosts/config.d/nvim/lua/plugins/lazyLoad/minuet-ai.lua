return {
	"milanglacier/minuet-ai.nvim",
	config = function()
		require("minuet").setup({
			virtualtext = {
				auto_trigger_ft = {},
				keymap = {
					-- accept whole completion
					accept = "<A-A>",
					-- accept one line
					accept_line = "<A-a>",
					-- accept n lines (prompts for number)
					-- e.g. "A-z 2 CR" will accept 2 lines
					accept_n_lines = "<A-z>",
					-- Cycle to prev completion item, or manually invoke completion
					prev = "<A-[>",
					-- Cycle to next completion item, or manually invoke completion
					next = "<A-]>",
					dismiss = "<A-e>",
				},
			},
			provider = "openai_fim_compatible",
			provider_options = {
				openai_fim_compatible = {
					model = "qwen2.5-coder:14b",
					end_point = "http://sahaquiel.iruma.arc:11434/v1/completions",
					api_key = "TERM",
					name = "ollama",
					stream = true,
					template = {
						prompt = function(context_before_cursor, context_after_cursor)
							return "<|fim_prefix|>"
								.. context_before_cursor
								.. "<|fim_suffix|>"
								.. context_after_cursor
								.. "<|fim_middle|>"
						end,
						suffix = false,
					},
					-- Custom function to extract LLM-generated text from JSON output
					get_text_fn = {},
					optional = {
						max_tokens = 256,
						stop = { "\n\n" },
					},
				},
			},
		})
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
}
