return {
  'kdheepak/lazygit.nvim',
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  -- optional for floating window border decoration
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    { '<leader>gg', '<cmd>LazyGit<cr>', desc = '[]Lazy[G]it' },
    { '<leader>gf', '<cmd>LazyGitFilterCurrentFile<cr>', desc = '[G]it current [F]ile history' },
  },
  opts = {
    floating_window_winblend = 0, -- " transparency of floating window
    floating_window_scaling_factor = 0.9,--[[   " scaling factor for floating window ]]
    floating_window_use_plenary = 1, -- " use plenary.nvim to manage floating window if available
    use_neovim_remote = 0, -- " fallback to 0 if neovim-remote is not installed

    use_custom_config_file_path = 1, -- " config file path is evaluated if this value is 1
    config_file_path = '~/.config/lazygit/config.yaml', -- " custom config file path
  },
}
