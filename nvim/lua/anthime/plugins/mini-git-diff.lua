return {
  {
    'nvim-mini/mini.diff',
    version = '*',
    config = function()
      require('mini.diff').setup({
		  style = 'sign',
      })
    end,
  },
}
