return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- opts передается для автоматического вызова setup
    { "mason-org/mason.nvim", opts = {} },
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
    "b0o/schemastore.nvim",
    "ibhagwan/fzf-lua",
    "folke/which-key.nvim",
  },
  config = function()
    require("user.plugins.lsp.config").setup()
  end,
}
