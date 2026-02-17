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

function M.set_keymaps(t)
  for mode, maps in pairs(t) do
    for _, m in ipairs(maps) do
      local opts = { desc = m[3] }
      for k, v in pairs(m) do
        if type(k) == "string" then
          opts[k] = v
        end
      end
      vim.keymap.set(mode, m[1], m[2], opts)
    end
  end
end

return M
