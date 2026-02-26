---@diagnostic disable: undefined-field
local create_autocmd = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup("User", { clear = true })

-- create_autocmd("VimEnter", {
--   group = aucmd_group,
--   desc = "Change CWD to project root",
--   callback = function()
--     local root = utils.find_project_root()
--     if root then
--       vim.cmd.cd(root)
--     end
--   end,
-- })

create_autocmd("VimEnter", {
  group = group,
  desc = "Session autoload",
  nested = true,
  callback = function()
    if vim.fn.argc() ~= 0 then
      return
    end

    if vim.fn.filereadable("Session.vim") == 1 then
      vim.cmd("silent source Session.vim")
      -- Без schedule ничего не отобразится
      -- vim.schedule(function()
      --   vim.notify("Session Restored", vim.log.levels.INFO)
      -- end)
    end
  end,
})

create_autocmd("VimLeavePre", {
  group = group,
  desc = "Session autosave",
  callback = function()
    if vim.v.this_session ~= "" then
      vim.cmd("mksession! " .. vim.fn.fnameescape(vim.v.this_session))
    end
  end,
})

-- create_autocmd("SessionLoadPost", {
--   group = aucmd_group,
--   desc = "Restart LSP after session load",
--   callback = function()
--     vim.defer_fn(function()
--       vim.cmd("LspRestart")
--     end, 2000)
--   end,
-- })

create_autocmd({ "BufWinEnter", "BufReadPost", "FileType" }, {
  group = group,
  desc = "Set colorcolumn based on textwidth",
  callback = function()
    local tw = vim.bo.textwidth
    if tw > 0 then
      vim.wo.colorcolumn = tostring(tw + 1)
    else
      vim.wo.colorcolumn = ""
    end
  end,
})

create_autocmd({ "BufReadPre" }, {
  group = group,
  desc = "Detect large files",
  callback = function(ev)
    local ok, stats = pcall(vim.uv.fs_stat, ev.file)
    if ok and stats and stats.size > 1000000 then
      vim.b[ev.buf].large_file = true
    end
  end,
})

create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.json",
  desc = "Enable json comments",
  callback = function()
    vim.bo.filetype = "jsonc"
  end,
})

create_autocmd({ "FocusGained", "BufEnter" }, {
  group = group,
  desc = "Sync file changes",
  command = "checktime",
})

create_autocmd({ "BufEnter" }, {
  group = group,
  desc = "Clear formatoptions",
  callback = function()
    -- По дефолту что-то типа ljcqrt
    -- Отключаем форматирование при вставке
    --vim.opt_local.formatoptions:remove({ "t" })
    vim.opt_local.formatoptions = { j = true, q = true }
  end,
})

create_autocmd("BufReadPost", {
  group = group,
  desc = "Restore cursor position",
  callback = function(ev)
    local row, col = unpack(vim.api.nvim_buf_get_mark(ev.buf, '"'))
    if row > 0 and row <= vim.api.nvim_buf_line_count(ev.buf) then
      pcall(vim.api.nvim_win_set_cursor, 0, { row, col })
    end
  end,
})

create_autocmd({ "BufReadPost" }, {
  group = group,
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

-- create_autocmd("BufReadCmd", {
--   group = aucmd_group,
--   pattern = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp" },
--   desc = "Open in external viewer",
--   command = "exe 'silent !display <afile> &' | b# | bw! #",
-- })

create_autocmd("BufWritePre", {
  group = group,
  desc = "Create missing directories",
  callback = function(event)
    -- Буферы с именами типа oil://
    if event.match:match("^%w+://") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

create_autocmd("TextYankPost", {
  group = group,
  desc = "Highlight yanked text",
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

create_autocmd("FileType", {
  group = group,
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

create_autocmd("VimResized", {
  group = group,
  desc = "Equalize window splits",
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

create_autocmd("TermOpen", {
  group = group,
  desc = "Terminal insert mode",
  command = "startinsert",
})

vim.api.nvim_create_user_command(
  "SortJSON",
  "%!jq -S .",
  { desc = "Sort JSON keys alphabetically" }
)
