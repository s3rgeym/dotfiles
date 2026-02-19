local utils = require("user.utils")
local aucmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup("UserAutocmds", { clear = true })

aucmd("TextYankPost", {
  group = augroup,
  desc = "Highlight yanked text",
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

-- verbose set fo?
-- Единственный способ задать настройки форматирования
aucmd({ "BufEnter" }, {
  group = augroup,
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o", "t" })
  end,
})

aucmd("BufReadPost", {
  group = augroup,
  desc = "Restore last cursor position",
  callback = function(ev)
    local row, col = unpack(vim.api.nvim_buf_get_mark(ev.buf, '"'))
    if row > 0 and row <= vim.api.nvim_buf_line_count(ev.buf) then
      pcall(vim.api.nvim_win_set_cursor, 0, { row, col })
    end
  end,
})

aucmd("BufWritePre", {
  group = augroup,
  desc = "Create parent directories on save",
  callback = function(event)
    -- Ничего не делаем при окрытии протоколов типа oil://path/to/file
    if event.match:match("^%w+://") then
      return
    end

    ---@diagnostic disable-next-line: undefined-field
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

aucmd({ "FocusGained", "BufEnter" }, {
  group = augroup,
  desc = "Reload file if changed outside Neovim",
  command = "checktime",
})

aucmd("TermOpen", {
  group = augroup,
  desc = "Start terminal in insert mode",
  command = "startinsert",
})

aucmd("VimResized", {
  group = augroup,
  desc = "Equalize window splits on resize",
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

aucmd("VimEnter", {
  group = augroup,
  desc = "Autoload session",
  nested = true, -- Без этого LSP не запустятся?
  callback = function()
    local root = utils.find_root()
    if root and vim.fn.argc() == 0 then
      local session_path = root .. "/Session.vim"
      if vim.fn.filereadable(session_path) == 1 then
        vim.cmd("source " .. vim.fn.fnameescape(session_path))
      end
    end
  end,
})

aucmd("VimLeavePre", {
  group = augroup,
  desc = "Save session on exit",
  callback = function()
    local root = utils.find_root()
    if root then
      local session_path = root .. "/Session.vim"
      vim.cmd("mksession! " .. vim.fn.fnameescape(session_path))
    end
  end,
})

-- aucmd("SessionLoadPost", {
--   group = augroup,
--   callback = function()
--     vim.defer_fn(function()
--       vim.cmd("LspRestart")
--     end, 2000)
--   end,
-- })

-- aucmd("VimEnter", {
--   group = augroup,
--   desc = "Change CWD to project root",
--   callback = function()
--     local root = utils.find_project_root()
--     if root then
--       vim.cmd.cd(root)
--     end
--   end,
-- })

aucmd({ "BufReadPre" }, {
  group = augroup,
  desc = "Detect large file",
  callback = function(ev)
    local ok, stats = pcall(vim.uv.fs_stat, ev.file)
    if ok and stats and stats.size > 1000000 then
      vim.b[ev.buf].large_file = true
    end
  end,
})

aucmd({ "BufReadPost" }, {
  group = augroup,
  desc = "Disable syntax highlight for large files",
  callback = function(ev)
    if not vim.b[ev.buf].large_file then
      return
    end

    vim.cmd("syntax clear")
    pcall(vim.treesitter.stop, ev.buf)
    vim.bo[ev.buf].filetype = ""
  end,
})

-- Ненужное
aucmd("FileType", {
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
-- autocmd("BufReadCmd", {
--   pattern = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
--   desc = "Preview image in external viewer",
--   command = "exe 'silent !display <afile> &' | b# | bw! #",
-- })
