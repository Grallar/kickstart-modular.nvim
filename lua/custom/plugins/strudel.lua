return {
  'gruvw/strudel.nvim',
  build = 'npm ci',
  config = function()
    require('strudel').setup()
  end,
  keys = {
    { '<leader>S', desc = 'Strudel.nvim' },
    { '<leader>Sl', '<cmd>StrudelLaunch<CR>', desc = 'Launch Strudel' },
    { '<leader>Sq', '<cmd>StrudelQuit<CR>', desc = 'Quite Strudel' },
    { '<leader>St', '<cmd>StrudelToggle<CR>', desc = 'Toggle Strudel playbak' },
    { '<leader>Su', '<cmd>StrudelUpdate<CR>', desc = 'Launch Strudel' },
    { '<leader>Ss', '<cmd>StrudelStop<CR>', desc = 'Stop Strudel playback' },
    { '<leader>Sb', '<cmd>StrudelSetBuffer<CR>', desc = 'Set Strudel buffer to current' },
    { '<leader>Sx', '<cmd>StrudelExecute<CR>', desc = 'Set Buffer and Update Strudel' },
  },
}
