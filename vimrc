function! PackInit() abort
    " Initialize the minpac plugin
    packadd minpac
    call minpac#init()
    " Call other plug-ins
    " ------------------------------------------------------------------------------------------------
    " package (plug-in) manager for vim 8
    call minpac#add('k-takata/minpac', {'type': 'opt'})
    " current nice colour scheme
    call minpac#add('lifepillar/vim-solarized8', {'type': 'opt'})
    " bunch of key mappings by Tim Pope
    call minpac#add('tpope/vim-unimpaired')
    " git wrapper
    call minpac#add('tpope/vim-fugitive')
    " enables :Gbrowse
    call minpac#add('tpope/vim-rhubarb')
    " indicates differences relative to previous commit
    call minpac#add('mhinz/vim-signify')
    " operate surrounding brackets: e.g. cs'
    call minpac#add('tpope/vim-surround')
    " make dot command work for plug-in mappings
    call minpac#add('tpope/vim-repeat')
    " mappings for un/commenting lines
    " call minpac#add('tpope/vim-commentary')
    call minpac#add('tomtom/tcomment_vim')
    " substituting multiple words with different endings and beginnings
    call minpac#add('tpope/vim-abolish')
    " Auto complete with tab (replace C-n)
    call minpac#add('ervandew/supertab')
    " Syntax for programming languages (e.g. C++, python)
    call minpac#add('vim-syntastic/syntastic')
    " File system explorer
    call minpac#add('preservim/nerdtree')
    " Showing git status in nerdree
    call minpac#add('Xuyuanp/nerdtree-git-plugin')
    " mappings to resize window
    call minpac#add('roxma/vim-window-resize-easy')
    " Asynchronous running for vim 8
    call minpac#add('skywind3000/asyncrun.vim')
    " Highlight 1st searchable letter
    call minpac#add('unblevable/quick-scope')
    " Grammatical corrections
    call minpac#add('rhysd/vim-grammarous')
    " Use * to search in visual mode
    call minpac#add('nelstrom/vim-visual-star-search')
    " Search with ack
    call minpac#add('mileszs/ack.vim')
    " mapping for vim
    call minpac#add('lervag/vimtex')
    " A code-completion engine
    call minpac#add('ycm-core/YouCompleteMe')
    " Use Ctrl to navigate windows
    call minpac#add('christoomey/vim-tmux-navigator')
    " Fuzzy finder plug-in for opening files
    call minpac#add('junegunn/fzf')
    " fzf plug-in for vim
    call minpac#add('junegunn/fzf.vim')
    " finding files semantically
    call minpac#add('tpope/vim-projectionist')
    " for asynchronous tools
    call minpac#add('tpope/vim-dispatch')
    " for asynchronous tools for neovim
    call minpac#add('radenling/vim-dispatch-neovim')
    " for adding Snippets
    call minpac#add('sirver/ultisnips')
    " ------------------------------------------------------------------------------------------------
endfunction
" Define user commands for updating/cleaning the plugins.
" Each of them calls PackInit() to load minpac and register
" the information of plugins, then performs the task.
command! PackUpdate call PackInit() | call minpac#update()
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

" ------------------------------------------------------------------------------------------------
" Open and Source .vimrc
nnoremap <leader>ev :tabnew ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>
" ------------------------------------------------------------------------------------------------
"  Some general configurations
"  Install matchit plugin that extends the use of % to words
packadd! matchit
" Allow jump between buffers without prompting error message
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" default updatetime 4000ms is not good for async update
set updatetime=100
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Automatically change the directory to current
" set autochdir
" Easy Expansion of the Active File Directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" Erase past insert mode
" set backspace+=nostop
" Increase history of ex commands
set history=200
" Set smart case sensitivity
set ignorecase
set smartcase
set infercase " infer case in autocompletion 
" Automatically execute ctags each time a file is saved
autocmd BufWritePost * call system("ctags -R")
" ------------------------------------------------------------------------------------------------
" More natural split opening
set splitbelow
set splitright
" Encoding
set encoding=utf-8
" ------------------------------------------------------------------------------------------------
" Set the numbers of the lines in the first column"
set number relativenumber
" ------------------------------------------------------------------------------------------------
" Set incremental search when using /
set incsearch
set hlsearch
" Map to cancel search highlight temporarily with double <esc>
nnoremap <esc><esc> :noh<return>
" ------------------------------------------------------------------------------------------------
" Set spell check to British
syntax on
" set spell spelllang=en
"set spell spelllang=pt
set spell spelllang=en_gb
" ------------------------------------------------------------------------------------------------
" auto tab after moving line
filetype plugin indent on
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab
" ------------------------------------------------------------------------------------------------
" Set tabs ans eol's visible"
set list
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
" Invisible character colors 
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
" ------------------------------------------------------------------------------------------------
"  vim-system-copy
let g:system_copy#copy_command='xclip -sel clipboard -o'
" ------------------------------------------------------------------------------------------------
" Set vim to use the Tab in auto-completion similar to bash (without this use <ctrl-d>)"
" set wildmode=longest,list
" Set vim to use the Tab in auto-completion similar to zsh
set wildmenu
set wildmode=full
" ------------------------------------------------------------------------------------------------
" Display name of the current file
set laststatus=2
" ------------------------------------------------------------------------------------------------
" Close and open preview window
function! PreviewWindowOpened()
    for nr in range(1, winnr('$'))
        if getwinvar(nr, "&ft") == "qf"
            " found a preview
            return 1
        endif  
    endfor
    return 0
endfun
nnoremap <silent> <expr> <Leader>c g:PreviewWindowOpened() ? "\:cclose<CR>" : "\:copen<CR>"
" ------------------------------------------------------------------------------------------------
" supertab:
" ------------------------------------------------------------------------------------------------
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabCrMapping = 0
" ------------------------------------------------------------------------------------------------
" YouCompleteMe
" ------------------------------------------------------------------------------------------------
" auto close the completion window
"" fun! GoYCM()
" nnoremap <buffer> <silent> <leader>gd :YcmCompleter GoTo<CR>
" nnoremap <buffer> <silent> <leader>gr :YcmCompleter GoToReferences<CR>
" nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorRename<space>
" nnoremap <buffer> <silent> <leader>d :YcmCompleter GetDoc<CR>
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_auto_hover = ''
set completeopt-=preview
nnoremap <buffer> <silent> <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" ------------------------------------------------------------------------------------------------
" UltiSnips
" ------------------------------------------------------------------------------------------------
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger="<CR>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="horizontal"
" ------------------------------------------------------------------------------------------------
" vim-solarized8
" ------------------------------------------------------------------------------------------------
colorscheme solarized8
set background=dark
" ------------------------------------------------------------------------------------------------
"  nerdtree
" ------------------------------------------------------------------------------------------------
let g:NERDTreeAutoDeleteBuffer=1
" open nerdtree when opening the file
" autocmd vimenter * NERDTree
" close nerdtree window when closing last vim window
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTre") && b:NERDTree.isTabTree()) | q | endif
" Open nerd tree at the current file or close nerd tree if pressed again.
nnoremap <silent> <expr> <Leader>n g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
" put this in your .vimrc
let NERDTreeIgnore=['\.aux$', '\.auxlock$', '\.bcf$', '\.log$', '\.nav$', '\.out$', '\.run.xml$', '\.snm$', '\.toc$', '\.dpth$', '\.acn$', '\.acr$', '\.alg$', '\.bbl$', '\.blg$', '\.glg$', '\.glg$', '\.glo$', '\.gls$', '\.ilg$', '\.ist$', '\.lof$', '\.lot$', '\.nlo$', '\.nls', '\.png', '\.mp4']
" ------------------------------------------------------------------------------------------------
"  nerdtree-git-plugin
" ------------------------------------------------------------------------------------------------
let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0
" ------------------------------------------------------------------------------------------------
"  asyncrun
" ------------------------------------------------------------------------------------------------
autocmd Filetype python nnoremap <leader>x :AsyncRun python3 %<CR>
autocmd Filetype tex,cpp nnoremap <leader>mm :AsyncRun make<CR>
autocmd Filetype cpp nnoremap <leader>mx :AsyncRun make exec<CR>
autocmd Filetype tex,cpp nnoremap <leader>mc :AsyncRun make clean<CR>
autocmd Filetype tex,cpp nnoremap <leader>mb :AsyncRun make bib<CR>
" ------------------------------------------------------------------------------------------------
" quick-scope
" ------------------------------------------------------------------------------------------------
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" ------------------------------------------------------------------------------------------------
" fzf
" ------------------------------------------------------------------------------------------------
" search files
nnoremap <C-p> :<C-u>Files<CR>
" ------------------------------------------------------------------------------------------------
" fzf.vim
" ------------------------------------------------------------------------------------------------
let $FZF_DEFAULT_OPTS = "--reverse --preview='bat --color=always --style=numbers {}' --bind ctrl-p:preview-page-up,ctrl-n:preview-page-down"
