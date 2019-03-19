set nocompatible
set encoding=utf-8
set mouse=a
set title
set backspace=indent,eol,start
set nowrap

set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set smarttab
set smartindent
autocmd FileType go setlocal shiftwidth=4 tabstop=4
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab

set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap ,<space> :DeleteTrailingWhitespace<CR>:noh<cr>
hi SpecialKey cterm=none ctermfg=9

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  " Use vundle to update vundle
  Plugin 'VundleVim/Vundle.vim'

  " themes
  Plugin 'dracula/vim'
  " Plugin 'tomasr/molokai'
  " Plugin 'NLKNguyen/papercolor-theme'
  " Plugin 'nanotech/jellybeans.vim'
  "
  " Autocomplete
  " Plugin 'Shougo/deoplete.nvim'
  "   " Shim nvim stuff for deoplete
  "   Plugin 'roxma/nvim-yarp'
  "   Plugin 'roxma/vim-hug-neovim-rpc'
  "   " config Deoplete
  "   " start at startup
  "   let g:deoplete#enable_at_startup = 1
  "   " use tab for completion
  "   set list
  "   set listchars=tab:›\ ,trail:•
  "   inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

  " lets you use gcc for comenting things
  Plugin 'tpope/vim-commentary'

  " gives :DeleteTrailingWhitespace
  Plugin 'vim-scripts/DeleteTrailingWhitespace'

  " align stuff
  Plugin 'vim-scripts/Align'

  " Nerd tree woot woot
  Plugin 'scrooloose/nerdtree'
    nmap ,e :NERDTreeToggle<cr>
    let NERDTreeShowHidden=1
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  " git stuff
  Plugin 'tpope/vim-fugitive'

  " Git status in the column
  Plugin 'airblade/vim-gitgutter'
    let g:gitgutter_max_signs = 500
    let g:gitgutter_map_keys = 0
    let g:gitgutter_sign_added = '::'
    let g:gitgutter_sign_modified = '::'
    let g:gitgutter_sign_removed = '::'
    let g:gitgutter_sign_modified_removed = '::'
    set signcolumn=no

  " ctrl-p like situation
  Plugin 'mileszs/ack.vim'
  Plugin 'junegunn/fzf'
    nmap ,; :FZF<cr>

  " Language support
  " Plugin 'sheerun/vim-polyglot'
  Plugin 'rust-lang/rust.vim'
  Plugin 'pangloss/vim-javascript'
  Plugin 'elixir-editors/vim-elixir'
  Plugin 'fishcakez/vim-erlang'

  " code checks, find mistakes, in the background
  Plugin 'sbdchd/neoformat'
    augroup fmt
      autocmd!
      " autocmd BufWritePre,TextChanged,InsertLeave *.js undojoin | Neoformat
      autocmd BufWritePre * Neoformat
    augroup END

call vundle#end()
filetype plugin indent on

set background=dark
colorscheme dracula
syntax enable
hi Normal ctermbg=None
hi EndOfBuffer ctermbg=NONE ctermfg=15
hi Visual ctermbg=5 ctermfg=0
hi CursorLineNr ctermbg=NONE ctermfg=3
hi CursorLine ctermbg=NONE
hi SignColumn ctermbg=NONE
hi GitGutterAdd cterm=Bold ctermbg=NONE ctermfg=64
hi GitGutterDelete cterm=Bold ctermbg=NONE ctermfg=9
hi GitGutterChange cterm=Bold ctermbg=NONE ctermfg=6
hi GitGutterChangeDelete cterm=Bold ctermbg=NONE ctermfg=11
hi VertSplit cterm=NONE ctermbg=NONE ctermfg=235
hi StatusLine cterm=NONE ctermbg=NONE ctermfg=235
hi StatusLineNC cterm=NONE ctermbg=NONE ctermfg=235
hi EndOfBuffer ctermfg=235
hi NonText ctermbg=NONE ctermfg=8
hi Folded ctermbg=NONE ctermfg=8
hi NERDTreeDir cterm=NONE
hi TabLine cterm=NONE ctermbg=NONE ctermfg=8
hi TabLineFill cterm=NONE ctermbg=NONE
hi TabLineSel cterm=NONE cterm=Bold ctermbg=NONE ctermfg=61
hi! link yamlKey DraculaPink

" Autocomplete Menu
hi Pmenu ctermbg=220 ctermfg=0
hi PmenuSel cterm=Bold ctermbg=0 ctermfg=220
hi PmenuSbar ctermbg=220 ctermfg=220
hi PmenuThumb ctermbg=0 ctermfg=0

set fillchars=stl:═,stlnc:─,vert:\ ,fold:─,diff:-
set fillchars+=vert:│
set autoindent
set nobackup
set nowritebackup
set noswapfile
set backupcopy=yes
set directory-=.
set hidden
set viminfo='1000,<0,@0,/0 " dont remeber things that can compromise data
set shiftround
set scrolloff=3
set ttyfast
set fileformats=unix,mac,dos
set wildmenu
set wildmode=longest,list,full
set wildignore+=/tmp/*,*.so,*.swp,*.zip,/log/*,/target/*,*.rbc
" set omnifunc=syntaxcomplete#Complete
set autoread
set noerrorbells
set novisualbell
set cursorline

" " Folding
" set foldmethod=syntax
" set foldnestmax=10
" set nofoldenable
" set foldlevel=2
" function! NeatFoldText()
"     let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
"     let lines_count = v:foldend - v:foldstart + 1
"     let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
"     let foldchar = matchstr(&fillchars, 'fold:\zs.')
"     let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
"     let foldtextend = lines_count_text . repeat(foldchar, 8)
"     let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
"     return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
" endfunction
" set foldtext=NeatFoldText()
" nnoremap <Space> za

map ; :
nnoremap ,t :tabnew<cr>

" function! s:RemoveConflictingAlignMaps()
"   if exists("g:loaded_AlignMapsPlugin")
"     AlignMapsClean
"   endi
" endfunction
" command! -nargs=0 RemoveConflictingAlignMaps call s:RemoveConflictingAlignMaps()
" silent! autocmd VimEnter * RemoveConflictingAlignMaps

" spell check git commits
if has('autocmd')
  if has('spell')
    au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell
  endif
endif

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
au CursorHold,CursorHoldI * checktime

let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'json=javascript', 'ruby', 'elixir', 'erlang', 'rust']

set exrc
set secure
