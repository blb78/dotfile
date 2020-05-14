"1 - Dependencies - {{{
	call plug#begin('~/.local/share/nvim/plugged')
	" General
		Plug 'vim-airline/vim-airline'
		Plug 'vim-airline/vim-airline-themes'
		Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
		Plug 'junegunn/fzf.vim'
		Plug 'junegunn/goyo.vim'
		Plug 'blb78/limelight.vim'
		Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
		Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
		Plug 'vimwiki/vimwiki'
	" Linting code
		Plug 'dense-analysis/ale'
		Plug 'eslint/eslint' , { 'do': 'yarn install' }
	" Snippets
		Plug 'SirVer/ultisnips'
		Plug 'honza/vim-snippets'
	" Language support
		Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Go support
		Plug 'leafgarland/typescript-vim'				" TypeScript syntax highlighting
		Plug 'pangloss/vim-javascript'					" JavaScript syntax highlighting
		Plug 'plasticboy/vim-markdown'					" Markdown syntax highlighting
		Plug 'storyn26383/vim-vue'						" Vuejs syntax highlighting
	" Theme
		Plug 'blb78/nord-vim'
	call plug#end()
" }}}
" 2 - Basic settings - {{{
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
" }}}
" 3 - Plugins - {{{
	" Plugin: dense-analysis/ale - {{{2
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
					\	'markdown': ['prettier'],
					\	'graphql': ['prettier'],
					\	'latex': ['proselint'],
					\	'go': ['golangci-lint'],
					\}
		let g:ale_go_golangci_lint_executable = '/home/blb/go/bin/golangci-lint'
		let g:ale_go_golangci_lint_options = '--fast  --out-format=tab'
		let g:ale_lint_on_text_changed = 0
		let g:ale_lint_on_enter = 1
		let g:ale_lint_on_save = 1
		let g:ale_sign_error = '⤫'
		let g:ale_sign_warning = '⚠'
		let g:ale_javascript_prettier_use_local_config = 1
		let g:airline#extensions#ale#enabled = 1
	" }}}
	" Plugin: shougo/deoplete.vim - {{{2
		let g:deoplete#enable_at_startup = 1
		let g:deoplete#sources#go#gocode_binary = '/home/blb/go/bin/gocode'
	" }}}
	" Plugin: SirVer/ultisnips - {{{2
		let g:UltiSnipsExpandTrigger="<tab>"
		let g:UltiSnipsJumpForwardTrigger="<c-b>"
		let g:UltiSnipsJumpBackwardTrigger="<c-z>"
		" let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]
	" }}}
	" Plugin: junegunn/fzf.vim - {{{2
		nnoremap - :FZF<cr>
		" let g:fzf_layout = { 'down': '~100%' }
	" }}}
	" Plugin: junegunn/goyo.vim - {{{2
		let g:goyo_width = 100
	" }}}
	" Plugin: junegunn/limelight.vim - {{{2
		let g:limelight_focus_mode = 1
	" }}}

	" Plugin: mbbill/undotree - {{{2
		" using relative positioning instead
		" let g:undotree_CustomUndotreeCmd = 'vertical 32 new'
		" let g:undotree_CustomDiffpanelCmd= 'belowright 12 new'
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
		let g:vim_markdown_conceal = 2
		let g:vim_markdown_conceal_code_blocks = 0
		let g:vim_markdown_math = 1
		let g:vim_markdown_toml_frontmatter = 1
		let g:vim_markdown_frontmatter = 1
		let g:vim_markdown_strikethrough = 1
		let g:vim_markdown_autowrite = 1
		let g:vim_markdown_edit_url_in = 'tab'
		let g:vim_markdown_follow_anchor = 1
	" }}}
	" Plugin: fatih/vim-go - {{{2
		let $GOPATH=getcwd()
		let $GOBIN='/home/blb/go/bin'
		let g:go_fmt_command = "goimports"
		let g:go_highlight_types = 1
		let g:go_highlight_fields = 1
		let g:go_highlight_functions = 1
		let g:go_highlight_methods = 1
		let g:go_highlight_structs = 1
		let g:go_highlight_operators = 1
		let g:go_highlight_build_constraints = 1
		let g:go_highlight_extra_types = 1
		let g:go_echo_command_info = 1
		let g:go_list_type = "quickfix"
		let g:go_test_show_name = 1
		let g:go_addtags_transform = "camelcase"
	" }}}
" }}}
" 4 - Abbreviations - {{{
	inoreabbrev reutrn return
	inoreabbrev retrun return
	inoreabbrev retun return
	inoreabbrev rt return
" }}}
" 5 - Buffer Events - {{{
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
	:augroup zettel
	:	autocmd VimEnter * call StartUp()
	:augroup END
" }}}
" 6 - FileType- {{{
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
		:	autocmd FileType go nnoremap <localleader>l :Limelight<CR>
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
		autocmd FileType markdown setlocal wrap linebreak nolist
		autocmd FileType markdown nnoremap <F1> :setlocal spell!<CR> " toggle spell on or off
		autocmd FileType markdown nnoremap <F2> :call ToggleSpellLang()<CR> " toggle language
		autocmd FileType markdown Goyo 100
		autocmd FileType markdown Limelight 0.7
		autocmd FileType markdown nnoremap <silent> <Down> gj
		autocmd FileType markdown nnoremap <silent> <Up> gk
		autocmd FileType markdown nnoremap <silent> <Up> gk
		autocmd FileType markdown nnoremap <silent> <home> g<home>
		autocmd FileType markdown nnoremap <silent> <End> g<End>
		autocmd FileType markdown inoremap <c-i> <esc>:call local#zettel#link("",0)<CR>
		autocmd FileType markdown nnoremap <localleader>i <esc>:call local#zettel#link("",0)<CR>
		autocmd FileType markdown nnoremap <localleader>o viwy <esc>:call local#zettel#open('<C-R>"')<CR>
		autocmd FileType markdown nnoremap <localleader>p viwy <esc>:call local#zettel#preview('<C-R>"',0)<CR>
		autocmd FileType markdown nnoremap <localleader>g :Goyo<CR>
		autocmd FileType markdown nnoremap <localleader>l :Limelight<CR>
		autocmd FileType markdown nnoremap <localleader>& m`^i# <esc>``2l
		autocmd FileType markdown nnoremap <localleader>é m`^i## <esc>``3l
		autocmd FileType markdown nnoremap <localleader>" m`^i### <esc>``4l
		autocmd FileType markdown nnoremap <localleader>' m`^i#### <esc>``5l
		autocmd FileType markdown nnoremap <localleader>( m`^i##### <esc>``6l
		autocmd FileType markdown nnoremap <localleader>è ciw``<ESC>P2l
		autocmd FileType markdown nnoremap <localleader>_ ciw__<ESC>P2l
		autocmd FileType markdown nnoremap <localleader>* ciw****<ESC>hP3l
	" }}}
	" VIM - {{{2
		autocmd FileType vim setlocal foldmethod=marker
	" }}}
" }}}
" 7 - Function - {{{
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
	" Run FZF - {{{2
		function! StartUp()
			if 0 == argc()
				FZF!
			endif
		endfunction
	" }}}
" }}}
" 8 - Mapping - {{{
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
		" moving on window
		nnoremap <C-h> <C-w><left>
		nnoremap <C-l> <C-w><right>
		nnoremap <C-k> <C-w><up>
		nnoremap <C-j> <C-w><down>
	" }}}
	" Opening - {{{2
		" opening init.vim
			nnoremap <localleader><leader> :e $MYVIMRC<cr>
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
	" Spliting - {{{2
		nnoremap <leader>v :vsplit<cr>
		nnoremap <leader>h :split<cr>
		nnoremap <leader>q :close<cr>
	" }}}
	" Unclassified - {{{2
		" Center the screen quickly
		nnoremap <space> zz
		" These mappings will make it so that going to the next one in a search will center on the line it's found in.
		nnoremap n nzzzv
		nnoremap N Nzzzv
	" }}}
" }}}
" 9 - Theme - {{{
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

function! s:goyo_enter()
	if executable('tmux') && strlen($TMUX)
		silent !tmux set status off
		silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
	endif
	set noshowmode
	set noshowcmd
	set scrolloff=999
	let b:quitting = 0
	let b:quitting_bang = 0
	autocmd QuitPre <buffer> let b:quitting = 1
	cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
	if executable('tmux') && strlen($TMUX)
		silent !tmux set status on
		silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
	endif
	set showmode
	set showcmd
	set scrolloff=5
	" Quit Vim if this is the only remaining buffer
	if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
		if b:quitting_bang
			qa!
		else
			qa
		endif
	endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Change test coverage color
" Must be set at the end of vimrc
hi! def		 goCoverageCovered	  ctermfg=cyan	guibg=#485962
hi! def		 goCoverageUncover	  ctermfg=red	guibg=#8A515B
