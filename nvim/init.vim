" Dependencies - {{{
	call plug#begin('~/.local/share/nvim/plugged')
	" General
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " asynchronous completion
	Plug 'zchee/deoplete-go'						" Asynchronous GO completion
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
	Plug 'plasticboy/vim-markdown'					" Markdown syntax highlighting
	Plug 'storyn26383/vim-vue'						" Vuejs syntax highlighting
	" Linting code
	Plug 'dense-analysis/ale'
	Plug 'eslint/eslint' , { 'do': 'yarn install' }
	" Theme
	Plug 'blb78/nord-vim'
	call plug#end()
" }}}
" Basic settings - {{{
	set autoindent					  " take indent for new line from previous line
	set autoread					  " reload file if the file changes on the disk
	set autowrite					  " write when switching buffers
	set autowriteall				  " write on :quit
	set backspace=indent,eol,start	  " proper backspace behavior
	set clipboard=unnamedplus
	set completeopt-=preview		  " remove the horrendous preview window
	set cursorline					  " highlight the current line for the cursor
	set encoding=utf-8
	set formatoptions=tcqronj		  " set vims text formatting options
	set grepprg=rg\ --vimgrep
	set hlsearch					  " disable search result highlighting
	set incsearch					  " move to match as you type the search query
	if has('nvim')
		set inccommand=split		  " enables interactive search and replace
	endif
	set lazyredraw
	set list						  " show trailing whitespace
	set listchars=tab:\|\ ,trail:▫	  " character used to show tab
	set listchars+=space:·			  " character used to show space
	set nospell						  " disable spelling
	set noswapfile					  " disable swapfile usage
	set nowrap
	set noerrorbells				  " No bells!
	set novisualbell				  " I said, no bells!
	set number relativenumber						  " show number line
	set ruler						  " show the line and the column number of the cursor position
	set laststatus=2					" Show status bar by default
	set splitbelow					  " Create horizontal splits below the current window
	set splitright					  " Create right splits
	set title						  " let vim set the terminal title
	set updatetime=100				  " redraw the status bar often
	" File Format
	set tabstop=4						" Number of spaces that a <Tab> in the file counts for
	set softtabstop=4					" Number of spaces that a <Tab> counts for while performing editing operations
	set shiftwidth=4					" Number of spaces to use for each step of (auto)indent<Paste>
	set noexpandtab						" Use tabs, not spaces
	set wildmenu						" great command-line completion
	%retab!								" Retabulate the whole file
	syntax on					  " Allow vim to set a custom font or color for a word
	filetype plugin indent on
	let mapleader = ','
	let maplocalleader = 'ù'
	let g:python3_host_prog = '/usr/bin/python3'
" }}}
" Plugins - {{{
	" Plugin: dense-analysis/ale - {{{2
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
					\	'yaml': ['prettier'],
					\	'graphql': ['prettier'],
					\	'latex': ['proselint'],
					\}
		let g:ale_javascript_prettier_use_local_config = 1
		let g:airline#extensions#ale#enabled = 1
	" }}}
	" Plugin: shougo/deoplete.vim - {{{2
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
		" }}}
	" Plugin: junegunn/fzf.vim - {{{2
		let g:fzf_layout = { 'down': '~100%' }
	" }}}
	" Plugin: vim-airline/vim-airline - {{{2
		" Disable showing tabs in the tabline. This will ensure that the buffers are
		" what is shown in the tabline at all times.
		let g:airline#extensions#tabline#show_tabs = 0
		" Enable powerline fonts.
		let g:airline_powerline_fonts = 1
	" }}}
	" Plugin: plasticboy/vim-markdown - {{{2
		" Disable folding
		let g:vim_markdown_folding_disabled = 1
		" Auto shrink the TOC, so that it won't take up 50% of the screen
		let g:vim_markdown_toc_autofit = 1
	" }}}
	" Plugin: fatih/vim-go - {{{2
		" Set gopath and gobin
		let $GOPATH=getcwd()
		let $GOBIN='/home/blb/go/bin'
		" Run goimports when running gofmt
		let g:go_fmt_command = "goimports"
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
		" let g:go_auto_type_info = 1
		" Highlight variable uses
		" let g:go_auto_sameids = 1
		" Fix for location list when vim-go is used together with Syntastic
		let g:go_list_type = "quickfix"
		" Add the failing test name to the output of :GoTest
		let g:go_test_show_name = 1
		" gometalinter configuration
		let g:go_metalinter_command = "golangci-lint"
		let g:go_metalinter_deadline = "5s"
		let g:go_metalinter_enabled = [
					\ 'deadcode',
					\ 'errcheck',
					\ 'gosimple',
					\ 'golint',
					\ 'ineffassign',
					\ 'govet',
					\ 'unused',
					\ 'staticcheck',
					\ 'structcheck',
					\ 'vetshadow'
					\]
		" Set whether the JSON tags should be snakecase or camelcase.
		let g:go_addtags_transform = "camelcase"
	" }}}
	" Plugin: lervag/vimtex - {{{2
		let g:vimtex_view_method = 'zathura'
	" }}}
" }}}
" Abbreviations - {{{
	inoreabbrev reutrn return
	inoreabbrev retun return
	inoreabbrev rt return
" }}}
" Buffer Events - {{{
	" Basic - {{{2
		:augroup cleanFile
		:	" save on leaving
		:	autocmd BufLeave * silent! :wa
		:	" remove whitespace
		:	autocmd BufWritePre * :%s/\s\+$//e
		:augroup END
		:augroup numberColorToggle
		:	autocmd!
		:	autocmd InsertEnter * highlight LineNr ctermbg=green guifg=#A3BE8C
		:	autocmd InsertLeave * highlight LineNr ctermbg=black guifg=#4C566A
		:augroup END
	" }}}
" }}}
" FileType- {{{
	" GOLANG - {{{2
		:augroup golang
		:	autocmd!
		:	autocmd FileType go inoreabbrev iferr if err!= nil {<cr>}<esc>O
		:	autocmd FileType go nnoremap <F8> :GoMetaLinter<cr>
		:	autocmd FileType go nnoremap <F9> :GoCoverageToggle -short<cr>
		:	autocmd FileType go nnoremap <F10> :GoTest -short<cr>
		:	autocmd FileType go nmap <F12> <Plug>(go-def)
		:	autocmd Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
		:	autocmd Filetype go nmap <leader>gah <Plug>(go-alternate-split)
		:	autocmd Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
		:	autocmd FileType go nmap <leader>gt :GoDeclsDir<cr>
		:	autocmd FileType go nmap <leader>gtf :GoTestFunc<cr>
		:	autocmd FileType go nmap <leader>gc <Plug>(go-coverage-toggle)
		:	autocmd FileType go nmap <leader>gd :GoDefJump<cr>
		:	autocmd FileType go nmap <leader>gdv <Plug>(go-def-vertical)
		:	autocmd FileType go nmap <leader>gdh <Plug>(go-def-split)
		:	autocmd FileType go nmap <leader>gD <Plug>(go-doc)
		:	autocmd FileType go nmap <leader>gDv <Plug>(go-doc-vertical)
		:	autocmd FileType go nnoremap <localleader>a 'Azz
		:	autocmd FileType go nnoremap <localleader>b 'Bzz
		:	autocmd FileType go nnoremap <localleader>c 'Czz
		:	autocmd FileType go nnoremap <localleader>d 'Dzz
		:	autocmd FileType go nnoremap <localleader>e 'Ezz
		:	autocmd FileType go nnoremap <localleader>f 'Fzz
		:	autocmd FileType go nnoremap <localleader>g 'Gzz
		:	autocmd FileType go nnoremap <localleader>h 'Hzz
		:	autocmd FileType go nnoremap <localleader>i 'Izz
		:	autocmd FileType go nnoremap <localleader>j 'Jzz
		:	autocmd FileType go nnoremap <localleader>k 'Kzz
		:	autocmd FileType go nnoremap <localleader>l 'Lzz
		:	autocmd FileType go nnoremap <localleader>m 'Mzz
		:	autocmd FileType go nnoremap <localleader>n 'Nzz
		:	autocmd FileType go nnoremap <localleader>o 'Ozz
		:	autocmd FileType go nnoremap <localleader>p 'Pzz
		:	autocmd FileType go nnoremap <localleader>q 'Qzz
		:	autocmd FileType go nnoremap <localleader>r 'Rzz
		:	autocmd FileType go nnoremap <localleader>s 'Szz
		:	autocmd FileType go nnoremap <localleader>t 'Tzz
		:	autocmd FileType go nnoremap <localleader>u 'Uzz
		:	autocmd FileType go nnoremap <localleader>v 'Vzz
		:	autocmd FileType go nnoremap <localleader>w 'Wzz
		:	autocmd FileType go nnoremap <localleader>x 'Xzz
		:	autocmd FileType go nnoremap <localleader>y 'Yzz
		:	autocmd FileType go nnoremap <localleader>z 'Zzz
		:augroup END
	" }}}2
	" LaTeX - {{{2
		" Enable spell checking for latex files
		autocmd FileType tex setlocal spell spelllang=fr_FR
		autocmd FileType tex set textwidth=80
		autocmd FileType tex set wrap linebreak nolist
		autocmd FileType tex nnoremap <A-j> gj
		autocmd FileType tex nnoremap <A-k> gk
	" }}}
	" Markdown - {{{2
		" Enable spell checking for markdown files
		autocmd FileType markdown setlocal spell spelllang=fr_FR
	" }}}
	" VIM - {{{2
		autocmd FileType vim setlocal foldmethod=marker
	" }}}
" }}}
" Function - {{{
	" Toggle spell language - {{{2
		function! ToggleSpellLang()
			" toggle between en and fr
			if &spelllang =~# 'en'
				:set spelllang=fr
			else
				:set spelllang=en
			endif
		endfunction
	" }}}
" }}}
" Mapping - {{{
	" Bracket {{{2
		inoremap { {}<Left>
		inoremap (( ()
	" }}}
	" Buffer - {{{2
		nnoremap gb :ls<CR>:b<Space>
		nnoremap _ :Buffers<cr>
	" }}}
	" Marks - {{{2
		nnoremap <leader>m :Marks<cr>
	" }}}
	" Moving - {{{2
		" disable arrow keys in Escape mode
		nnoremap <up> <nop>
		nnoremap <down> <nop>
		nnoremap <left> <nop>
		nnoremap <right> <nop>
		" disable arrow keys in Insert mode
		inoremap <up> <nop>
		inoremap <down> <nop>
		inoremap <left> <nop>
		inoremap <right> <nop>
		" scroll on window
		nnoremap <C-h> <C-w><left>
		nnoremap <C-l> <C-w><right>
		nnoremap <C-k> <C-w><up>
		nnoremap <C-j> <C-w><down>
	" }}}
	" Navigation - {{{2
		" FZF - {{{3
			nnoremap - :FZF<cr>
		" }}}
	" }}}
	" Opening - {{{2
		" opening init.vim
		nnoremap <localleader><leader> :e $MYVIMRC<cr>
	" }}}
	" Removing - {{{2
		" delete line in Insert mode
		inoremap <C-d> <esc>ddi
	" }}}
	" Resizing - {{{2
		" Disable arrow movement, resize splits instead.
		" nnoremap <Up>	 :resize +2<CR>
		" nnoremap <Down>  :resize -2<CR>
		" nnoremap <Left>  :vertical resize +2<CR>
		" nnoremap <Right> :vertical resize -2<CR>
	" }}}
	" Searching - {{{2
		" search cword
		nnoremap <silent> <C-F> :Rg <C-R><C-W><CR>
		" Clear search highlights
		nnoremap <leader>c :nohlsearch<cr>
	" }}}
	" Spelling - {{{2
		nnoremap <F1> :setlocal spell!<CR> " toggle spell on or off
		nnoremap <F2> :call ToggleSpellLang()<CR> " toggle language
	" }}}
	" Spliting - {{{2
		nnoremap <leader>v :vsplit<cr>
		nnoremap <leader>h :split<cr>
		nnoremap <leader>q :close<cr>
	" }}}
	" Surrounding - {{{2
		" a word by \""
		nnoremap <leader>" ciw""<ESC>Pl
		" celui la ne fonctionne pas :-(
		"nnoremap <localleader>'ciw''<ESC>Pl
		" a selection
		vnoremap <leader>" c""<ESC>Pl
		vnoremap <leader>= c{}<ESC>Pl
		" celui la ne fonctionne pas :-(
		"vnoremap <localleader>' c''<ESC>Pl
	" }}}
	" Unclassified - {{{2
		" Center the screen quickly
		nnoremap <space> zz
		" These mappings will make it so that going to the next one in a search will center on the line it's found in.
		nnoremap n nzzzv
		nnoremap N Nzzzv
	" }}}
" }}}
" Theme - {{{
	" Nord - {{{2
		if exists('+termguicolors')
			let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
			let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
			set termguicolors
		endif
		let g:nord_italic = 1
		let g:nord_underline = 1
		let g:nord_italic_comments = 1
		let g:nord_comment_brightness = 20
		let g:nord_uniform_diff_background = 1
		let g:nord_cursor_line_number_background = 1
		colorscheme nord
	" }}}
" }}}


set path-=.,,
set wildignore+=*/bin/*,*/github.com/*,*/gitlab.com/*,*/clevercloud/*,*/pkg/*,*/golang.org/*,*/gopkg.in/*
set wildcharm=<C-z>
nnoremap <leader>e :vsplit src/**/*<C-z><S-Tab>
nnoremap <leader>f :find src/**/*<C-z><S-Tab>

" Change test coverage color
" Must be set at the end of vimrc
hi! def		 goCoverageCovered	  ctermfg=cyan	guibg=#485962
hi! def		 goCoverageUncover	  ctermfg=red	guibg=#8A515B
