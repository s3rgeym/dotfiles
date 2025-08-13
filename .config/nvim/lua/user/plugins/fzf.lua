return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  cmd = "FzfLua",
  opts = function(_, opts)
    local actions = require("fzf-lua.actions")
    opts.grep = vim.tbl_deep_extend("force", opts.grep or {}, {
      actions = {
        ["ctrl-g"] = false, -- ctrl-g используется в zellij
        ["alt-g"] = actions.grep_lgrep,
      },
    })
    return opts
  end,
}
