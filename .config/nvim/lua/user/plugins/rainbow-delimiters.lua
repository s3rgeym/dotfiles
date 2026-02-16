return {
  "HiPhish/rainbow-delimiters.nvim",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = function()
    local rb = require("rainbow-delimiters")

    local colors = {
      RainbowRed = { fg = "#E06C75" },
      RainbowYellow = { fg = "#E5C07B" },
      RainbowBlue = { fg = "#61AFEF" },
      RainbowOrange = { fg = "#D19A66" },
      RainbowGreen = { fg = "#98C379" },
      RainbowViolet = { fg = "#C678DD" },
      RainbowCyan = { fg = "#56B6C2" },
    }

    for group, settings in pairs(colors) do
      vim.api.nvim_set_hl(0, group, settings)
    end

    require("rainbow-delimiters.setup").setup({
      strategy = {
        [""] = rb.strategy.global,
        vim = rb.strategy["local"],
      },
      query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
      },
      highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      },
    })
  end,
}
