local status, dap = pcall(require, "dap")
if not status then
  return
end

require("nvim-dap-virtual-text").setup()

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      return "/usr/bin/python"
    end,
  },
}

-- c/c++/rust
dap.adapters.lldb = {
  type = "server",
  host = "127.0.0.1",
  port = 13000,
  executable = {
    command = "/usr/bin/codelldb",
    args = {},
  },
  command = "/usr/bin/lldb-vscode",
  name = "lldb",
}
dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = "/home/ojii3/.vscode/extensions/ms-vscode.cpptools-1.16.3-linux-x64/debugAdapters/bin/OpenDebugAD7",
}
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = false,
    args = {},
  },
}
dap.configurations.rust = {
  {
    name = "Launch file",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = false,
    args = {},
    initCommands = function()
      local rustc_sysroot = vim.fn.trim(vim.fn.system("rustc --print sysroot"))
      local script_import = 'command script import "' .. rustc_sysroot .. '/lib/rustlib/etc/lldb_lookup.py"'
      local commands_file = rustc_sysroot .. '/lib/rustlib/etc/lldb_commands'
      local commands = {}
      local file = io.open(commands_file, "r")
      if file then
        for line in file:lines() do
          table.insert(commands, line)
        end
        file:close()
      end
      table.insert(commands, 1, script_import)
      return commands
    end,
  }
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
