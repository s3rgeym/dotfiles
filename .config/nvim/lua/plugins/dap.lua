return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "mason-org/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
      local dap = require("dap")
      local ui = require("dapui")
      local map = require("utils").map

      require("dapui").setup()
      require("nvim-dap-virtual-text").setup({})

      require("mason-nvim-dap").setup({
        ensure_installed = {
          "python",
          "delve",
        },
        automatic_installation = true,
        handlers = {},
      })

      -- Иконки для точек остановки
      -- vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
      -- vim.fn.sign_define("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
      -- vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

      -- Автоматическое открытие/закрытие UI
      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end

      -- Keymaps через utils.map
      map("n", "<leader>db", dap.toggle_breakpoint, "Debug: Toggle Breakpoint")
      map("n", "<leader>dc", dap.continue, "Debug: Continue")
      map("n", "<leader>di", dap.step_into, "Debug: Step Into")
      map("n", "<leader>do", dap.step_over, "Debug: Step Over")
      map("n", "<leader>dO", dap.step_out, "Debug: Step Out")
      map("n", "<leader>dt", dap.terminate, "Debug: Terminate")
      map("n", "<leader>dr", dap.repl.toggle, "Debug: Toggle REPL")
      map("n", "<leader>dl", dap.run_last, "Debug: Run Last")
      map("n", "<leader>du", ui.toggle, "Debug: Toggle UI")

      -- F-keys (совместимые с Alacritty/Neovim)
      map("n", "<F5>", dap.continue, "Debug: Continue")
      map("n", "<F10>", dap.step_over, "Debug: Step Over")
      map("n", "<F11>", dap.step_into, "Debug: Step Into")
      map("n", "<F12>", dap.step_out, "Debug: Step Out")
    end,
  },
}
