vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.splitright = true

require("config.lazy")

-- Set Ayu Mirage theme
vim.g.ayucolor = "mirage"
vim.cmd("colorscheme ayu")
