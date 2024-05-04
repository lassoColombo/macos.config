return {
  event = 'BufEnter',
  'akinsho/bufferline.nvim',
  dependencies = 'kyazdani42/nvim-web-devicons',
  keys = {
    { 'L', '<cmd>BufferLineCycleNext<CR>', desc = 'Next buffer' },
    { 'H', '<cmd>BufferLineCyclePrev<CR>', desc = 'Previous buffer' },
  },
  opts = function()
    return {}
  end,
}
