local M = {}

M.setup_lsp_keymaps = function(client, bufnr)
  local wk = require("which-key")
  local fzf = require("fzf-lua")

  wk.add({
    -- Навигация
    { "gd", fzf.lsp_definitions, desc = "Go to Definition", buffer = bufnr },
    { "gD", fzf.lsp_declarations, desc = "Go to Declaration", buffer = bufnr },
    { "K", vim.lsp.buf.hover, desc = "Show Documentation", buffer = bufnr },
    {
      "<C-k>",
      vim.lsp.buf.signature_help,
      desc = "Signature Help",
      mode = "i",
      buffer = bufnr,
    },
    { "grr", fzf.lsp_references, desc = "List References", buffer = bufnr },
    {
      "gri",
      fzf.lsp_implementations,
      desc = "List Implementations",
      buffer = bufnr,
    },
    { "grt", fzf.lsp_typedefs, desc = "Type Definition", buffer = bufnr },
    { "gF", fzf.lsp_finder, desc = "LSP Finder", buffer = bufnr },
    {
      "gO",
      fzf.lsp_document_symbols,
      desc = "Document Symbols",
      buffer = bufnr,
    },
    {
      "<leader>rn",
      vim.lsp.buf.rename,
      desc = "Rename Symbol",
      buffer = bufnr,
    },
    {
      "<leader>ca",
      fzf.lsp_code_actions,
      desc = "Code Actions",
      buffer = bufnr,
    },

    {
      "<leader>ws",
      fzf.lsp_workspace_symbols,
      desc = "Workspace Symbols",
      buffer = bufnr,
    },
    {
      "<leader>wS",
      fzf.lsp_workspace_symbols,
      desc = "Live Workspace Symbols",
      buffer = bufnr,
    },
    {
      "<leader>x",
      fzf.diagnostics_document,
      desc = "Document Diagnostics",
      buffer = bufnr,
    },
    {
      "<leader>X",
      fzf.diagnostics_workspace,
      desc = "Workspace Diagnostics",
      buffer = bufnr,
    },
    -- Диагностика
    {
      "gl",
      vim.diagnostic.open_float,
      desc = "Line Diagnostics",
      buffer = bufnr,
    },
    {
      "[d",
      function()
        vim.diagnostic.jump({ count = -1 })
      end,
      desc = "Prev Diagnostic",
      buffer = bufnr,
    },
    {
      "]d",
      function()
        vim.diagnostic.jump({ count = 1 })
      end,
      desc = "Next Diagnostic",
      buffer = bufnr,
    },
  })

  -- Специальные действия
  if client.server_capabilities.codeActionProvider then
    wk.add({
      {
        "<leader>co",
        function()
          vim.lsp.buf.code_action({
            context = { only = { "source.organizeImports" }, diagnostics = {} },
            apply = true,
          })
        end,
        desc = "Code Organize Imports",
        buffer = bufnr,
      },
    })
  end

  if client.supports_method("textDocument/inlayHint") then
    wk.add({
      {
        "<leader>th",
        function()
          vim.lsp.inlay_hint.enable(
            not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }),
            { bufnr = bufnr }
          )
        end,
        desc = "Toggle Inlay Hints",
        buffer = bufnr,
      },
    })
  end
end

M.mappings = {
  {
    "<leader>?",
    function()
      require("which-key").show({ global = false })
    end,
    desc = "Buffer Local Keymaps (which-key)",
  },

  -- General
  { "<leader>a", "ggVG", desc = "Select [A]ll" },
  -- + - primary регистр
  { "<leader>y", "<cmd>%y+<cr>", desc = "Yank All" },
  -- _ - blackhole, регистр типа /dev/null.
  { "<leader>p", '<cmd>%delete _<cr>"+P', desc = "Paste All (Replace)" },
  { "<leader>wc", "<cmd>close<cr>", desc = "Window Close" },
  { "<leader>wo", "<cmd>only<cr>", desc = "Close Other Windows" },
  { "<Esc>", "<cmd>noh<cr><esc>", desc = "Clear hlsearch" },
  {
    "<leader>cd",
    "<cmd>lcd %:p:h<cr><cmd>pwd<cr>",
    desc = "Change Directory",
  },

  -- Buffers
  {
    "<leader>d",
    "<cmd>bp | bd #<cr>",
    desc = "Delete Buffer",
  },
  {
    "<leader>D",
    "<cmd>%bd | e # | bd #<cr>",
    desc = "Delete Other Buffers",
  },
  { "<Tab>", vim.cmd.bnext, desc = "Next Buffer" },
  { "<S-Tab>", vim.cmd.bprev, desc = "Previous Buffer" },
  -- Может некорректно работать в некоторых терминалах
  { "<BS>", "<C-^>", desc = "Last Buffer" },

  -- Tabs & Windows Navigation
  { "<A-Left>", "gT", desc = "Previous Tab" },
  { "<A-Right>", "gt", desc = "Next Tab" },
  { "<C-h>", "<cmd>wincmd h<cr>", desc = "Window Left" },
  { "<C-j>", "<cmd>wincmd j<cr>", desc = "Window Down" },
  { "<C-k>", "<cmd>wincmd k<cr>", desc = "Window Up" },
  { "<C-l>", "<cmd>wincmd l<cr>", desc = "Window Right" },

  -- Resize Windows
  { "<C-Up>", "<cmd>resize +2<cr>", desc = "Increase Height" },
  { "<C-Down>", "<cmd>resize -2<cr>", desc = "Decrease Height" },
  { "<C-Left>", "<cmd>vertical resize -2<cr>", desc = "Decrease Width" },
  { "<C-Right>", "<cmd>vertical resize +2<cr>", desc = "Increase Width" },

  -- Split Windows
  { "<leader>sh", vim.cmd.split, desc = "Split Horizontal" },
  { "<leader>sv", vim.cmd.vsplit, desc = "Split Vertical" },

  -- Movement (Normal)
  { "<Up>", "v:count == 0 ? 'gk' : 'k'", expr = true, desc = "Visual Up" },
  {
    "<Down>",
    "v:count == 0 ? 'gj' : 'j'",
    expr = true,
    desc = "Visual Down",
  },
  { "<A-Up>", ":m .-2<CR>==", desc = "Move Line Up" },
  { "<A-Down>", ":m .+1<CR>==", desc = "Move Line Down" },

  -- Movement & Selection (Visual)
  {
    mode = "v",
    { "<A-Up>", ":m '<-2<CR>gv=gv", desc = "Move Selection Up" },
    { "<A-Down>", ":m '>+1<CR>gv=gv", desc = "Move Selection Down" },
    { "<Tab>", ">gv", desc = "Increase Indent" },
    { "<S-Tab>", "<gv", desc = "Decrease Indent" },
  },

  -- Vim
  { "<leader>e", "<cmd>edit $MYVIMRC<cr>", desc = "Edit Vim Config" },

  -- Session
  { "<leader>ss", "<cmd>mksession!<cr>", desc = "Save Session" },
  { "<leader>sl", "<cmd>source Session.vim<cr>", desc = "Session Load" },

  -- Package Management
  { "<leader>l", "<cmd>Lazy<cr>", desc = "Lazy" },
  { "<leader>m", "<cmd>Mason<cr>", desc = "Mason" },

  -- Code Format
  {
    "<leader>cf",
    function()
      require("conform").format({ lsp_format = "fallback" })
    end,
    desc = "Code Format",
  },

  -- Fzf-lua
  -- Еще иногда C-f, C-b, C-^, C-o переопределяют, но я ими пользуюсь
  { "<c-g>", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
  { "<c-p>", "<cmd>FzfLua files<cr>", desc = "Files" },
  { "<leader>b", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
  { "<leader>f", group = "Fzf/Find" },
  { "<leader>fb", "<cmd>FzfLua builtin<cr>", desc = "Builtin" },
  { "<leader>fc", "<cmd>FzfLua commands<cr>", desc = "Commands" },
  { "<leader>fh", "<cmd>FzfLua history<cr>", desc = "History" },
  { "<leader>fj", "<cmd>FzfLua jumps<cr>", desc = "Jumps" },
  { "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "Keymaps" },
  { "<leader>fl", "<cmd>FzfLua loclist<cr>", desc = "Loclist" },
  { "<leader>fm", "<cmd>FzfLua marks<cr>", desc = "Marks" },
  { "<leader>fo", "<cmd>FzfLua oldfiles<cr>", desc = "Oldfiles" },
  { "<leader>fq", "<cmd>FzfLua quickfix<cr>", desc = "Quickfix" },
  { "<leader>fr", "<cmd>FzfLua resume<cr>", desc = "Resume Search" },
  { "<leader>g", group = "Git" },
  { "<leader>gb", "<cmd>FzfLua git_branches<cr>", desc = "Git Branches" },
  { "<leader>gc", "<cmd>FzfLua git_commits<cr>", desc = "Git Commits" },
  { "<leader>gf", "<cmd>FzfLua git_files<cr>", desc = "Git Files" },
  { "<leader>gs", "<cmd>FzfLua git_status<cr>", desc = "Git Status" },

  -- grug-far
  {
    "<leader>sr",
    function()
      require("grug-far").open()
    end,
    desc = "grug-far: Search and Replace",
  },
  {
    "<leader>sw",
    function()
      require("grug-far").open({
        prefills = {
          search = vim.fn.expand("<cword>"),
          replace = vim.fn.expand("<cword>"),
        },
      })
    end,
    mode = { "n", "v" },
    desc = "grug-far: [S]earch and Replace [W]ord",
  },
  {
    "<leader>sf",
    function()
      require("grug-far").open({
        prefills = {
          paths = vim.fn.expand("%"),
        },
      })
    end,
    desc = "grug-far: [S]earch and Replace in [F]ile",
  },
}

return M
