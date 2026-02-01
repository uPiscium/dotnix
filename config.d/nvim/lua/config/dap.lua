local dap = require("dap")
local dapui = require("dapui")

dapui.setup()
-- デバッグ開始時に自動でUIを開き、終了時に閉じるリスナー
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- 1. アダプタの定義 (NixOSのPATHにあるものを利用)
dap.adapters.lldb = {
	type = "executable",
	-- ※注意: 環境によっては 'lldb-vscode' の場合があるので `which` で確認すること
	command = "lldb-dap",
	name = "lldb",
}

-- 2. コンフィグレーション (C++用)
dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		-- デバッグ対象のバイナリを指定
		-- ここでは Makefile で生成される `build/` 以下の実行ファイルを想定
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {}, -- 必要なら引数を指定

		-- 外部ライブラリのソースコードにステップインした場合のパス解決（必要に応じて）
		-- env = function()
		--   local variables = {}
		--   for k, v in pairs(vim.fn.environ()) do
		--     table.insert(variables, string.format("%s=%s", k, v))
		--   end
		--   return variables
		-- end,
	},
}

-- C言語も同じ設定を使う
dap.configurations.c = dap.configurations.cpp
