return {
  {
    'akinsho/bufferline.nvim',
    -- Не работает
    -- after = "solarized.nvim",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        separator_style = "slant",
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            separator = true,
            text_align = "left",
          },
        },
      }
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = 'nvim-tree/nvim-web-devicons',
    -- Функция config нужна
    config = function()
      require('lualine').setup({
        options = {
          disabled_filetypes = {
            -- statusline = { "neo-tree" },
          }
        },
        sections = {
          lualine_c = {
            'filename',
            'lsp_status',
          },
          lualine_x = {
            -- Добавим отображение раскладки
            {
              function()
                if vim.opt.iminsert:get() > 0 and vim.b.keymap_name then
                  return '⌨ ' .. vim.b.keymap_name
                end
                return ''
              end,
              cond = function() -- Показывать только если раскладка активна
                return vim.opt.iminsert:get() > 0 and vim.b.keymap_name ~= nil
              end,
            },
            'encoding',
            'fileformat',
            'filetype',
          }
        }
      })
    end,
  },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  -- },
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   lazy = false,
  --   priority = 1000,
  -- },
  {
    "maxmx03/solarized.nvim",
    lazy = false,
    priority = 1000,
    -- Без config и строчек выше bufferline не похватывает тему
    config = function()
      if vim.opt.termguicolors then
        vim.cmd [[
          colorscheme solarized
          " Прозрачность (проблемы с bufferline)
          "hi Normal ctermbg=NONE guibg=NONE
          "hi NonText ctermbg=NONE guibg=NONE
        ]]
      else
        vim.cmd.color('desert')
      end
    end
  },
}
