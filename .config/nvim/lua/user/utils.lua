local M = {}

function M.map(lhs, rhs, desc_or_opts, mode)
  local opts = type(desc_or_opts) == "string" and { desc = desc_or_opts }
    or desc_or_opts
  vim.keymap.set(mode or "n", lhs, rhs, opts)
end

function M.find_project_root()
  local root_markers = {
    ".git",
    "composer.json",
    "package.json",
    "pyproject.toml",
    "go.mod",
    "lua",
    "init.lua",
    "Cargo.toml",
    "CMakeLists.txt",
    "Makefile",
  }
  return vim.fs.root(0, root_markers)
end

return M
