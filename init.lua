vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.cursorline = true

require("config.lazy")

-- Set Catppuccin Mocha theme
vim.cmd("colorscheme catppuccin-mocha")

-- Make Ctrl+w Ctrl+w switch panels even from terminal mode
vim.keymap.set('t', '<C-w><C-w>', '<C-\\><C-n><C-w>w')

