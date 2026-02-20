local aucmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup("UserAutocmds", { clear = true })

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

aucmd("VimEnter", {
  group = augroup,
  desc = "Session autoload",
  nested = true,
  callback = function()
    if vim.fn.argc() ~= 0 then
      return
    end

    if vim.fn.filereadable("Session.vim") == 1 then
      vim.cmd("silent source Session.vim")
    end
  end,
})

-- aucmd("SessionLoadPost", {
--   group = augroup,
--   desc = "Restart LSP after session load",
--   callback = function()
--     vim.defer_fn(function()
--       vim.cmd("LspRestart")
--     end, 2000)
--   end,
-- })

aucmd({ "BufReadPre" }, {
  group = augroup,
  desc = "Detect large files",
  callback = function(ev)
    local ok, stats = pcall(vim.uv.fs_stat, ev.file)
    if ok and stats and stats.size > 1000000 then
      vim.b[ev.buf].large_file = true
    end
  end,
})

aucmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.json",
  desc = "Enable json comments",
  callback = function()
    vim.bo.filetype = "jsonc"
  end,
})

aucmd({ "FocusGained", "BufEnter" }, {
  group = augroup,
  desc = "Sync file changes",
  command = "checktime",
})

aucmd({ "BufEnter" }, {
  group = augroup,
  desc = "Clear formatoptions",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o", "t" })
  end,
})

aucmd("BufReadPost", {
  group = augroup,
  desc = "Restore cursor position",
  callback = function(ev)
    local row, col = unpack(vim.api.nvim_buf_get_mark(ev.buf, '"'))
    if row > 0 and row <= vim.api.nvim_buf_line_count(ev.buf) then
      pcall(vim.api.nvim_win_set_cursor, 0, { row, col })
    end
  end,
})

aucmd({ "BufReadPost" }, {
  group = augroup,
  desc = "Optimize for large files",
  callback = function(ev)
    if not vim.b[ev.buf].large_file then
      return
    end
    vim.cmd("syntax clear")
    pcall(vim.treesitter.stop, ev.buf)
    vim.bo[ev.buf].filetype = ""
  end,
})

-- aucmd("BufReadCmd", {
--   group = augroup,
--   pattern = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
--   desc = "Open in external viewer",
--   command = "exe 'silent !display <afile> &' | b# | bw! #",
-- })

aucmd("BufWritePre", {
  group = augroup,
  desc = "Create missing directories",
  callback = function(event)
    if event.match:match("^%w+://") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

aucmd("TextYankPost", {
  group = augroup,
  desc = "Highlight yanked text",
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

aucmd("FileType", {
  group = augroup,
  desc = "Close with 'q'",
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

aucmd("VimResized", {
  group = augroup,
  desc = "Equalize window splits",
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

aucmd("TermOpen", {
  group = augroup,
  desc = "Terminal insert mode",
  command = "startinsert",
})
