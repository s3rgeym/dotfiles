-- Позволяет работать с файлами в обычном буфере как с текстом
-- Можно так же попобовать альтернативу в виде mini-files
return {
  "stevearc/oil.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "benomahony/oil-git.nvim",
    { "JezerM/oil-lsp-diagnostics.nvim", opts = {} },
  },
  keys = require("user.keymaps").get_keymaps("oil"),
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
  -- Отключаем ленивую загрузку. Это нужно для замены netrw.
  lazy = false,
}
