-- Позволяет работать с файлами в обычном буфере как с текстом
-- Можно так же попобовать альтернативу в виде mini-files
return {
  "stevearc/oil.nvim",
  opts = {
    default_file_explorer = true,
    columns = {
      "icon",
      -- "permissions",
      -- "size",
      -- "mtime",
    },
    view_options = {
      show_hidden = true,
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
}
