vim.opt.statuscolumn = "%s %{v:relnum} %{v:lnum}"
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.cursorline = true
vim.opt.clipboard = "unnamedplus"
vim.opt.updatetime = 500  -- Trigger CursorHold faster (default is 4000ms)

require("config.lazy")

-- Set Catppuccin Mocha theme
vim.cmd("colorscheme catppuccin-mocha")

-- Exit terminal mode with Alt+, Alt+n
vim.keymap.set('t', '<A-,><A-n>', '<C-\\><C-n>')





