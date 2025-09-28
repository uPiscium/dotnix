-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
--   pattern = { "*.ts", "*.tsx", "*.js", "*.jsx", "*.md", "*.json", "*.lua" },
--   command = "set shiftwidth=2",
-- })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.py", "*.tf", "*.tfvars" },
	command = "set shiftwidth=4",
})

vim.api.nvim_create_autocmd({ "TermOpen" }, {
	pattern = "*",
	command = "startinsert",
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*.typ", "*.tex", "*.md" },
	command = "silent! %s/。/. /g | silent! %s/、/, /g",
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- 保存時に自動フォーマット
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = { "*.rs", "*.cpp", "*.hpp", "*.py", "*.ts", "*.tf" },
			callback = function()
				vim.lsp.buf.format({
					buffer = ev.buf,
					filter = function(f_client)
						return f_client.name ~= "null-ls"
					end,
					async = false,
				})
			end,
		})
	end,
})
