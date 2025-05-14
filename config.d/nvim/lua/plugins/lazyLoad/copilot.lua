return {
	{
		"github/Copilot.vim",
		config = function()
			vim.cmd([[
        let g:copilot_filetypes = { 'markdown': v:true, 'gitcommit': v:true }
      ]])
		end,
	},
}
-- return {
-- 	{
-- 		"github/Copilot.vim",
-- 		config = function()
-- 			vim.cmd([[
--         let g:copilot_filetypes = { 'markdown': v:true, 'gitcommit': v:true }
--         let g:copilot_proxy = 'http://192.168.11.90:11435'
--         let g:copilot_proxy_strict_ssl = v:false
--       ]])
-- 		end,
-- 	},
-- }
