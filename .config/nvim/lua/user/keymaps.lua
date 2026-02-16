local ok, wk = pcall(require, "which-key")
if not ok then
  return
end

-- local utils = require("user.utils")

wk.add({
  -- which-key
  {
    "<leader>?",
    function()
      wk.show({ global = false })
    end,
    desc = "Show Buffer Keymaps",
  },
  {
    "<leader>k",
    wk.show,
    desc = "Show All Keymaps",
  },
  {
    "<leader>K",
    function()
      local mode = vim.fn.input("mode: ")
      if mode ~= "" then
        wk.show({ mode = mode })
      end
    end,
    desc = "Show Mode Keymaps",
  },

  -- General
  { "<leader>w", "<cmd>w<cr>", desc = "Save File" },
  { "<leader>x", "<cmd>x<cr>", desc = "Save and Quit" },
  { "<leader>q", vim.cmd.quit, desc = "Quit" },
  { "<leader>Q", "<cmd>qa<cr>", desc = "Quit All" },
  {
    "<leader>a",
    "ggVG",
    desc = "Select all",
  },
  {
    "<Esc>",
    "<cmd>noh<cr><Esc>",
    desc = "Escape and clear hlsearch",
  },
  {
    "<leader>cd",
    "<cmd>lcd %:p:h<cr><cmd>pwd<cr>",
    desc = "Change Directory for current window",
  },

  -- Buffers
  { "<leader>d", "<cmd>bp<bar>bd #<cr>", desc = "Delete Buffer" },
  {
    "<leader>D",
    "<cmd>%bd<bar>e #<bar>bd #<cr>",
    desc = "Delete Other Buffers",
  },
  { "<tab>", vim.cmd.bnext, desc = "Next Buffer" },
  { "<s-tab>", vim.cmd.bprev, desc = "Previous Buffer" },

  -- Vim
  {
    { "<leader>v", group = "Vim" },
    {
      "<leader>ve",
      "<cmd>edit $MYVIMRC<cr>",
      desc = "Edit Vim Config",
    },
    -- Сочетание для перезагрузки все равно не будет работать до версии 0.12,
    -- где добавили команду :restart
    -- {"<leader>vr", vim.cmd.restart, "Restart Vim"},
  },

  -- Windows
  -- Не всегда работает как надо
  -- { "<C-h>", "<C-w>h", desc = "Window Left" },
  { "<C-h>", "<cmd>wincmd h<cr>", desc = "Window Left" },
  { "<C-j>", "<cmd>wincmd j<cr>", desc = "Window Down" },
  { "<C-k>", "<cmd>wincmd k<cr>", desc = "Window Up" },
  { "<C-l>", "<cmd>wincmd l<cr>", desc = "Window Right" },

  { "<C-Up>", "<cmd>resize +2<cr>", desc = "Increase Window Height" },
  { "<C-Down>", "<cmd>resize -2<cr>", desc = "Decrease Window Height" },
  {
    "<C-Left>",
    "<cmd>vertical resize -2<cr>",
    desc = "Decrease Window Width",
  },
  {
    "<C-Right>",
    "<cmd>vertical resize +2<cr>",
    desc = "Increase Window Width",
  },

  -- Movement
  {
    "<Up>",
    "v:count == 0 ? 'gk' : 'k'",
    desc = "Visual Up",
    expr = true,
    replace_keycodes = false,
  },
  {
    "<Down>",
    "v:count == 0 ? 'gj' : 'j'",
    desc = "Visual Down",
    expr = true,
    replace_keycodes = false,
  },

  -- Indentation
  { "<", "<<_", desc = "Decrease Indent" },
  { ">", ">>_", desc = "Increase Indent" },

  {
    mode = "v",
    { "<Tab>", ">gv", desc = "Increase Indent" },
    { "<S-tab>", "<gv", desc = "Decrease Indent" },
  },

  { "<S-Tab>", "<C-d>", desc = "Decrease Indent", mode = "i" },

  -- Move Lines
  { "<A-j>", ":m .+1<CR>==", desc = "Move Down" },
  { "<A-k>", ":m .-2<CR>==", desc = "Move Up" },

  {
    mode = "v",
    { "<A-j>", ":m '>+1<CR>gv=gv", desc = "Move Selection Down" },
    { "<A-k>", ":m '<-2<CR>gv=gv", desc = "Move Selection Up" },
  },

  -- Он громоздкий и бесполезный. Мне нужно что-то простое, но не такое убогое
  -- как netrw

  -- Neotree
  -- { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },

  -- oil.nvim
  { "-", "<CMD>Oil<CR>", desc = "oil: Open parent directory" },

  -- { "<leader>m", vim.cmd.marks, desc = "Marks" },

  -- LSP and Search
  { "gd", "<cmd>FzfLua lsp_definitions<cr>", desc = "Go to Definition" },
  { "gD", "<cmd>FzfLua lsp_declarations<cr>", desc = "Go to Declaration" },
  {
    "gi",
    "<cmd>FzfLua lsp_implementations<cr>",
    desc = "Go to Implementation",
  },
  { "gy", "<cmd>FzfLua lsp_typedefs<cr>", desc = "Go to Type Definition" },
  -- gr конфликтует с grn, gra и тп, nowait решает эту проблему
  {
    "gr",
    "<cmd>FzfLua lsp_references<cr>",
    desc = "List References",
    nowait = true,
  },
  { "K", vim.lsp.buf.hover, desc = "Show Documentation" },
  {
    "<C-k>",
    vim.lsp.buf.signature_help,
    desc = "Signature Help",
    mode = "i",
  },
  { "<leader>rn", vim.lsp.buf.rename, desc = "Rename" },
  {
    "<leader>ca",
    "<cmd>FzfLua lsp_code_actions<cr>",
    desc = "Code Actions",
    mode = { "n", "v" },
  },
  { "gl", vim.diagnostic.open_float, desc = "Line Diagnostics" },
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
  { "<leader>cl", vim.lsp.codelens.run, desc = "Run CodeLens" },
  {
    { "<leader>t", group = "Toggle" },
    {
      "<leader>th",
      function()
        local bufnr = vim.api.nvim_get_current_buf()
        vim.lsp.inlay_hint.enable(
          not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }),
          { bufnr = bufnr }
        )
      end,
      desc = "Toggle Inlay Hints",
    },
  },
  {
    "<leader>ld",
    "<cmd>FzfLua lsp_document_symbols<cr>",
    desc = "Document Symbols",
  },
  {
    "<leader>lw",
    "<cmd>FzfLua lsp_workspace_symbols<cr>",
    desc = "Workspace Symbols",
  },
  {
    "<leader>lD",
    "<cmd>FzfLua diagnostics_document<cr>",
    desc = "Document Diagnostics",
  },
  {
    "<leader>li",
    "<cmd>LspInfo<cr>",
    desc = "LSP Info",
  },
  {
    "<leader>lr",
    "<cmd>LspRestart<cr>",
    desc = "LSP Restart",
  },
  {
    "<leader>co",
    function()
      vim.lsp.buf.code_action({
        context = { only = { "source.organizeImports" }, diagnostics = {} },
        apply = true,
      })
    end,
    desc = "Organize Imports",
  },

  -- Other FzfLua
  { "<leader>/", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
  { "<leader>p", "<cmd>FzfLua files<cr>", desc = "Files" },
  { "<leader>b", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
  { "<leader>m", "<cmd>FzfLua marks<cr>", desc = "Marks" },
  { "<leader>:", "<cmd>FzfLua commands<cr>", desc = "Commands" },

  {
    { "<leader>f", group = "Find (FzfLua)" },
    { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Files" },
    { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
    { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
    { "<leader>fh", "<cmd>FzfLua command_history<cr>", desc = "History" },
    { "<leader>fk", "<cmd>FzfLua keymaps<cr>", desc = "Keymaps" },
    { "<leader>fc", "<cmd>FzfLua commands<cr>", desc = "Commands" },
    { "<leader>fr", "<cmd>FzfLua resume<cr>", desc = "Resume Last Search" },
    { "<leader>fq", "<cmd>FzfLua quickfix<cr>", desc = "Quickfix List" },
    { "<leader>fl", "<cmd>FzfLua loclist<cr>", desc = "Location List" },
    { "<leader>fj", "<cmd>FzfLua jumps<cr>", desc = "Jumps" },
    { "<leader>fm", "<cmd>FzfLua marks<cr>", desc = "Marks" },
    { "<leader>fR", "<cmd>FzfLua registers<cr>", desc = "Registers" },
  },

  {
    { "<leader>g", group = "Git (FzfLua)" },
    { "<leader>gs", "<cmd>FzfLua git_status<cr>", desc = "Status" },
    { "<leader>gc", "<cmd>FzfLua git_commits<cr>", desc = "Commits" },
    { "<leader>gb", "<cmd>FzfLua git_branches<cr>", desc = "Branches" },
    { "<leader>gf", "<cmd>FzfLua git_files<cr>", desc = "Files" },
  },

  -- grug-far
  {
    { "<leader>s", group = "Search and Replace" },
    {
      "<leader>ss",
      function()
        require("grug-far").open()
      end,
      desc = "grug-far: open search",
    },
    {
      "<leader>sr",
      function()
        -- Открываем поиск, предварительно заполнив поле текущим словом под курсором
        require("grug-far").open({
          prefills = {
            search = vim.fn.expand("<cword>"),
            replace = vim.fn.expand("<cword>"),
          },
        })
      end,
      mode = { "n", "v" },
      desc = "grug-far: search and replace",
    },
    {
      "<leader>sf",
      function()
        require("grug-far").open({
          prefills = {
            paths = vim.fn.expand("%"), -- Ограничиваем поиск текущим файлом
          },
        })
      end,
      desc = "grug-far: Search and replace in the current file",
    },
  },

  -- Other
  { "<leader>L", "<cmd>Lazy<cr>", desc = "Lazy" },
  { "<leader>M", "<cmd>Mason<cr>", desc = "Mason" },
})
