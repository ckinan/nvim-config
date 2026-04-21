local lspconfig = require("lspconfig")

-- LSP hover settings with minimal config
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
  max_width = 80,
  max_height = 20,
})

-- Show diagnostics in a floating window on cursor hold (wraps long messages)
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  float = {
    border = "rounded",
    source = true,
    max_width = 80,
    wrap = true,
  },
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})

-- Setup Go LSP (gopls)
lspconfig.gopls.setup({
  settings = {
    gopls = {
      usePlaceholders = true,
      completeUnimported = true,
      gofumpt = true,
    },
  },
})

-- Format Go files on save using goimports (formats + reorders imports)
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    for _, res in pairs(result or {}) do
      for _, action in pairs(res.result or {}) do
        if action.edit then
          vim.lsp.util.apply_workspace_edit(action.edit, "utf-8")
        end
      end
    end
    vim.lsp.buf.format({ async = false })
  end,
})

-- Keybindings for LSP
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)      -- Go to definition
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)             -- Show documentation
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- Code actions
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)   -- Rename symbol
vim.keymap.set("n", "<leader>q", function()                   -- Diagnostics panel
  vim.diagnostic.setqflist()
  vim.cmd("copen")
end, vim.tbl_extend("force", opts, { desc = "Diagnostics panel" }))
