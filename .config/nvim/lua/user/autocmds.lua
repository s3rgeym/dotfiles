local augroup = vim.api.nvim_create_augroup("UserAutocmds", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  desc = "Highlight yanked text",
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  desc = "Restore last cursor position",
  callback = function(ev)
    local row, col = unpack(vim.api.nvim_buf_get_mark(ev.buf, '"'))
    if row > 0 and row <= vim.api.nvim_buf_line_count(ev.buf) then
      pcall(vim.api.nvim_win_set_cursor, 0, { row, col })
    end
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  desc = "Create parent directories on save",
  callback = function(event)
    -- Без этой строки создаются каталоги oil:
    if event.match:match("^%w+://") then
      return
    end

    ---@diagnostic disable-next-line: undefined-field
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  group = augroup,
  desc = "Reload file if changed outside Neovim",
  command = "checktime",
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = augroup,
  desc = "Start terminal in insert mode",
  command = "startinsert",
})

vim.api.nvim_create_autocmd("VimResized", {
  group = augroup,
  desc = "Equalize window splits on resize",
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  group = augroup,
  desc = "Set working directory to project root",
  callback = function()
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

    local root = vim.fs.root(0, root_markers)
    if root then
      vim.cmd.cd(root)
    end
  end,
})

vim.api.nvim_create_autocmd("BufReadPre", {
  group = augroup,
  desc = "Disable heavy features for large files",
  callback = function(ev)
    local ok, stats = pcall(vim.uv.fs_stat, ev.match)
    if ok and stats and stats.size > 100000 then
      vim.b.large_file = true
      vim.opt_local.swapfile = false
      vim.opt_local.undofile = false
      vim.opt_local.foldmethod = "manual"
      vim.opt_local.spell = false
      vim.cmd("syntax off")
      vim.treesitter.stop()
      vim.cmd("LspStop")
    end
  end,
})

-- Ненужное
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  desc = "Close special buffers with 'q'",
  pattern = { "help", "checkhealth", "qf", "man", "lspinfo" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set(
      "n",
      "q",
      "<cmd>close<CR>",
      { buffer = event.buf, silent = true }
    )
  end,
})

-- Я попробовал все эти chafa... пробовал открывать в zellij... image.nvim не
-- работает
-- vim.api.nvim_create_autocmd("BufReadCmd", {
--   pattern = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
--   desc = "Preview image in external viewer",
--   command = "exe 'silent !display <afile> &' | b# | bw! #",
-- })
