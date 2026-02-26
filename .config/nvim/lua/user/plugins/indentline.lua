return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
  config = function()
    require("ibl").setup({
      indent = {
        -- "╎", "┆", "┊", "▏", "·"
        char = "▏",
        --tab_char = "│",
      },
      -- scope = {
      --   enabled = true,
      --   char = "█",
      --   show_start = false,
      --   show_end = false,
      -- },
      exclude = {
        filetypes = {
          "help",
          "terminal",
          "lazy",
          "lspinfo",
          "mason",
          "Neotree",
          "packer",
          "checkhealth",

          "Trouble",
          "DressingInput",
          "DressingSelect",
        },
      },
    })
  end,
}
