return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    vim.opt.showmode = false

    local show_keymap = function()
      return vim.opt.iminsert:get() > 0 and vim.b.keymap_name or ""
    end

    require("lualine").setup({
      options = {
        globalstatus = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_x = { show_keymap, "encoding", "fileformat", "filetype", "lsp_status" },
      },
      tabline = {
        lualine_a = { "buffers" },
        lualine_z = {
          {
            "tabs",
            cond = function()
              return vim.fn.tabpagenr("$") > 1
            end,
          },
        },
      },
    })
  end,
}
