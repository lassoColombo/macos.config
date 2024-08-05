return {
  event = 'BufEnter',
  'akinsho/bufferline.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  keys = {
    { 'L', '<cmd>BufferLineCycleNext<CR>', desc = 'Next buffer' },
    { ']b', '<cmd>BufferLineCycleNext<CR>', desc = 'Next buffer' },
    { 'H', '<cmd>BufferLineCyclePrev<CR>', desc = 'Previous buffer' },
    { '[b', '<cmd>BufferLineCyclePrev<CR>', desc = 'Previous buffer' },
  },
  opts = function()
    return {}
  end,
}
