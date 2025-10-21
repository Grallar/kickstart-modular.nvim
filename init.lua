--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]
require 'lazy-plugins'

-- LuaSnip
-- local ls = require 'luasnip'
-- vim.keymap.set({ 'i' }, '<Tab>', function() ls.expand {} end, { silent = true })
-- vim.keymap.set({ 'i', 's' }, '<Tab>', function() ls.jump(1) end, { silent = true })
-- vim.keymap.set({ 'i', 's' }, '<S-Tab>', function() ls.jump(-1) end, { silent = true })

-- vim.keymap.set({ 'i', 's' }, '<C-E>', function() if ls.choice_active() then ls.change_choice(1) end end, { silent = true })
vim.cmd [[
imap <silent><expr> <Tab> luasnip#expandable() ? '<Plug>luasnip-expand-snippet' : '<Tab>' 

imap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : 'jk'
smap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : 'jk'

nnoremap <leader>L <Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})<CR>
]]
require('luasnip').config.set_config { -- Setting LuaSnip config

  -- Enable autotriggered snippets
  enable_autosnippets = true,

  -- Use Tab (or some other key if you prefer) to trigger visual selection
  store_selection_keys = '<Tab>',

  -- Auto-update repeated nodes as you type
  update_events = 'TextChanged,TextChangedI',
}

require('luasnip.loaders.from_lua').load { paths = { '~/.config/nvim/lua/custom/luasnippets' } }

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
