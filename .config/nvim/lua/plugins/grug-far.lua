-- Search and Replace
return {
  "MagicDuck/grug-far.nvim",
  -- config = function()
  --   -- optional setup call to override plugin options
  --   -- alternatively you can set options with vim.g.grug_far = { ... }
  --   require("grug-far").setup({
  --     -- options, see Configuration section below
  --     -- there are no required options atm
  --   })
  -- end,
  opts = {},
  keys = {
    {
      "<leader>sr",
      function()
        -- local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
        require("grug-far").open({
          transient = true,
          prefills = {
            -- ripgrep из репы арча не понимает шаблоны типа "*.lua"
            -- filesFilter = ext and "*." .. ext or nil,
          },
        })
      end,
      desc = "Search and Replace (grug-far)",
    },
  },
}
