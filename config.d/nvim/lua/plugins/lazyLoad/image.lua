return {
	"3rd/image.nvim",
	enabled = os.getenv("TERM") == "xterm-kitty",
	dependencies = {
		{ "MunifTanjim/nui.nvim" },
	},
	lazy = false,
	opts = {
		integrations = {
			markdown = {
				enabled = false,
			},
			typst = {
				enabled = false,
			},
			html = {
				enabled = false,
			},
			css = {
				enabled = false,
			},
		},
	},
}
