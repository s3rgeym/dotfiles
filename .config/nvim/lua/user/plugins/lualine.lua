local function keymap()
  if vim.opt.iminsert:get() > 0 and vim.b.keymap_name ~= "" then
    return "\u{f11c} " .. vim.b.keymap_name
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
        -- https://github.com/ryanoasis/powerline-extra-symbols/blob/master/img/fontforge.png
        section_separators = { left = "\u{e0b8}", right = "\u{e0ba}" },
        component_separators = { left = "\u{e0b9}", right = "\u{e0bb}" },
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
