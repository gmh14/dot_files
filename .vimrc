set laststatus=2
set number
set relativenumber
set hlsearch
filetype plugin on
command D :normal iimport pdb; pdb.set_trace()

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tell-k/vim-autopep8'
let g:autopep8_max_line_length=150
let g:autopep8_disable_show_diff=1
let g:autopep8_ignore="E501"
Plug 'kien/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'tomasiser/vim-code-dark'
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_complete_in_comments=1
let g:ycm_autoclose_preview_window_after_completion=1

call plug#end()

colorscheme codedark
syntax enable

hi Search ctermbg=LightYellow
" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

set encoding=utf-8

