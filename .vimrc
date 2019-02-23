" Plugin management
" Download vim-plug from the URL below and follow the installation
" instructions:
" https://github.com/junegunn/vim-plug
call plug#begin('~/.local/share/nvim/plugged')
" call plug#begin('~/.vim/plugged')''
" Devicon always load at first (parait il ...)
Plug 'ryanoasis/vim-devicons'


" General plugins
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'neomake/neomake'							" asynchronously run programs
" Plug 'Shougo/neosnippet.vim'					" small templates for commonly used code that you can fill in on the fly
" Plug 'Shougo/neosnippet-snippets'				" templates for snippet
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'takac/vim-hardtime'

" Language support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Go support
Plug 'leafgarland/typescript-vim'				" TypeScript syntax highlighting
Plug 'pangloss/vim-javascript'					" JavaScript syntax highlighting
Plug 'lervag/vimtex'							" LaTeX support
Plug 'zchee/deoplete-go'						" Asynchronous GO completion

" Auto close bracket
" Plug 'raimondi/delimitmate'

" Linting code
Plug 'https://github.com/w0rp/ale.git'
Plug 'eslint/eslint' , { 'do': 'yarn install' }

" Formatter
" "Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Colorschemes
" Plug 'https://github.com/romainl/flattened.git'
" Plug 'arcticicestudio/nord-vim'
Plug 'blb78/nord-vim'

call plug#end()


"----------------------------------------------
" General settings
"----------------------------------------------
set autoindent					  " take indent for new line from previous line
set smartindent					  " enable smart indentation
set autoread					  " reload file if the file changes on the disk
set autowrite					  " write when switching buffers
set autowriteall				  " write on :quit
set clipboard=unnamedplus
set colorcolumn=120				  " highlight the 80th column as an indicator
set completeopt-=preview		  " remove the horrendous preview window
set cursorline					  " highlight the current line for the cursor
set encoding=utf-8
set list						  " show trailing whitespace
set listchars=tab:\|\ ,trail:▫
set nospell						  " disable spelling
set noswapfile					  " disable swapfile usage
set nowrap
set noerrorbells				  " No bells!
set novisualbell				  " I said, no bells!
set number						  " show number ruler
set ruler
set formatoptions=tcqronj		  " set vims text formatting options
set title						  " let vim set the terminal title
set updatetime=100				  " redraw the status bar often


" File Format
set tabstop=4						" Number of spaces that a <Tab> in the file counts for
set softtabstop=4					" Number of spaces that a <Tab> counts for while performing editing operations
set shiftwidth=4					" Number of spaces to use for each step of (auto)indent<Paste>
set noexpandtab						" Use tabs, not spaces
%retab!								" Retabulate the whole file


" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" AutoBracket
inoremap { {}<Left>
inoremap ' ''<Left>
inoremap " ""<Left>

" Allow vim to set a custom font or color for a word
syntax enable

" Set the leader button
let mapleader = ','

" Autosave buffers before leaving them
autocmd BufLeave * silent! :wa

" Remove trailing white spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Center the screen quickly
nnoremap <space> zz


"----------------------------------------------
" Colors
"----------------------------------------------
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
" colorscheme flattened_light

let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_comment_brightness = 20
let g:nord_uniform_diff_background = 1
let g:nord_cursor_line_number_background = 1
colorscheme nord

"----------------------------------------------
" Fonts
"----------------------------------------------
filetype plugin indent on
set guifont=Devicons\ 11

"----------------------------------------------
" Searching
"----------------------------------------------
set incsearch					  " move to match as you type the search query
set hlsearch					  " disable search result highlighting

if has('nvim')
	set inccommand=split		  " enables interactive search and replace
endif

" Clear search highlights
map <leader>c :nohlsearch<cr>

" These mappings will make it so that going to the next one in a search will
" center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"----------------------------------------------
" Splits
"----------------------------------------------
" Create horizontal splits below the current window
set splitbelow
set splitright

" Creating splits
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>h :split<cr>

" Closing splits
nnoremap <leader>q :close<cr>


"----------------------------------------------
" Plugin: junegunn/fzf.vim
"----------------------------------------------
let g:fzf_layout = { 'down': '~100%' }
nnoremap - :FZF<cr>


"----------------------------------------------
" Plugin: Shougo/deoplete.nvim
"----------------------------------------------
if has('nvim')
	" Enable deoplete on startup
	let g:deoplete#enable_at_startup = 1
endif

" Disable deoplete when in multi cursor mode
function! Multiple_cursors_before()
	let b:deoplete_disable_auto_complete = 1
endfunction

function! Multiple_cursors_after()
	let b:deoplete_disable_auto_complete = 0
endfunction

let g:deoplete#sources#go#gocode_binary = '/home/blb/go/bin/gocode'
"----------------------------------------------
" Plugin: vim-airline/vim-airline
"----------------------------------------------
" Show status bar by default.
set laststatus=2

" Disable showing tabs in the tabline. This will ensure that the buffers are
" what is shown in the tabline at all times.
let g:airline#extensions#tabline#show_tabs = 0

" Enable powerline fonts.
let g:airline_powerline_fonts = 1


"----------------------------------------------
" Plugin: plasticboy/vim-markdown
"----------------------------------------------
" Disable folding
let g:vim_markdown_folding_disabled = 1

" Auto shrink the TOC, so that it won't take up 50% of the screen
let g:vim_markdown_toc_autofit = 1


"----------------------------------------------
" Plugin: 'w0rp/ale'
"----------------------------------------------
" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\	'javascript': ['prettier', 'eslint'],
\	'typescript': ['prettier', 'eslint'],
\	'vue': ['prettier', 'eslint'],
\	'html': ['prettier', 'eslint'],
\	'css': ['prettier'],
\	'less': ['prettier'],
\	'scss': ['prettier'],
\	'json': ['prettier'],
\	'graphql': ['prettier'],
\	'markdown': ['prettier'],
\	'latex': ['proselint'],
\}
let g:ale_javascript_prettier_use_local_config = 1


"----------------------------------------------
" Plugin: 'prettier/vim-prettier
"----------------------------------------------

" "let g:prettier#autoformat = 0
" "autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier


"----------------------------------------------
" Language: Golang
"----------------------------------------------
" Mappings
au FileType go nmap <F8> :GoMetaLinter<cr>
au FileType go nmap <F9> :GoCoverageToggle -short<cr>
au FileType go nmap <F10> :GoTest -short<cr>
au FileType go nmap <F12> <Plug>(go-def)
au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
au FileType go nmap <leader>gt :GoDeclsDir<cr>
au FileType go nmap <leader>gc <Plug>(go-coverage-toggle)
au FileType go nmap <leader>gd <Plug>(go-def)
au FileType go nmap <leader>gdv <Plug>(go-def-vertical)
au FileType go nmap <leader>gdh <Plug>(go-def-split)
au FileType go nmap <leader>gD <Plug>(go-doc)
au FileType go nmap <leader>gDv <Plug>(go-doc-vertical)

" Set gopath and gobin
let $GOPATH=getcwd()
let $GOBIN='/home/blb/go/bin'

" Run goimports when running gofmt
let g:go_fmt_command = "goimports"

" Set neosnippet as snippet engine
" let g:go_snippet_engine = "neosnippet"
"
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" imap <C-k>	   <Plug>(neosnippet_expand_or_jump)
" smap <C-k>	   <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>	   <Plug>(neosnippet_expand_target)

" Enable syntax highlighting per default
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1

" Show the progress when running :GoCoverage
let g:go_echo_command_info = 1

" Show type information
let g:go_auto_type_info = 1

" Highlight variable uses
let g:go_auto_sameids = 1

" Fix for location list when vim-go is used together with Syntastic
let g:go_list_type = "quickfix"

" Add the failing test name to the output of :GoTest
let g:go_test_show_name = 1

" gometalinter configuration
let g:go_metalinter_command = ""
let g:go_metalinter_deadline = "5s"
let g:go_metalinter_enabled = [
	\ 'deadcode',
	\ 'gocyclo',
	\ 'golint',
	\ 'ineffassign',
	\ 'vet',
	\ 'vetshadow'
\]

" Set whether the JSON tags should be snakecase or camelcase.
let g:go_addtags_transform = "snakecase"

" neomake configuration for Go.
" let g:neomake_go_enabled_makers = [ 'go', 'gometalinter' ]
" let g:neomake_go_gometalinter_maker = {
"	\ 'args': [
"	\	'--tests',
"	\	'--enable-gc',
"	\	'--concurrency=3',
"	\	'--fast',
"	\	'-D', 'aligncheck',
"	\	'-D', 'dupl',
"	\	'-D', 'gocyclo',
"	\	'-D', 'gotype',
"	\	'-E', 'misspell',
"	\	'-E', 'unused',
"	\	'%:p:h',
"	\ ],
"	\ 'append_file': 0,
"	\ 'errorformat':
"	\	'%E%f:%l:%c:%trror: %m,' .
"	\	'%W%f:%l:%c:%tarning: %m,' .
"	\	'%E%f:%l::%trror: %m,' .
"	\	'%W%f:%l::%tarning: %m'
"	\ }
" " When writing a buffer (no delay), and on normal mode changes (after 750ms).
" call neomake#configure#automake('nw', 750)


"----------------------------------------------
" Language: gitcommit
"----------------------------------------------
au FileType gitcommit setlocal spell
au FileType gitcommit setlocal textwidth=80

"----------------------------------------------
" Language: Markdown
"----------------------------------------------
au FileType markdown setlocal spell
au FileType markdown set syntax=markdown

"----------------------------------------------
" Function: JUMP
"----------------------------------------------
function! GotoJump()
  jumps
  let j = input("Please select your jump: ")
  if j != ''
	let pattern = '\v\c^\+'
	if j =~ pattern
	  let j = substitute(j, pattern, '', 'g')
	  execute "normal " . j . "\<c-i>"
	else
	  execute "normal " . j . "\<c-o>"
	endif
  endif
endfunction

nmap <Leader>j :call GotoJump()<CR>