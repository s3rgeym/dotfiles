local g = vim.g

-- Клавишу leader надо объявить до загрузки плагинов
g.mapleader = " "
g.maplocalleader = g.mapleader

if vim.fn.has("termguicolors") == 1 then
  -- Некоторые плагины могут неправильно работать, если не установить это значение
  vim.opt.termguicolors = true
end

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("user.plugins")
require("user.options")
require("user.autocmds")
