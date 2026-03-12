local M = {}

M.map = function(mode, lhs, rhs, desc_or_opts)
  local opts = { noremap = true, silent = true }
  if type(desc_or_opts) == "string" then
    opts.desc = desc_or_opts
  elseif type(desc_or_opts) == "table" then
    opts = vim.tbl_extend("force", opts, desc_or_opts)
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end

return M
