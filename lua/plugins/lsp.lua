return {
  "neovim/nvim-lspconfig",
  -- TODO: Remove version pin when Neovim is upgraded to 0.11+
  -- nvim-lspconfig v3.0.0 will drop support for Neovim 0.10
  -- Currently pinned to v2.x to avoid breaking changes
  version = "2.x",
  config = function()
    require("config.lsp")
  end,
}
