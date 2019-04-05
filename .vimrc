" Common
set shiftwidth=4
set tabstop=4
set expandtab
set number
set noswapfile
set selection=exclusive
set autoindent
set autoread
set showcmd
set nocompatible
set relativenumber
set nrformats-=octal
set backspace=2


set nocompatible              " be iMproved, required
filetype off                  " required

" 启用vundle来管理vim插件
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 安装插件写在这之后

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-syntastic/syntastic'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'sjl/gundo.vim'
Plugin 'mattn/emmet-vim'
Plugin 'Raimondi/delimitMate'
Plugin 'szw/vim-maximizer'
Plugin 'godlygeek/tabular'
Plugin 'SirVer/ultisnips'
Plugin 'suan/vim-instant-markdown'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'nelstrom/vim-qargs'
Plugin 'dkprice/vim-easygrep'
Plugin 'rhysd/vim-grammarous'
Plugin 'junegunn/vim-easy-align'
Plugin 'terryma/vim-multiple-cursors'

" 安装插件写在这之前
call vundle#end()            " required
filetype plugin on    " required

" 常用命令
" :PluginList       - 查看已经安装的插件
" :PluginInstall    - 安装插件
" :PluginUpdate     - 更新插件
" :PluginSearch     - 搜索插件，例如 :PluginSearch xml就能搜到xml相关的插件
" :PluginClean      - 删除插件，把安装插件对应行删除，然后执行这个命令即可

" Closetag script
autocmd Filetype html let g:closetag_html_style=1
autocmd Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim
autocmd FileType ruby,yaml setl nowrap sw=2 sts=2 et
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd FileType qf wincmd J
au BufEnter * set scrolloff=30
au VimLeave * !echo -ne "\033[0m"

" Pathogen
" execute pathogen#infect()
" syntax on
" filetype plugin indent on

" Syntax highlighting
syntax enable
colorscheme molokai

" Easygrep
let g:EasyGrepRecursive=1

" Ag
let g:ag_working_path_mode="r"

" Grammarous
let g:grammarous#default_comments_only_filetypes = {
 \ '*' : 1, 'help' : 0, 'markdown' : 0,
 \ }

" Tagbar plugin
autocmd VimEnter * nested :TagbarOpen
autocmd VimEnter * nested :NERDTreeFind
autocmd VimEnter * nested :NERDTreeFocusToggle

" Go-vim plugin
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_fmt_command = "goimports"

" Emmet plugin
let g:user_emmet_leader_key='<C-C>'

" YouCompleteMe plugin
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_complete_in_strings = 1
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
\}
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_confirm_extra_conf = 0
let g:ycm_cache_omnifunc=0
let g:ycm_server_keep_logfiles = 1

" DelimitMate plugin
let delimitMate_expand_space = 1
let delimitMate_jump_expansion = 0

" Airline plugin
let g:airline_theme = 'badwolf'
let g:airline_powerline_fonts = 1

" NERDTree & NERDTree tabs plugins
let g:nerdtree_tabs_smart_startup_focus = 2
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_focus_on_files = 1

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" Instant markdown
let g:instant_markdown_autostart = 0

let g:TerminusFocusReporting=0

" Syntastic plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:go_list_type='quickfix'
let g:syntastic_go_checkers = ['go', 'gofmt', 'golint', 'govet']
let g:syntastic_ignore_files = ['\.s$']
let g:syntastic_always_populate_loc_list = 1

" sync
" let g:sync_exe_filenames = '.sync;'
" nmap <C-U> <ESC>:call SyncUploadFile()<CR>

" Exit if quickfix is last window
au BufEnter * call MyLastWindow()
function! MyLastWindow()
    " if the window is quickfix go on
    if &buftype=="quickfix"
        " if this window is last on screen quit without warning
        if winbufnr(2) == -1
            quit!
        endif
    endif
endfunction

" Shortcuts remap
nmap  <F2>          :tabnew<CR>
nmap  <F4>          :set hlsearch<CR>
nmap  <F5>          :nohlsearch<CR>
nmap  <F6>          :NERDTreeTabsToggle<CR>
nmap  <F7>          :GundoToggle<CR>
nmap  <F8>          :TagbarToggle<CR>
nmap  <F9>          :tabclose<CR>
nmap  <F10>         :Tabularize /,\zs<CR>
vmap  <F10>         :Tabularize /,\zs<CR>
nmap  <F12>         :Tabularize / \zs<CR>
vmap  <F12>         :Tabularize / \zs<CR>
nmap  <C-Down>      :tabprevious<CR>
nmap  <C-Up>        :tabnext<CR>

" Developper
nmap , :lnext<CR>
nmap ? :lprevious<CR>
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" Grammar
nmap <leader>g :GrammarousCheck<CR>
nmap <leader>ga <Plug>(grammarous-fixall)
nmap <leader>gf <Plug>(grammarous-fixit)
nmap <leader>gr <Plug>(grammarous-remove-error)
nmap <leader>gd <Plug>(grammarous-disable-rule)
nmap ! <Plug>(grammarous-move-to-next-error)
nmap § <Plug>(grammarous-move-to-previous-error)

" Search
nmap <leader><leader>s :%s/<C-r><C-w>/
nmap <leader><leader>a :Ag<space>
nmap <leader>aa :Ag <C-r><C-w><CR>

" git-blame
nmap <Leader>bl :Gblame <CR>

" guru
nmap <Leader>gc :GoCallers <CR>
" Easy Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Go-Specific
au FileType go nmap gi <Plug>(go-install)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>e <Plug>(go-rename)
au FileType go nmap <leader>i <Plug>(go-info)
au FileType go nmap <leader>l :GoLint<CR>
au FileType go nmap <leader>q :GoImport<space>
au FileType go nmap <Leader>f <Plug>:GoImpl<space>
au FileType go nmap <leader>ff <Plug>(go-implements)
au FileType go vmap <leader>r :GoAddTags<space>
au FileType go vmap <leader>p :GoPlay<CR>
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>s <Plug>(go-install)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>v <Plug>(go-vet)
au FileType go nmap <leader>ds <Plug>(go-def-split)
au FileType go nmap <leader>dv <Plug>(go-def-vertical)
au FileType go nmap <leader>dt <Plug>(go-def-tab)
au FileType go nmap <leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>gs <Plug>(go-doc-split)
au FileType go nmap <leader>gv <Plug>(go-doc-vertical)

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
