-- Я решил отказаться от использования which-key для объявления сочетаний
-- и пользоваться по возможности keys в lazy
local M = {}

local keymaps = {
  general = {
    { "<leader>q", vim.cmd.quit, desc = "Quit" },
    { "<leader>Q", "<cmd>qa!<cr>", desc = "Quit All" },
    { "<leader>w", vim.cmd.write, desc = "Save" },
    { "<leader>a", "ggVG", desc = "Select All" },
    --Select + - primary регистр
    --{ "<leader>y", "<cmd>%y+<cr>", desc = "Yank All" },
    -- _ - blackhole, регистр типа /dev/null.
    {
      "<leader>p",
      '"_dP"',
      desc = "Paste keeping current register",
      mode = "v",
    },
    -- Use instead <C-w>c and <C-w>o
    -- { "<leader>wc", "<cmd>close<cr>", desc = "Window Close" },
    -- { "<leader>wo", "<cmd>only<cr>", desc = "Close Other Windows" },
    { "<Esc>", "<cmd>noh<cr><esc>", desc = "Clear hlsearch" },
    {
      "<leader>cd",
      "<cmd>lcd %:p:h<cr><cmd>pwd<cr>",
      desc = "Change Directory",
    },
    {
      "<leader>cD",
      "<cmd>cd %:p:h<cr><cmd>pwd<cr>",
      desc = "Change Directory Globaly",
    },

    -- Buffers
    --{ "<leader>b", group = "Buffers" },
    {
      "<leader>bd",
      "<cmd>bp | bd #<cr>",
      desc = "Delete Buffer",
    },
    {
      "<leader>bD",
      "<cmd>%bd | e # | bd #<cr>",
      desc = "Delete Other Buffers",
    },

    -- Tabs & Windows Navigation
    { "<Tab>", vim.cmd.bnext, desc = "Next Buffer" },
    { "<S-Tab>", vim.cmd.bprev, desc = "Previous Buffer" },
    -- Может некорректно работать в некоторых терминалах
    { "<BS>", "<C-^>", desc = "Last Buffer" },
    { "<C-Left>", "<cmd>wincmd h<cr>", desc = "Window Left" },
    { "<C-Down>", "<cmd>wincmd j<cr>", desc = "Window Down" },
    { "<C-Up>", "<cmd>wincmd k<cr>", desc = "Window Up" },
    { "<C-Right>", "<cmd>wincmd l<cr>", desc = "Window Right" },

    -- Resize Windows
    { "<A-Up>", "<cmd>resize +2<cr>", desc = "Increase Height" },
    { "<A-Down>", "<cmd>resize -2<cr>", desc = "Decrease Height" },
    { "<A-Left>", "<cmd>vertical resize -2<cr>", desc = "Decrease Width" },
    { "<A-Right>", "<cmd>vertical resize +2<cr>", desc = "Increase Width" },

    -- Split Windows
    { "<leader>h", vim.cmd.split, desc = "Split Horizontal" },
    { "<leader>v", vim.cmd.vsplit, desc = "Split Vertical" },

    -- Movement
    { "<Up>", "v:count == 0 ? 'gk' : 'k'", expr = true, desc = "Visual Up" },
    {
      "<Down>",
      "v:count == 0 ? 'gj' : 'j'",
      expr = true,
      desc = "Visual Down",
    },
    { "<A-k>", ":m .-2<CR>==", desc = "Move Line Up" },
    { "<A-j>", ":m .+1<CR>==", desc = "Move Line Down" },

    { "<A-k>", ":m '<-2<CR>gv=gv", desc = "Move Selection Up", mode = "v" },
    { "<A-j>", ":m '>+1<CR>gv=gv", desc = "Move Selection Down", mode = "v" },

    -- Indent
    { "<S-Tab>", "<C-u>", desc = "Decrease Indent", mode = "i" },
    { "<Tab>", ">gv", desc = "Increase Indent", mode = "v" },
    { "<S-Tab>", "<gv", desc = "Decrease Indent", mode = "v" },
    -- Vim
    { "<leader>e", "<cmd>edit $MYVIMRC<cr>", desc = "Edit Vim Config" },

    -- Session
    { "<leader>ss", "<cmd>mksession!<cr>", desc = "Save Session" },
    { "<leader>sS", "<cmd>source Session.vim<cr>", desc = "Source Session" },
  },

  lsp = {
    { "K", vim.lsp.buf.hover, desc = "Show Documentation" },
    {
      "<C-k>",
      vim.lsp.buf.signature_help,
      desc = "Signature Help",
      mode = "i",
    },
    {
      "gl",
      vim.diagnostic.open_float,
      desc = "Line Diagnostics",
    },
    {
      "[d",
      function()
        vim.diagnostic.jump({ count = -1 })
      end,
      desc = "Prev Diagnostic",
    },
    {
      "]d",
      function()
        vim.diagnostic.jump({ count = 1 })
      end,
      desc = "Next Diagnostic",
    },
    { "gF", "<cmd>FzfLua lsp_finder<cr>", desc = "LSP Finder" },
    {
      "<leader>d",
      "<cmd>FzfLua diagnostics_document<cr>",
      desc = "Document Diagnostics",
    },
    {
      "<leader>D",
      "<cmd>FzfLua diagnostics_workspace<cr>",
      desc = "Workspace Diagnostics",
    },
    {
      "gd",
      "<cmd>FzfLua lsp_definitions<cr>",
      desc = "Go to Definition",
    },
    {
      "gD",
      "<cmd>FzfLua lsp_declarations<cr>",
      desc = "Go to Declaration",
    },
    {
      "grr",
      "<cmd>FzfLua lsp_references<cr>",
      desc = "List References",
    },
    {
      "gri",
      "<cmd>FzfLua lsp_implementations<cr>",
      desc = "List Implementations",
    },
    {
      "grt",
      "<cmd>FzfLua lsp_typedefs<cr>",
      desc = "Type Definition",
    },
    {
      "gO",
      "<cmd>FzfLua lsp_document_symbols<cr>",
      desc = "Document Symbols",
    },
    {
      "grn",
      vim.lsp.buf.rename,
      desc = "Rename Symbol",
    },
    {
      "gra",
      "<cmd>FzfLua lsp_code_actions<cr>",
      desc = "Code Actions",
    },
    {
      "<leader>ls",
      "<cmd>FzfLua lsp_workspace_symbols<cr>",
      desc = "Workspace Symbols",
    },
    {
      "<leader>lS",
      "<cmd>FzfLua lsp_live_workspace_symbols<cr>",
      desc = "Live Workspace Symbols",
    },
  },

  conform = {
    {
      "<leader>cf",
      function()
        require("conform").format({ lsp_format = "fallback" })
      end,
      desc = "Code Format",
    },
  },

  fzf_lua = {
    -- Еще иногда C-f, C-b, C-^, C-o переопределяют, но я ими пользуюсь
    -- Ctrl-G печатает имя текущего файла
    { "<C-g>", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
    { "<C-p>", "<cmd>FzfLua files<cr>", desc = "Files" },
    -- <C-\\> неудобно
    { "<C-^>", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
    -- { "<leader>f", group = "Fzf" },
    {
      "<C-k>",
      "<cmd>FzfLua builtin commands<cr>",
      desc = "Builtin Commands",
    },
    -- Find
    { "<leader>fc", "<cmd>FzfLua commands<cr>", desc = "Commands" },
    { "<leader>fh", "<cmd>FzfLua history<cr>", desc = "History" },
    { "<leader>fj", "<cmd>FzfLua jumps<cr>", desc = "Jumps" },
    { "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "Keymaps" },
    { "<leader>fl", "<cmd>FzfLua loclist<cr>", desc = "Loclist" },
    { "<leader>fm", "<cmd>FzfLua marks<cr>", desc = "Marks" },
    { "<leader>fo", "<cmd>FzfLua oldfiles<cr>", desc = "Oldfiles" },
    { "<leader>fq", "<cmd>FzfLua quickfix<cr>", desc = "Quickfix" },
    { "<leader>fr", "<cmd>FzfLua resume<cr>", desc = "Resume Last Search" },
    -- Git
    { "<leader>gb", "<cmd>FzfLua git_branches<cr>", desc = "Git Branches" },
    { "<leader>gc", "<cmd>FzfLua git_commits<cr>", desc = "Git Commits" },
    { "<leader>gf", "<cmd>FzfLua git_files<cr>", desc = "Git Files" },
    { "<leader>gs", "<cmd>FzfLua git_status<cr>", desc = "Git Status" },
  },

  grug_far = {
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
  },

  flash = {
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "S",
      mode = { "n", "x", "o" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
    {
      "R",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Treesitter Search",
    },
    {
      "<c-s>",
      mode = { "c" },
      function()
        require("flash").toggle()
      end,
      desc = "Toggle Flash Search",
    },
  },

  neo_tree = {
    { "<C-n>", "<cmd>Neotree toggle<cr>", desc = "Neo-Tree Toggle" },
  },

  oil = {
    { "-", "<cmd>Oil<cr>", desc = "Open parent in Oil" },
  },

  which_key = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}

M.get_keymaps = function(group_name)
  return keymaps[group_name] or {}
end

-- TODO: заменить чем-то встроенным из lazy
M.set_keymaps = function(group_name, bufnr)
  local keys = M.get_keymaps(group_name)
  local default_opts = { silent = true, noremap = true, buffer = bufnr }
  for _, map in ipairs(keys) do
    local lhs = map[1]
    local rhs = map[2]
    local opts = vim.tbl_extend("force", default_opts, map)
    opts[1] = nil
    opts[2] = nil
    local mode = opts.mode or "n"
    opts.mode = nil
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

return M
