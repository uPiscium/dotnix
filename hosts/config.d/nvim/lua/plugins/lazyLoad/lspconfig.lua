return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "folke/neoconf.nvim" },
		{
			"b0o/schemastore.nvim",
			ft = { "json", "yaml", "toml" },
		},
		{ "dmmulroy/ts-error-translator", ft = "typescript" },
	},
	opts = {
		format = { timeout_ms = 50000 },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local server_list = {
			"astro",
			"bashls",
			"biome",
			"clangd",
			"cmake",
			"cssls",
			"denols",
			"docker_compose_language_service",
			"dockerls",
			"efm",
			"eslint",
			"graphql",
			"glsl_analyzer",
			"html",
			"jsonls",
			"lemminx",
			"nil_ls",
			"lua_ls",
			"mdx_analyzer",
			"ruff",
			-- "pyright",
			"jedi_language_server",
			"stylelint_lsp",
			"tailwindcss",
			"taplo",
			"texlab",
			"matlab_ls",
			"tinymist",
			"vimls",
			"yamlls",
		}

		-------------------------------------
		-- Handlers for each language server
		-------------------------------------
		local setup_handler = function(server_name)
			if server_name == "efm" then
				return
			end

			local default_opts = {
				capabilities = vim.tbl_deep_extend(
					"force",
					vim.lsp.protocol.make_client_capabilities(),
					require("cmp_nvim_lsp").default_capabilities()
				),
			}

			local opts = {}
			if server_name == "denols" then
				-- INFO: Neccessary for avoiding conflict with other js severs
				opts = {
					root_dir = lspconfig.util.root_pattern("deno.json"),
					init_options = {
						lint = true,
						unstable = true,
						suggest = {
							imports = {
								hosts = {
									["https://deno.land"] = true,
									["https://cdn.nest.land"] = true,
									["https://crux.land"] = true,
								},
							},
						},
					},
				}
			elseif server_name == "eslint" then
				opts.on_attach = function(_, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "EslintFixAll",
					})
				end
			elseif server_name == "stylelint_lsp" then
				opts.filetypes = { "css", "scss", "less", "sass" } -- exclude javascript and typescript
			elseif server_name == "jsonls" then
				opts.settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = true,
					},
				}
			elseif server_name == "yamlls" then
				opts.settings = {
					yaml = {
						schemaStore = {
							enable = true,
							url = "",
						},
						schemas = require("schemastore").yaml.schemas(),
					},
				}
			elseif server_name == "tinymist" then
				opts.settings = {
					exportPdf = "onType",
					formatterMode = "typstyle",
				}
			elseif server_name == "pyright" then
				lspconfig.pyright.setup({
					capabilities = default_opts.capabilities,
					settings = {
						python = {
							analysis = {
								typeCheckingMode = "on",
								autoSearchPaths = true,
								useLibraryCodeForTypes = true,
							},
						},
					},
				})
			elseif server_name == "ruff" then
				lspconfig.ruff.setup({
					capabilities = default_opts.capabilities,
				})
			end
			lspconfig[server_name].setup(vim.tbl_deep_extend("force", default_opts, opts))
		end

		for _, server in ipairs(server_list) do
			setup_handler(server)
		end

		local function on_list(options)
			vim.fn.setqflist({}, " ", options)
			vim.api.nvim_command("cfirst")
		end

		vim.lsp.buf.definition({ on_list = on_list })
		vim.lsp.buf.references(nil, { on_list = on_list })
		vim.diagnostic.config({
			virtual_text = {
				source = true,
			},
		})
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if not client then
					return
				end
				client.server_capabilities.semanticTokensProvider = nil
				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true)
				end
			end,
		})
	end,
	event = "BufReadPre",
}
