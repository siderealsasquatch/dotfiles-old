call plug#begin('~/.config/nvim/plugged')

"###########
"# Plugins #
"###########

" Additional functionality
" ------------------------

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'voldikss/fzf-floaterm'
Plug 'voldikss/vim-floaterm'
Plug 'TaDaa/vimade'
Plug 'justinmk/vim-sneak'
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/vim-easy-align'
Plug 'ludovicchabant/vim-gutentags'
Plug 'liuchengxu/vista.vim'
Plug 'unblevable/quick-scope'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'

" Color schemes
" -------------

Plug 'rafi/awesome-vim-colorschemes'
Plug 'trevordmiller/nova-vim'
Plug 'nightsense/snow'
Plug 'nightsense/stellarized'
Plug 'challenger-deep-theme/vim', { 'as' : 'challenger-deep' }
Plug 'srcery-colors/srcery-vim'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'haishanh/night-owl.vim'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main'  }
Plug 'bluz71/vim-moonfly-colors'
Plug 'ghifarit53/tokyonight-vim'

" Fonts
" -----

"Might not need this anymore since I'm using fonts from the Windows side
"Plug 'powerline/fonts', { 'do' : './install.sh' }

" Misc
" ----

Plug 'ryanoasis/vim-devicons'

call plug#end()

"###################
"# Neovim settings #
"###################

" General
" -------

" Remap Escape key
" No longer need to set this as I've remapped escape to capslock
"imap jk <Esc>
"

" Set the maximum memory for pattern matching
set mmp=100000

" Disable mouse support
set mouse=""

" Enable cursor line
set cursorline

" Make searches case insensitive
set ignorecase

" Enable smartcase searching
set smartcase

" Enable line numbers
set number

" Enable relative line numbers
set relativenumber

" Enable autoindent
set autoindent

" Copy the previous indentation on autoindenting
set copyindent

" Enable hidden buffers
set hidden

" Highlight search terms
set hlsearch

" Disable mode indicators
set noshowmode

" Remove highlighting after a search
nmap <leader>nh :noh<CR>

" Set the indentation
set tabstop=4
set shiftwidth=0
set smarttab

" Set the line width
" I'll have to see if there is a way to limit this to files that have no
" extensions
set tw=90

" Have tabs be expanded to spaces for Python, R, and Markdown files
au FileType python setlocal expandtab tw=80
au FileType r setlocal expandtab tw=80
au FileType rmd setlocal expandtab tw=80
au FileType markdown setlocal expandtab ts=2 tw=90

" Have tabs be kept tabs in text, c++, java, and scala files
au FileType text setlocal noexpandtab tw=90
au FileType cpp setlocal noexpandtab tw=90
au FileType java setlocal noexpandtab tw=90
au FileType scala setlocal noexpandtab tw=90

" ===========
" Keybindings
" ===========

" General
" -------

" Remap leader key
nmap <space> <leader>

" Open new empty buffer in current window and save it as a file of the user's
" choosing.
nmap <leader>n :enew<CR>:saveas

" Save file as...
nmap <leader>sa :saveas

" Save all open buffers
nmap <leader>ss :wa<CR>

" Save file and refresh buffer
nmap <leader>r :w<CR>:e<CR>

" Open .vimrc file in new buffer for editing
nmap <leader>ev :e /home/fahmi/.config/nvim/init.vim<CR>

" Source .vimrc file
nmap <leader>so :source /home/fahmi/.config/nvim/init.vim<CR>

" Insert new line below current line from normal mode
nmap <leader>o o<Esc>

" Insert new line above current line from normal mode
nmap <leader>O O<Esc>

" Make current pane the only visible pane
" Just use <C-w>o instead. It's acutally much easier.
"nmap <leader>on :on<CR>

" Window splits
" -------------

" Split the window horizontally
nmap <leader>sh :sp<CR>

" Split the window vertically
nmap <leader>sv :vsp<CR>

" Create a terminal in a horizontal split
nmap <leader>sht :sp term://bash<CR>

" Create a terminal in a vertical split
nmap <leader>svt :vsp term://bash<CR>

" Remap keys for switching between windows
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" Remap keys for switching between windows when a terminal is active
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-W>h
nnoremap <A-j> <C-W>j
nnoremap <A-k> <C-W>k
nnoremap <A-l> <C-W>l

" Make windows split more naturally
set splitbelow
set splitright

" Managing buffers
" ----------------

" Move to the next buffer
nmap <leader>] :bnext<CR>

" Move to the previous buffer
nmap <leader>[ :bprevious<CR>

" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Move to previously edited buffer
nmap <tab> :b#<CR>

" Close/delete current buffer
nmap <C-C><C-D> :bd<CR>

" ===============
" Vim colorscheme
" ===============

" Enable true color if the terminal supports it
if (has("termguicolors"))
	set termguicolors
endif

" Set the background color
set background=dark

" Set the vim colorscheme
let g:material_terminal_italics = 1
let g:material_theme_style = 'ocean'
"let g:airline_theme = 'spaceduck'
"let g:tokyonight_style = 'night'
"let g:tokyonight_enable_italic = 1
"let g:onedark_terminal_italics = 1
color material

"let g:onedark_terminal_italics = 1
"color onedark

"###################
"# Plugin settings #
"###################

" ===
" CoC
" ===

" General settings
" ----------------

" Install/load coc extensions
" Remove coc-zsh for now as the server it's hosted on seems down.
let g:coc_global_extensions = [
	\ 'coc-marketplace',
	\ 'coc-highlight',
	\ 'coc-yank',
	\ 'coc-snippets',
	\ 'coc-prettier',
	\ 'coc-json',
	\ 'coc-sql',
	\ 'coc-sh',
	\ 'coc-jedi',
	\ 'coc-r-lsp'
\]

" Figure out what all these do later

set hidden

" Disable the creation of backup files
set nobackup
set nowritebackup

" Give more space for displaying messages
"set cmdheight=2

" Reduce updatetime
set updatetime=300

" Don't pass messages to |ins-completion-menu
set shortmess+=c

" Always show signcolumn
if has("patch-8.1.1564")
	set signcolumn=number
else
	set signcolumn=yes
endif

" Keybindings
" -----------

" Use tab for trigger completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Use c-space to trigger completion
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to format on enter,
" <CR> could be remapped by another vim plugin
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
	\ : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>fc  <Plug>(coc-format-selected)
nmap <leader>fc  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList

" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>

" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>

" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>

" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>

" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>

" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>

" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>

" Resume latest coc list.
nnoremap <silent><nowait> <space>cp  :<C-u>CocListResume<CR>

" Binding for the coc-yank plugin
nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<CR>

" ===
" ALE
" ===

" ALE settings
" ------------

" Don't lint when a file has just been opened
let g:ale_lint_on_enter = 0

" Lint on save
let g:ale_lint_on_text_changed = 'never'

" Apply formatters on save
let g:ale_fix_on_save = 1

" ALE linters
" -----------
let g:ale_linters = {
	\ 'python': ['flake8'],
	\ 'R': ['lintr']
\}

" ALE formatters
" --------------
let g:ale_fixers = {
	\ '*': ['remove_trailing_lines', 'trim_whitespace'],
	\ 'python': ['yapf', 'isort'],
	\ 'R': ['styler']
	"\ 'python': ['black', 'isort']
	"\ 'python': ['autopep8', 'isort']
\}

" =======
" Airline
" =======

" Set vim-airline status bar to appear at startup
set laststatus=2

" Enable powerline fonts
let g:airline_powerline_fonts = 1

" Prevents airline from drawing separators on empty sections
" (Gets rid of orange arrows)
let g:airline_skip_empty_sections = 1

" Enable the list of buffers
"let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Don't use powerline separators
" Only set this if using non-powerline-patched fonts
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''

" ===
" fzf
" ===

" Set default command (for some reason it's not picking up the one set in the current
" shell session)
let $FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow -g '!.{git,__py*}/*' 2> /dev/null"

" Set default opts (for some reason it's not picking up the ones set in the current
" shell session)
let $FZF_DEFAULT_OPTS="--reverse --border --preview 'bat --theme ansi-dark {}'"

" fzf on buffers
nmap <leader>fb :Buffers<CR>

" fzf on files in the current directory
nmap <leader>fp :Files<CR>

" fzf for lines in the current buffer (i.e., the current file)
nmap <leader>f/ :BLines<CR>

" fzf for lines in all loaded buffers
nmap <leader>fl :Lines<CR>

" fzf for tags in the current project
nnoremap <leader>ftp :Tags<CR>

" fzf for tags in the current buffer
nnoremap <leader>ftb :BTags<CR>

" fzf for files in the current directory based on their contents (i.e., search for file
" containing specific line)
nmap <leader>fr :Rg<CR>

" fzf for all active floaterms.
nnoremap <leader>ft :Floaterms<CR>

" fzf for all marks
nnoremap <leader>fm :Marks<CR>

" ========
" floaterm
" ========

" Settings
" --------

" Set floaterm title to nothing
let g:floaterm_title = ''

" Keybindings
" -----------

" Open new floaterm instance
nnoremap <silent> <F6> :FloatermNew --height=0.8 --width=0.8 --autoclose=2<CR>
tnoremap <silent> <F6> <C-\><C-n>:FloatermNew --height=0.8 --width=0.8 --autoclose=2<CR>

"Open new terminal instance on right side (this is specifically for using a REPL other
"than the ones already specified)
"nnoremap <silent> <leader>tnr :FloatermNew --wintype=vsplit --position=rightbelow --width=0.3 --autoclose=2<CR>
nnoremap <silent> <leader>trp :FloatermNew --position=bottom --width=0.9 --height=0.5 --autoclose=2<CR>

" Move to next floaterm instance
nnoremap <silent> <F8> :FloatermNext<CR>
tnoremap <silent> <F8> <C-\><C-n>:FloatermNext<CR>

" Move to previous floaterm instance
nnoremap <silent> <F7> :FloatermPrev<CR>
tnoremap <silent> <F7> <C-\><C-n>:FloatermPrev<CR>

" Toggle current floaterm instance
nnoremap <silent> <F9> :FloatermToggle<CR>
tnoremap <silent> <F9> <C-\><C-n>:FloatermToggle<CR>

" Kill current floaterm instance
nnoremap <silent> <F3> :FloatermKill<CR>
tnoremap <silent> <F3> <C-\><C-n>:FloatermKill<CR>

" Kill all floaterm instances
nnoremap <silent> <F4> :FloatermKill!<CR>
tnoremap <silent> <F4> <C-\><C-n>:FloatermKill!<CR>

" Send current line to current instance of floaterm
nnoremap <C-c><C-v> :FloatermSend<CR>

" Send current selection to current instance of floaterm
vnoremap <C-c><C-v> :'<,'>FloatermSend<CR>

" Send entire buffer to current instance of floaterm
nnoremap <C-c><C-x> :%FloatermSend<CR>

" Open Python interpreter in new terminal instance
"nnoremap <silent> <leader>tpp :FloatermNew --wintype=vsplit --position=rightbelow --width=0.3 --autoclose=2 python<CR>
nnoremap <silent> <leader>tpp :FloatermNew --position=bottom --width=0.9 --height=0.5 --autoclose=2 python<CR>
"nnoremap <silent> <leader>tpp :FloatermNew --position=bottom --width=0.7 --height=0.4 --autoclose=2<CR>

" Open IPython interpreter in new terminal instance
"nnoremap <silent> <leader>tpi :FloatermNew --wintype=vsplit --position=rightbelow --width=0.3 --autoclose=2 ipython<CR>
nnoremap <silent> <leader>tpi :FloatermNew --position=bottom --width=0.9 --height=0.5 --autoclose=2 ipython<CR>
"nnoremap <silent> <leader>tpi :FloatermNew --position=bottom --width=0.7 --height=0.4 --autoclose=2<CR>

" Open a floaterm instance containing lazygit.
nnoremap <silent> <leader>tg :FloatermNew --width=0.8 --height=0.8 --autoclose=2 lazygit<CR>

" Open a floaterm instance containing ranger.
nnoremap <silent> <leader>tr :FloatermNew --autoclose=2 --height=0.8 --width=0.8 ranger<CR>

" =========
" NERD tree
" =========

" Might get rid of NERDTree as I'm starting to find myself use it less and less especially
" with the addition of floaterm and fzf

" Open NERD tree panel
nmap <leader>d :NERDTreeToggle<CR>

" Set NERD tree panel width
let g:NERDTreeWinSize = 35

" ==============
" NERD commenter
" ==============

" Remap most used NERD commenter bindings to use 'g' instead of leader key

" Commenting out current line
nmap gcc <leader>cc

" Commenting out nested code
nmap gcn <leader>cn

" Comment out block of code using nicer format
nmap gcs <leader>cs

" Yank lines before commenting
nmap gcy <leader>cy

" Toggle comment state of entire block
nmap gct <leader>c<space>

" Toggle comment state of individual comment
nmap gci <leader>ci

" ============
" Vim Markdown
" ============

" Disable folding
let g:vim_markdown_folding_disabled = 1

" Set indentation (i.e. tabwidth) to 2
let g:vim_markdwon_new_list_item_indent = 2

" ======
" Vimade
" ======

" This must be here to enable vimade
let g:vimade = {}

" Set fade level
let g:vimade.fadelevel = 0.3

" =====
" sneak
" =====

" Enable labels for sneak
let g:sneak#label = 1

" Have case sensitivity be determined by vim's ignorecase and smartcase options
let g:sneak#use_ic_scs = 1

" =====
" Vista
" =====

" Settings
" --------

" Set the width of the vista window
let g:vista_sidebar_width = 40

" Keybindings
" -----------

" Toggle vista window
nnoremap <silent> <leader>vv :Vista!!<CR>

" Open vista window based on coc
nnoremap <silent> <leader>vc :Vista coc<CR>

" Open vista window based on ctags
nnoremap <silent> <leader>vt :Vista ctags<CR>

" Open vista finder based on coc
nnoremap <silent> <leader>vfc :Vista finder fzf:coc<CR>

" Open vista finder based on ctags
nnoremap <silent> <leader>vft :Vista finder fzf:ctags<CR>

" ==========
" Quickscope
" ==========
"
" Trigger highlighting only when pressing the keys specified in the array
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" =========
" RMarkdown
" =========

" Disable folding and spellchecking with vim-rmarkdown
let g:pandoc#modules#disabled = ['folding', 'spell']

" Disable concealing
let g:pandoc#syntax#conceal#use = 0
