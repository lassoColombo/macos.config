-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,
      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},
      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        'debugpy',
        'delve',
      },
    }

    vim.keymap.set('n', '<leader><leader>tD', dapui.toggle, { desc = '[T]oggle [D]AP UI' })
    vim.keymap.set('n', '<leader>dc', dap.continue, { desc = '[D]ebug [C]ontinue/start' })
    vim.keymap.set('n', '<leader>di', dap.step_into, { desc = '[D]ebug step [I]nto' })
    vim.keymap.set('n', '<leader>do', dap.step_over, { desc = '[D]ebug step [O]ver' })
    vim.keymap.set('n', '<leader>dO', dap.step_out, { desc = '[D]ebug step [O]ut' })
    vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = '[D]ebug [B]reakpoint' })
    vim.keymap.set('n', '<leader>dB', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = '[D]ebug conditional [B]reakpoint' })
    vim.keymap.set('n', '<leader>de', function()
      dapui.eval(nil, { enter = true })
    end, { desc = '[D]ebug [E]val' })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸️',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<leader>dr', dapui.toggle, { desc = '[D]ebug [R]estore session' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    require('nvim-dap-virtual-text').setup()

    -- laungage specific configs
    require('dap-go').setup {
      delve = {
        detached = true,
      },
    }
    require('dap-python').setup 'python'

    vim.fn.sign_define('DapBreakpoint', { text = '✋', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapBreakpointCondition', { text = '🤞', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapLogPoint', { text = '👇', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapStopped', { text = '👉', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapBreakpointRejected', { text = '🖕', texthl = '', linehl = '', numhl = '' })
  end,
}