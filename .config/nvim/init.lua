local g = vim.g

-- Клавишу leader надо объявить до загрузки плагинов
g.mapleader = ' '
g.maplocalleader = g.mapleader

if vim.fn.has('termguicolors') == 1 then
  -- Некоторые плагины могут неправильно работать, если не установить это значение
  vim.opt.termguicolors = true
end

-- Плагины и их настройка
require("user.plugins")
require("user.lsp")
require("user.treesitter")
require("user.autopairs")
require("user.gitsigns")

-- Настройки должны идти после плагинов, так как те могут их переопределить
require("user.options")
require("user.keymaps")
require("user.autocmds")
