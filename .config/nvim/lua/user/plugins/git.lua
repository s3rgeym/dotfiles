return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    "tpope/vim-fugitive",
    --cmd = { "Git", "G", "Gdiff", "Gblame", "Gcommit", "Gstatus", "Glog" },
  },
}
