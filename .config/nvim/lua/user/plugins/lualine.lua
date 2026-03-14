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
        -- section_separators = { left = "\u{e0bc}", right = "\u{e0be}" },
        -- component_separators = { left = "\u{e0bd}", right = "\u{e0bf}" },
        -- section_separators = { left = "", rigth = "" },
        -- component_separators = { left = "│", right = "│" },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            -- fmt = function(v)
            --   return v:sub(1, 3)
            -- end,
          },
        },
        lualine_b = {
          "branch",
          "diff",
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            --sections = { "errors" },
          },
        },
        -- Имя файла есть вверху
        lualine_c = {
          {
            "filename",
            path = 4,
          },
        },

        lualine_x = {
          keymap,
          "lsp_status",
          {
            "encoding",
            -- cond = function()
            --   return vim.bo.fileencoding ~= "utf-8"
            -- end,
          },
          {
            "fileformat",
            -- cond = function()
            --   return vim.bo.fileformat ~= "unix"
            -- end,
          },
          {
            "filetype",
            -- icon_only = true,
          },
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
