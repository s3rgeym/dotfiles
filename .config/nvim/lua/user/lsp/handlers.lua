local M = {}

M.on_attach = function(client, bufnr)
  -- Подключаем маппинги
  require("user.lsp.mappings").setup(client, bufnr)

  -- Включаем Inlay Hints по умолчанию
  if client.supports_method("textDocument/inlayHint") then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end

  -- Подсветка упоминаний символа под курсором
  if client.supports_method("textDocument/documentHighlight") then
    local group =
      vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
    vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })

    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = group,
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
      group = group,
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

return M
