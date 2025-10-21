-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- NOTE: Configuracions meves

-- Centrar amb el moviment de pàgina
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Center around selected line after page down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Center around selected line after page up' })

-- Afegir línies sense sortir de mode normal
vim.keymap.set('n', 'oi', 'i<Enter><Esc>_', { desc = 'Add line jump before character' })
vim.keymap.set('n', 'oa', 'a<Enter><Esc>_', { desc = 'Add line jump after character' })
vim.keymap.set('n', 'oo', 'm`o<Esc>``', { desc = 'Add line jump below line' })
vim.keymap.set('n', 'OO', 'm`O<Esc>``', { desc = 'Add line jump above line' })

-- Lilypond & LaTeX
vim.diagnostic.config { -- Show diagnostics if errors
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
}

vim.api.nvim_create_autocmd('BufEnter', { -- Better highlights
  command = 'syntax sync fromstart',
  pattern = { '*.ly', '*.ily', '*.tex', '*.texi', '*.texinfo' },
})

vim.api.nvim_create_autocmd('QuickFixCmdPost', { -- Show quickfix if errors, else close window
  command = 'cwindow',
  pattern = '*',
})

-- Inverse search (cmd+shift+click pdf line will focus on the latex line that yields that)
vim.cmd [[
 function! s:TexFocusVim() abort
  " Replace `TERMINAL` with the name of your terminal application
  " Example: execute "!open -a iTerm"  
  " Example: execute "!open -a Alacritty"
  silent execute "!open -a Alacritty"
  redraw!
 endfunction 
 augroup vimtex_event_focus
  au!
  au User VimtexEventViewReverse call s:TexFocusVim()
 augroup END
]]

-- Open terminal through shortcut
vim.keymap.set('n', '<leader>t', ':term ++close<cr>')
vim.keymap.set('t', '<leader>t', '<c-w>:term ++close<cr>')
-- Close terminal through shortcut
vim.keymap.set('n', '<leader>T', ':tab term ++close<cr>')
vim.keymap.set('t', '<leader>T', '<c-w>:tab term ++close<cr>')

-- vim: ts=2 sts=2 sw=2 et
