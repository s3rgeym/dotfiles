-- Search and Replace
return {
  "MagicDuck/grug-far.nvim",
  keys = {
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
            replace = vim.fn.expand("<cword>"),
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
  config = function()
    -- optional setup call to override plugin options
    -- alternatively you can set options with vim.g.grug_far = { ... }
    require("grug-far").setup({
      -- options, see Configuration section below
      -- there are no required options atm
    })
  end,
}
