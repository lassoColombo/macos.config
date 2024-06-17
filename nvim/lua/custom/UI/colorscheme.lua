-- colorscheme
return {
  'folke/tokyonight.nvim',
  priority = 1000, -- make sure to load this before all the other start plugins
  init = function()
    vim.cmd.colorscheme 'tokyonight-night'
    vim.cmd.hi 'Comment gui=none'
  end,
  opts = {
    transparent = true,
    styles = {
      sidebars = 'transparent',
      floats = 'transparent',
    },
  },
}
