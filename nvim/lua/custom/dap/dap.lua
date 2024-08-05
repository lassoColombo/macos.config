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

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<leader>1D', dapui.toggle, { desc = '[T]oggle [D]ebugger ui' })
    vim.keymap.set('n', '-u', dapui.toggle, { desc = '[D]ebugger [U]I' })
    vim.keymap.set('n', '-c', dap.continue, { desc = '[D]ebug [C]ontinue/start' })
    vim.keymap.set('n', '-i', dap.step_into, { desc = '[D]ebug step [I]nto' })
    vim.keymap.set('n', '-o', dap.step_over, { desc = '[D]ebug step [O]ver' })
    vim.keymap.set('n', '-O', dap.step_out, { desc = '[D]ebug step [O]ut' })
    vim.keymap.set('n', '-b', dap.toggle_breakpoint, { desc = '[D]ebug [B]reakpoint' })
    vim.keymap.set('n', '--', dap.toggle_breakpoint, { desc = '[D]ebug [B]reakpoint' })
    vim.keymap.set('n', '-B', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = '[D]ebug conditional [B]reakpoint' })
    vim.keymap.set('n', '-e', function()
      dapui.eval(nil, { enter = true })
    end, { desc = '[D]ebug [E]val' })
    vim.keymap.set('n', '-Q', function()
      dap.disconnect { terminateDebuggee = true }
      dap.close()
      dapui.close()
      vim.notify('quit debug session', vim.log.levels.WARN)
    end, { desc = '[D]ebug [Q]uit' })
    vim.keymap.set('n', '-C', function()
      dap.clear_breakpoints()
      vim.notify('clearing dap breakpoints', vim.log.levels.INFO)
    end, { desc = '[D]ebug [C]lear breakpoints' })
    -- "<cmd>lua require'dap'.disconnect()<CR><cmd>lua require'dap'.close()<CR>",

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
    -- require 'neotest-python'()
    -- :TODO: better configure neotest for python
    -- require("neotest-python")({
    --     -- Extra arguments for nvim-dap configuration
    --     -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
    --     dap = { justMyCode = false },
    --     -- Command line arguments for runner
    --     -- Can also be a function to return dynamic values
    --     args = {"--log-level", "DEBUG"},
    --     -- Runner to use. Will use pytest if available by default.
    --     -- Can be a function to return dynamic value.
    --     runner = "pytest",
    --     -- Custom python path for the runner.
    --     -- Can be a string or a list of strings.
    --     -- Can also be a function to return dynamic value.
    --     -- If not provided, the path will be inferred by checking for
    --     -- virtual envs in the local directory and for Pipenev/Poetry configs
    --     python = ".venv/bin/python",
    --     -- Returns if a given file path is a test file.
    --     -- NB: This function is called a lot so don't perform any heavy tasks within it.
    --     is_test_file = function(file_path)
    --       -- ...
    --     end,
    --     -- !!EXPERIMENTAL!! Enable shelling out to `pytest` to discover test
    --     -- instances for files containing a parametrize mark (default: false)
    --     pytest_discover_instances = true,
    -- })

    vim.fn.sign_define('DapBreakpoint', { text = '✋', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapBreakpointCondition', { text = '🤞', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapLogPoint', { text = '👇', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapStopped', { text = '👉', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapBreakpointRejected', { text = '🖕', texthl = '', linehl = '', numhl = '' })
  end,
}
