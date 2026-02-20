local M = {}

M.setup = function(client, bufnr)
  local wk = require("which-key")
  local fzf = require("fzf-lua")

  wk.add({
    -- Навигация
    { "gd", fzf.lsp_definitions, desc = "Go to Definition", buffer = bufnr },
    { "gD", fzf.lsp_declarations, desc = "Go to Declaration", buffer = bufnr },
    { "K",  vim.lsp.buf.hover, desc = "Show Documentation", buffer = bufnr },
    {
      "<C-k>",
      vim.lsp.buf.signature_help,
      desc = "Signature Help",
      mode = "i",
      buffer = bufnr,
    },
    { "grr", fzf.lsp_references, desc = "List References", buffer = bufnr },
    {
      "gri",
      fzf.lsp_implementations,
      desc = "List Implementations",
      buffer = bufnr,
    },
    { "grt", fzf.lsp_typedefs, desc = "Type Definition", buffer = bufnr },
    { "gF",  fzf.lsp_finder, desc = "LSP Finder", buffer = bufnr },
    {
      "gO",
      fzf.lsp_document_symbols,
      desc = "Document Symbols",
      buffer = bufnr,
    },
    {
      "<leader>rn",
      vim.lsp.buf.rename,
      desc = "Rename Symbol",
      buffer = bufnr,
    },
    {
      "<leader>ca",
      fzf.lsp_code_actions,
      desc = "Code Actions",
      buffer = bufnr,
    },

    {
      "<leader>ws",
      fzf.lsp_workspace_symbols,
      desc = "Workspace Symbols",
      buffer = bufnr,
    },
    {
      "<leader>wS",
      fzf.lsp_workspace_symbols,
      desc = "Live Workspace Symbols",
      buffer = bufnr,
    },
    {
      "<leader>x",
      fzf.diagnostics_document,
      desc = "Document Diagnostics",
      buffer = bufnr,
    },
    {
      "<leader>X",
      fzf.diagnostics_workspace,
      desc = "Workspace Diagnostics",
      buffer = bufnr,
    },
    -- Диагностика
    {
      "gl",
      vim.diagnostic.open_float,
      desc = "Line Diagnostics",
      buffer = bufnr,
    },
    {
      "[d",
      function()
        vim.diagnostic.jump({ count = -1 })
      end,
      desc = "Prev Diagnostic",
      buffer = bufnr,
    },
    {
      "]d",
      function()
        vim.diagnostic.jump({ count = 1 })
      end,
      desc = "Next Diagnostic",
      buffer = bufnr,
    },
  })

  -- Специальные действия
  if client.server_capabilities.codeActionProvider then
    wk.add({
      {
        "<leader>co",
        function()
          vim.lsp.buf.code_action({
            context = { only = { "source.organizeImports" }, diagnostics = {} },
            apply = true,
          })
        end,
        desc = "Code Organize Imports",
        buffer = bufnr,
      },
    })
  end

  if client.supports_method("textDocument/inlayHint") then
    wk.add({
      {
        "<leader>th",
        function()
          vim.lsp.inlay_hint.enable(
            not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }),
            { bufnr = bufnr }
          )
        end,
        desc = "Toggle Inlay Hints",
        buffer = bufnr,
      },
    })
  end
end

return M
