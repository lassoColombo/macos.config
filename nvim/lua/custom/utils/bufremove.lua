local function close_prompt_saving()
  local bd = require('mini.bufremove').delete
  if vim.bo.modified then
    local choice = vim.fn.confirm(('Save changes to %q?'):format(vim.fn.bufname()), '&Yes\n&No\n&Cancel')
    if choice == 1 then -- Yes
      vim.cmd.write()
      bd(0)
    elseif choice == 2 then -- No
      bd(0, true)
    end
  else
    bd(0)
  end
end

return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.bufremove',
  version = false,
  keys = {
    {
      '<leader>bq',
      close_prompt_saving,
      desc = '[B]uffer [Q]uit',
    },
    {
      '<leader>bQ',
      function()
        require('mini.bufremove').delete(0, true)
      end,
      desc = '[B]uffer [Q]uit force',
    },
    {
      '<leader>B',
      close_prompt_saving,
      desc = '[B]uffer close',
    },
  },
}
