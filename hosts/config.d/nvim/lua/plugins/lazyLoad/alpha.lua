return {
	"goolord/alpha-nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		-- { "3rd/image.nvim", opts = true, lazy = false },
	},
	config = function()
		local alpha = require("alpha")
		vim.api.nvim_set_hl(0, "CustomAlphaHeader", { fg = "#00ff00", bold = true })
		vim.api.nvim_set_hl(0, "CustomAlphaFooter", { fg = "#999999", bold = true })
		local dashboard = require("alpha.themes.dashboard")
		local asciiArt = {
			[[                               @@@@@@@@@@@@@@@@@@@@@@@@@@@%*=-::.... ....::-=*%@@@@@@@@@@@@@@@@@@@@@@@@@%-                               ]],
			[[                               @@@@@@@@@@@@@@@@@@@@@@%+:                         :+%@@@@@@@@@@@@@@@@@@@=                                 ]],
			[[                               @@@@@@@@@@@@@@@@@@@+:.     .:=*#%%@@@@@@@%%#*=:.     .:+@@@@@@@@@@@@@@+.                                  ]],
			[[                               @@@@@@@@@@@@@@@@*.     .+@@@@@@@@@@@@@@@@@@@@@@@@@+.     .*@@@@@@@@@*                                     ]],
			[[                               @@@@@@@@@@@@@%-   ..=#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%=..   -%@@@@#:                                      ]],
			[[                               @@@@@@@@@@@%:.   -%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%-   .:%%:                                        ]],
			[[                               @@@@@@@@@@-.  .=@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@=. :##:                                        ]],
			[[                               @@@@@@@@+.  .+@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*@@@@+.                                      ]],
			[[                               @@@@@@@-  .:@@@@@@@##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%#@@@+  .%@@@#:                                     ]],
			[[                               @@@@@%.  .+@@@@@@@@@#@@@@@@@@@@*@@@@@@@@@@@*@@@@@@@@@@*@@*.    .+@@@@-                                    ]],
			[[                               @@@@#.  .%@@@@@@@@@@*@@@@@@@@@@#@@@@@@@@@@@#@@@@@@@@@@*#.        :@@@@-.                                  ]],
			[[                               @@@%.  :%@@@@@@@@@@@#%@@@@@#%@@#@-@@@@@@@=@#@@%#@@@@@%:           :%@@@:                                  ]],
			[[                               @@@.  .#@@@@@@@@##@@@*@@+@@@%-%#*@@@@@@@@@*#%:%@@@+@-=.  --       .-@@@@.                                 ]],
			[[                               @@-  .*@@@@@@@@@@@*@@%%:-@@@@@*-=-:#@@@#:-=-*@@@@@#%:- .=.          -@@@%.                                ]],
			[[                               @*.  =@@@@@@@@@@@@@#%@*::@@@@@@#:.#@@@@@#..#@@@@+.%@=.:-.      .:.   +@@@=                                ]],
			[[                               @-  :%@@@*-@@@@@@@@@@*#:.*@@@@@@*.%@@@@@%:*@@@*..=@%-=..........#+  ..%@@#.                               ]],
			[[                               %. .+@+@@*.=@@@@@@@%%#*+.:%@@@@@%.-%@@@@-.%@#:  :%@+=-:::......*@+ .+.+@@@-                               ]],
			[[                               +  .#@@#@@-.:%@@%=....... .:+%@@@==-@@@:==%-.:+%@@@@@@@@@#:..:%@#..-. -@@@*                               ]],
			[[                               -  .%@@@%##- .=@*%@@@@@@@#:.....=#=*-@-#==*@@@@@@-.     .:=:*@@#---.  :%@@%                               ]],
			[[                               :*++++++++##-. .-@@@@@%###%: -@%- .++-=%@@%:.#@%----:..  .#@@@#--++++++++=%                               ]],
			[[                               .  :@@%######-.            .....:++..+@@++%@@@@@@@@@@@@@@@@@@#------:..%@@@                               ]],
			[[                               .  -*@@@@@+..  ..-   .:#@@@@@@%-...=#@##@@@%:......-%@@@@#@@@@@@+. ...=#@@@                               ]],
			[[                               -=..%@@%: .:=%+%@@@@+:.  .:=*##%%##@@@@@%=::--+*%@@@@%+:.  :+:+%@@%:. :%@*#                               ]],
			[[                               +  .#@*..*@@@#.:#@@@@@@#-......:%@@#@@@#@@@@@@@@@@#-.    .-%@- ..=@@+ -@@@*                               ]],
			[[                               %. .+@.=@@@@@@%:...=-..:+#%%#*%%@%+%=@+%+#@%#+--:-+%@@#*@@@%:  ....*@.+@@@-                               ]],
			[[                               @-  :%#@@%%%%#+=:.:++=---==+-:.=@@=.:@:.=%@=.:-=**###*++%@@*+=::::..-.%@@#.                               ]],
			[[                               @*.  +@@@@#*@+.-%@@@@@@@@@**#@@@+   :@:   =@@@#*+.       .:#@+.=-..  +@@@=                                ]],
			[[                               @@-  .##%@%-:#@@@@@@@@@@#:-=-+=#-   :@:   -#=+-=-           .-##:.:--@@@%.                                ]],
			[[          .          .         @@@.  .%@%-@@@@@@@@@@@#.   .=..++   :@:   ++..=:               .#: -@@@@.                                 ]],
			[[        ';;,.        ::'       @@@%.  :%@@@@@@@@@@@%-  .-=.    ..  :@:  ..    .--.             ..:%@@@-                                  ]],
			[[      ,:::;,,        :ccc,     @@@@#.  .%@@@@@@@@@-.    ..         :@:                          :@@@@-.                                  ]],
			[[     ,::c::,,,,.     :cccc,    @@@@@%.  .*@@@@@@+      ..::--=++****=****++=--::..            .=@@@@-                                    ]],
			[[     ,cccc:;;;;;.    cllll,    @@@@@@@-  .-@@@*..:+#%@@@@@@@@@@@@@@%.%@@@@@@@@@@@@@@%#+-.    .#@@@#:                                     ]],
			[[     ,cccc;.;;;;;,   cllll;    @@@@@@@@+.  .+#@@@@@@@@@@@@@@@@@@@@@%.%@@@@@@@@@@@@@@@@@@@@@**@@@@*.                                      ]],
			[[     :cccc; .;;;;;;. coooo;    @@@@@@@@@%--%@@@@@@@@@@@@@@@@@@@@@@@%.%@@@@@@@@@@@@@@@@@@@@@@@@@#:                                        ]],
			[[     ;llll;   ,:::::'loooo;    @@@@@@@@@@-:@@@@@@@@@@@@@@@@@@@@@@@@%.%@@@@@@@@@@@@@@@@@@@@@@@@:                                          ]],
			[[     ;llll:    ':::::loooo:    @@@@@@@%=   .-#@@@@@@@@@@@@@@@@@@@@@%.%@@@@@@@@@@@@@@@@@@@@@#-.                                           ]],
			[[     :oooo:     .::::llodd:    @@@@@@+.       .+@@@@@@@@@@@@@@@@@@@%.%@@@@@@@@@@@@@@@@@@@+.                                              ]],
			[[     .;ooo:       ;cclooo:.    @@@@*.            .+%@@@@@@@@@@@@@@@%.%@@@@@@@@@@@@@@@%+.                                                 ]],
			[[       .;oc        'coo;.      @@#.                 .:+%@@@@@@@@@@@%.%@@@@@@@@@@@@+:.                                                    ]],
			[[         .'         .,.        %:                         :=*%%@@@@%.%@@@@%%*=:                                                          ]],
		}
		local headerAscii = {
			[[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
			[[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
			[[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
			[[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
			[[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
			[[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
		}
		-- local api = require("image")
		-- local image = api.from_file(vim.fn.expand("$HOME/dotnix/config.d/nvim/Logo.png"), {
		-- 	x = math.floor(vim.api.nvim_win_get_width(0) / 2) - 28,
		-- 	y = 10,
		-- 	width = 100,
		-- })
		local image = nil

		dashboard.section.header.val = headerAscii
		dashboard.section.header.opts.hl = "CustomAlphaHeader"
		dashboard.section.buttons.val = {}
		dashboard.section.footer.opts.hl = "CustomAlphaFooter"
		dashboard.config.opts.noautocmd = true

		if image ~= nil then
			-- dashboard.section.header.val = asciiArt
			vim.api.nvim_create_autocmd({ "User" }, {
				callback = function()
					image:render()
					-- dashboard.section.header.val = {}
				end,
				pattern = "AlphaReady",
			})
			vim.api.nvim_create_autocmd({ "BufEnter" }, {
				callback = function()
					image:clear()
					-- dashboard.section.header.val = asciiArt
				end,
				pattern = { "*" },
			})
		else
      dashboard.section.footer.val = asciiArt
		end

		vim.cmd([[
        autocmd User AlphaReady echo 'Ready!'
      ]])

		alpha.setup(dashboard.config)
	end,
}
