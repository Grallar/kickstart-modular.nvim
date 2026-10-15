return {
  'lervag/vimtex',
  lazy = false, -- lazy-loading will disable inverse search
  config = function()
    vim.g.vimtex_view_method = 'skim'
    vim.g.vimtex_compiler_latexmk = {
      aux_dir = './.latexmk/aux',
      -- TODO: rework out_dir to put the pdf into the folder and the rest into .latexmk/out
      out_dir = function(file_info)
        local head, tail = string.find(file_info.target, '%.%a+$')
        vim.print(file_info.target)
        if head and string.sub(file_info.target, head, tail) == '.pdf' then
          return '.'
        end
        return './.latexmk/out'
      end,
      options = {
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
        '-jobname=' .. vim.fn.expand '%:p:h:t',
      },
    }
    vim.g.tex_flavor = 'latex'
    vim.o.conceallevel = 2
    vim.g.tex_conceal = 'abdmg'
    vim.g.vimtex_quickfix_open_on_warning = 0
    vim.g.vimtex_quickfix_ignore_filters = {}
  end,
  keys = {
    { '<localLeader>l', '', desc = '+vimtex' },
  },
}
