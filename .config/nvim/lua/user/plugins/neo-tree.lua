-- Файловый менеджер
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  -- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/lua/neo-tree/defaults.lua
  opts = {
    source_selector = {
      winbar = true,
      content_layout = "center", -- "start", "center", "end"
      sources = {
        { source = "filesystem", display_name = "󰉓 Files" },
        { source = "buffers", display_name = " Buffers" },
        { source = "git_status", display_name = " Git" },
        { source = "document_symbols", display_name = " Symbols" },
      },
    },
    sources = {
      "filesystem",
      "buffers",
      "git_status",
      "document_symbols",
    },
    -- Без автозакрытия в сессии [No Name] появляется
    event_handlers = {
      {
        event = "file_open_requested",
        handler = function()
          -- auto close
          -- vim.cmd("Neotree close")
          -- OR
          require("neo-tree.command").execute({ action = "close" })
        end
      },
    },
    filesystem = {
      filtered_items = {
        visible = true,
      },
    },
  },
}
