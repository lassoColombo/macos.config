return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    'rcarriga/nvim-notify',
  },
  keys = {},
  opts = function()
    vim.keymap.set('n', '<leader>1n', function()
      local loglevel = nil
      if vim.g.noice then
        require('noice').disable()
        loglevel = vim.log.levels.WARN
      else
        require('noice').enable()
        loglevel = vim.log.levels.info
      end
      vim.g.noice = not vim.g.noice

      vim.notify('set noice to ' .. tostring(vim.g.noice), loglevel)
    end, { desc = '[T]oggle [N]oice' })
    return {
      lsp = {
        -- :FIXME: disabled for terribly annoying errors in sql files. Cannot manage to disable for filetype
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        -- override = {
        --   ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        --   ['vim.lsp.util.stylize_markdown'] = true,
        --   ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
        -- },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },

      messages = {
        enabled = false, -- enables the Noice messages UI
      },
    }
  end,
}
