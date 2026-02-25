-- Позволяет работать с файлами в обычном буфере как с текстом
-- Можно так же попобовать альтернативу в виде mini-files
return {
  "stevearc/oil.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "benomahony/oil-git.nvim",
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
    skip_confirm_for_simple_edits = true,
    prompt_save_on_select_new_entry = false,
  },
  lazy = false,
}
