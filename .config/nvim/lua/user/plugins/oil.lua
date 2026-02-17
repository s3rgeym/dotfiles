-- Позволяет работать с файлами в обычном буфере как с текстом
-- Можно так же попобовать альтернативу в виде mini-files
return {
  "stevearc/oil.nvim",
  keys = {
    { "-", "<CMD>Oil<CR>", desc = "oil: Open parent directory" },
  },
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
    -- Пропускаем подтверждение для переименования файлов
    skip_confirm_for_simple_edits = true,
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
}
