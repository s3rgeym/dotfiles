local M = {}

function M.create_buf_map(bufnr)
  local default_opts = { buffer = bufnr, silent = true, noremap = true }
  return function(lhs, rhs, desc_or_opts, mode)
    local opts = type(desc_or_opts) == "string" and { desc = desc_or_opts }
      or (desc_or_opts or {})
    opts = vim.tbl_extend("force", default_opts, opts)
    vim.keymap.set(mode or "n", lhs, rhs, opts)
  end
end

function M.find_root()
  local root_markers = {
    ".git",
    "composer.json",
    "package.json",
    "pyproject.toml",
    "requirements.txt",
    ".venv",
    "node_modules",
    "go.mod",
    "lua",
    "init.lua",
    "Cargo.toml",
    "CMakeLists.txt",
    "Makefile",
  }
  return vim.fs.root(0, root_markers)
end

M.map = M.create_buf_map()

return M
