local function keymap()
  if vim.opt.iminsert:get() > 0 and vim.b.keymap_name ~= "" then
    return "⌨ " .. vim.b.keymap_name
  end
  return ""
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    vim.opt.showmode = false

    require("lualine").setup({
      options = {
        globalstatus = true,
        -- component_separators = { left = '', right = ''},
        -- component_separators = { left = "│", right = "│" },
        -- component_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },
        -- section_separators = { left = '', right = '' },
        -- section_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        -- section_separators = { left = '', right = ''},
      },
      sections = {
        lualine_x = {
          keymap,
          -- Скрываем кодировку и окончания, если они дефолт = UTF-8/LF
          {
            "encoding",
            cond = function()
              return vim.bo.fileencoding ~= "utf-8"
            end,
          },
          {
            "fileformat",
            cond = function()
              return vim.bo.fileformat ~= "unix"
            end,
          },
          {
            "filetype",
            icon_only = true,
          },
          "lsp_status",
        },

        lualine_y = { "progress" },
        lualine_z = { "location" },
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
