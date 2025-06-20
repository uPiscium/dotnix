return {
	-- "CopilotC-Nvim/CopilotChat.nvim",
	-- branch = "main",
	-- cmd = "CopilotChat",
	-- dependencies = {
	-- 	{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
	-- 	{ "zbirenbaum/copilot.lua" },
	-- },
	-- opts = function()
	-- 	local user = vim.env.USER or "User"
	-- 	local endpoint = "http://192.168.11.90:11434"
	-- 	user = user:sub(1, 1):upper() .. user:sub(2)
	-- 	return {
	-- 		-- context = "buffer",
	-- 		sticky = "#buffer",
	-- 		-- model = "claude-3.7-sonnet",
	-- 		model = "ollama",
	-- 		auto_insert_mode = true,
	-- 		question_header = "  " .. user .. " ",
	-- 		answer_header = "  Copilot ",
	-- 		window = {
	-- 			width = 0.6,
	-- 		},
	-- 		providers = {
	-- 			{
	-- 				ollama = {
	-- 					prepare_input = require("CopilotChat.config.providers").copilot.prepare_input,
	-- 					prepare_output = require("CopilotChat.config.providers").copilot.prepare_output,

	-- 					get_models = function(headers)
	-- 						local response, err = require("CopilotChat.utils").curl_get(endpoint .. "/v1/models", {
	-- 							headers = headers,
	-- 							json_response = true,
	-- 						})

	-- 						if err then
	-- 							error(err)
	-- 						end

	-- 						return vim.tbl_map(function(model)
	-- 							return {
	-- 								id = model.id,
	-- 								name = model.id,
	-- 							}
	-- 						end, response.body.data)
	-- 					end,

	-- 					embed = function(inputs, headers)
	-- 						local response, err = require("CopilotChat.utils").curl_post(endpoint .. "/v1/embeddings", {
	-- 							headers = headers,
	-- 							json_request = true,
	-- 							json_response = true,
	-- 							body = {
	-- 								input = inputs,
	-- 								model = "all-minilm",
	-- 							},
	-- 						})

	-- 						if err then
	-- 							error(err)
	-- 						end

	-- 						return response.body.data
	-- 					end,

	-- 					get_url = function()
	-- 						return endpoint .. "/v1/chat/completions"
	-- 					end,
	-- 				},
	-- 			},
	-- 		},
	-- 	}
	-- end,
	-- keys = {
	-- 	{ "<Space>a?", "<cmd>CopilotChatModels<cr>", desc = "CopilotChat - Select Models" },
	-- },
	-- config = function(_, opts)
	-- 	local chat = require("CopilotChat")

	-- 	vim.api.nvim_create_autocmd("BufEnter", {
	-- 		pattern = "copilot-chat",
	-- 		callback = function()
	-- 			vim.opt_local.relativenumber = false
	-- 			vim.opt_local.number = false
	-- 		end,
	-- 	})

	-- 	chat.setup(opts)
	-- end,
}
