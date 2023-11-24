local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = '$HOME/.local/share/nvim/mason/bin/codelldb', -- adjust as needed, must be absolute path
  name = 'codelldb'
}
