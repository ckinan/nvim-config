vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.cursorline = true

require("config.lazy")

-- Set Catppuccin Mocha theme
vim.cmd("colorscheme catppuccin-mocha")

-- Exit terminal mode with Alt+, Alt+n
vim.keymap.set('t', '<A-,><A-n>', '<C-\\><C-n>')





