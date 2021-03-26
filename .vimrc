set laststatus=2
set number
set relativenumber
set hlsearch
set cursorline
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

Plug 'tomasiser/vim-code-dark'

Plug 'Valloric/YouCompleteMe'
nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gr :YcmCompleter GoToDeclaration<CR>
let g:ycm_complete_in_comments=1
let g:ycm_autoclose_preview_window_after_completion=1

Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

Plug 'derekwyatt/vim-fswitch'
nmap <silent> <Leader>sw :FSHere<cr>

Plug 'kshenoy/vim-signature'
Plug 'preservim/nerdcommenter'
Plug 'fholgado/minibufexpl.vim'
Plug 'karmenzind/vim-tmuxlike'
nmap <leader><leader> <Plug>(tmuxlike-prefix)

call plug#end()

colorscheme codedark
syntax enable
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
nnoremap <C-n> :NERDTree<CR>

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

" Mappings to access buffers (don't use "\p" because a
" " delay before pressing "p" would accidentally paste).
" " \l       : list buffers
" " \b \f \g : go back/forward/last-used
" " \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
" It's useful to show the buffer number in the status line.
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
