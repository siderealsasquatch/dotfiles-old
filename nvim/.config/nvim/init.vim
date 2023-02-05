call plug#begin('~/.config/nvim/plugged')

"###########
"# Plugins #
"###########

" Additional functionality
" ------------------------

Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
" Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'sheerun/vim-polyglot'
Plug 'voldikss/fzf-floaterm'
Plug 'voldikss/vim-floaterm'
Plug 'justinmk/vim-sneak'
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/vim-easy-align'
Plug 'ludovicchabant/vim-gutentags'
Plug 'liuchengxu/vista.vim'
Plug 'unblevable/quick-scope'
Plug 'psliwka/vim-smoothie'
Plug 'andymass/vim-matchup'
Plug 'chaoren/vim-wordmotion'
Plug 'Yggdroot/indentLine'

" Color schemes
" -------------

Plug 'rafi/awesome-vim-colorschemes'
Plug 'trevordmiller/nova-vim'
Plug 'challenger-deep-theme/vim', { 'as' : 'challenger-deep' }
Plug 'srcery-colors/srcery-vim'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'ghifarit53/tokyonight-vim'
Plug 'Matt-Gleich/monovibrant'
Plug 'dracula/vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'haishanh/night-owl.vim'

" Misc
" ----

Plug 'ryanoasis/vim-devicons'

call plug#end()

"###################
"# Neovim settings #
"###################

" General
" -------

" Disable mouse support
set mouse=""

" Enable cursor line
set cursorline

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

" Perform case insensitive search
set ignorecase

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
au FileType markdown setlocal expandtab ts=2 tw=90 " Need to figure out why this isn't working

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
vmap <space> <leader>

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
" Use leader key for now
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

" Open a new empty buffer
nmap <leader>bn :enew<CR>

" Move to the next buffer
nmap <leader>] :bnext<CR>

" Move to the previous buffer
nmap <leader>[ :bprevious<CR>

" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>

" Move to previously edited buffer
nmap <tab> :b#<CR>

" Close/delete current buffer
nmap <C-C><C-d> :bd<CR>

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
"let g:tokyonight_style = 'night'
"let g:tokyonight_enable_italic = 1
"let g:two_firewatch_italics = 1
"let g:airline_theme = "twofirewatch"
"let g:airline_theme = "material"
"let g:material_terminal_italics = 1
"let g:material_theme_style = 'ocean'
"color night-owl
color iceberg
"let g:deepspace_italics = 1
"let g:airline_theme = 'deep_space'
"color tokyonight

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
	\ 'coc-emmet',
	\ 'coc-r-lsp',
	\ 'coc-jedi',
	\ 'coc-tsserver',
	\ 'coc-eslint',
	\ 'coc-go'
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
function! s:CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
"inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" Make <CR> auto-select the first completion item and notify coc.nvim to format on enter,
" <CR> could be remapped by another vim plugin
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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
nnoremap <silent> K :call ShowDocumentation()<CR>

function! s:ShowDocumentation()
	if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	else
		call feedkeys('K', 'in')
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

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

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
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>m C-u>CocList commands<cr>

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

" ALE options
" -----------

" Don't lint when file is first opened
let g:ale_lint_on_enter = 0

" Don't lint every time the text is modified
let g:ale_lint_on_text_changed = 'never'

" Apply formatters on file save
let g:ale_fix_on_save = 1

" ALE linters
" -----------
let g:ale_linters = {
	"\ 'python': ['flake8', 'pylint']
	\ 'python': ['flake8'],
	\ 'go': ['revive', 'go vet', 'errcheck'],
	\ 'R': ['lintr']
\}

" ALE formatters
" --------------
let g:ale_fixers = {
	\ '*': ['remove_trailing_lines', 'trim_whitespace'],
	\ 'python': ['black', 'isort'],
	\ 'go' : ['gofmt', 'goimports'],
	\ 'R': ['styler']
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

" Settings
" --------

" Set default command (for some reason it's not picking up the one set in the current
" shell session)
let $FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow -g '!.{git,__py*}/*' 2> /dev/null"

" Set default opts (for some reason it's not picking up the ones set in the current
" shell session)
let $FZF_DEFAULT_OPTS="--reverse --border --preview 'bat --theme ansi-dark {}'"

" Keybindings
" -----------

" fzf on buffers
nmap <leader>fb :Buffers<CR>

" fzf on files in the current directory
nmap <leader>fp :Files<CR>

" fzf for lines in the current buffer (i.e., the current file)
nmap <leader>f/b :BLines<CR>

" fzf for lines in loaded buffers
nmap <leader>f/l :Lines<CR>

" fzf for files in the current directory based on their contents (i.e., search for file
" containing specific line)
nmap <leader>fr :Rg<CR>

" fzf for all active floaterms.
nnoremap <leader>ft :Floaterms<CR>

" fzf for tags in current buffer
nnoremap <leader>ftb :BTags<CR>

" fzf for tags in current project
nnoremap <leader>ftp :Tags<CR>

" fzf for marks
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

"Open new terminal instance on the bottom (this is specifically for using a REPL other
"than the ones already specified)
"nnoremap <silent> <leader>tnr :FloatermNew --wintype=split --position=rightbelow --height=0.3 --autoclose=2<CR>
nnoremap <silent> <leader>trp :FloatermNew --position=bottom --width=0.8 --height=0.4 --autoclose=2<CR>

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
nnoremap <C-c><C-c> :FloatermSend<CR>

" Send current selection to current instance of floaterm
vnoremap <C-c><C-c> :'<,'>FloatermSend<CR>

" Send entire buffer to current instance of floaterm
nnoremap <C-c><C-x> :%FloatermSend<CR>

" Open a floaterm instance with lazygit
nnoremap <silent> <leader>tg :FloatermNew --height=0.8 --width=0.8 --autoclose=2 lazygit<CR>

" Open Python interpreter in new terminal instance
nnoremap <silent> <leader>tpp :FloatermNew --position=bottom --width=0.8 --height=0.5 --autoclose=2 python<CR>

" Open IPython interpreter in new terminal instance
nnoremap <silent> <leader>tpi :FloatermNew --position=bottom --width=0.8 --height=0.5 --autoclose=2 ipython<CR>

" Open ranger in a new terminal instance
nnoremap <silent> <leader>tr :FloatermNew --height=0.8 --width=0.8 --autoclose=2 ranger<CR>

" Open nnn in a new terminal instance
" nnoremap <silent> <leader>tr :FloatermNew --height=0.8 --width=0.8 --autoclose=2 nnn<CR>

" =========
" NERD tree
" =========

" Might get rid of NERDTree as I'm starting to find myself use it less and less especially
" with the addition of floaterm and fzf

" Open NERD tree panel
nmap <leader>d :NERDTreeToggle<CR>

" Set NERD tree width
let g:NERDTreeWinSize = 35

" ==============
" NERD commenter
" ==============

" Settings
" --------

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" Keybinds
" --------

" Try the default bindings for a while
" Remap most used NERD commenter bindings to use 'g' instead of leader key

" Commenting out current line
"nmap gcc <leader>cc

" Commenting out nested code
"nmap gcn <leader>cn

" Comment out block of code using nicer format
"nmap gcs <leader>cs

" Yank lines before commenting
"nmap gcy <leader>cy

" Toggle comment state of entire block
"nmap gct <leader>c<space>

" Toggle comment state of individual comment
"nmap gci <leader>ci

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
" let g:vimade = {}

" Set fade level
" let g:vimade.fadelevel = 0.3

" =====
" sneak
" =====

" Enable label mode for sneak. Makes sneak act more like EasyMotion.
let g:sneak#label = 1

" Reset sneak so that f and t can be used as normal
let g:sneak#f_reset = 1
let g:sneak#t_reset = 1

" Enable clever-s
let g:sneak#s_next = 1

" =====
" Vista
" =====

" Keybindings
" -----------

" Open a vista panel using ctags as the executable
" nnoremap <silent> <leader>v :Vista<CR>

" Open a vista panel using coc as the executable
" nnoremap <silent> <leader>vc :Vista coc<CR>
nnoremap <silent> <leader>v :Vista coc<CR>
" nnoremap <silent> <leader>v :Vista!! coc<CR>

" Toggle vista sidebar
" nnoremap <silent> <leader>vv :Vista! coc<CR>

" ==========
" Quickscope
" ==========

" Highlight on keypress
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" ==============
" RMarkdown stuff
" ==============

" Disable folding and spell checking
" let g:pandoc#modules#disabled = ['folding', 'spell']

" Disable conceal feature
" let g:pandoc#syntax#conceal#use = 0
