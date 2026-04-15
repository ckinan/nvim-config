local lspconfig = require("lspconfig")

-- LSP hover settings with minimal config
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
  max_width = 80,
  max_height = 20,
})

-- Setup Go LSP (gopls)
lspconfig.gopls.setup({
  settings = {
    gopls = {
      usePlaceholders = true,
      completeUnimported = true,
    },
  },
})

-- Keybindings for LSP
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)      -- Go to definition
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)             -- Show documentation
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- Code actions
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)   -- Rename symbol
