return {
  'lervag/vimtex',
  lazy = false, -- lazy-loading will disable inverse search
  config = function()
    vim.g.vimtex_view_method = 'skim'
    vim.g.vimtex_compiler_latexmk = {
      aux_dir = './.latexmk/aux',
      out_dir = './.latexmk/out',
    }
    vim.g.tex_flavor = 'latex'
    vim.o.conceallevel = 1
    vim.g.tex_conceal = 'abdmg'
    vim.g.vimtex_quickfix_mode = 0
  end,
  keys = {
    { '<localLeader>l', '', desc = '+vimtex' },
  },
}
