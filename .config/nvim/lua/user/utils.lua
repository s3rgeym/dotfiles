local M = {}

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
