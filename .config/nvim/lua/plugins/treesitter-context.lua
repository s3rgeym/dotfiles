return {
  "nvim-treesitter/nvim-treesitter-context",
  opts = {
    max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
    mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
  },
}
