" .ideavimrc is a configuration file for IdeaVim plugin. It uses
"   the same commands as the original .vimrc configuration.
" You can find a list of commands here: https://jb.gg/h38q75
" Find more examples here: https://jb.gg/share-ideavimrc


"" -- Suggested options --
" Show a few lines of context around the cursor. Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5

" Do incremental searching.
set incsearch


" Don't use Ex mode, use Q for formatting.
map Q gq

" --- Enable IdeaVim plugins https://jb.gg/ideavim-plugins

" Highlight copied text
Plug 'machakann/vim-highlightedyank'
" Commentary plugin
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" plug 'preservim/nerdtree'

set clipboard+=unnamed
set number
set relativenumber
set autoindent
set cindent
set title
set autoindent
set hlsearch

set cursorline
set showcmd
set wildmenu

set sneak
"" -- Map IDE actions to IdeaVim -- https://jb.gg/abva4t
"" Map \r to the Reformat Code action
"map \r <Action>(ReformatCode)

"" Map <leader>d to start debug
"map <leader>d <Action>(Debug)

"" Map \b to toggle the breakpoint on the current line
"map \b <Action>(ToggleLineBreakpoint)

let mapleader = " "

map J 5j
map K 5k

" 插入模式快速移动
inoremap <C-a> <Home>
inoremap <C-e> <End>
" 其他模式快速移动
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $
" 快速进行缩进
nnoremap > >>
nnoremap < <<

nmap == :<C-u>action ReformatCode<CR>
vmap == :<C-u>action ReformatCode<CR>
nmap <C-o> :action back<CR>

nmap ge :action GotoNextError<CR>
nmap cm :action CodeMenu<CR>
nmap <leader>gh :action ShowUsages<CR>
nmap <leader>gy :action ShowModulesDependencies<CR>
nmap <leader>gi :action GotoImplementation<CR>
nmap <leader>gs :action FileStructurePopup<CR>
nmap gd :action GotoDeclaration<CR>
nmap <leader>gr :action FindUsages<CR>
nmap <leader>dd :action QuickJavaDoc<CR> " 显示文档
nmap <leader>o :action FileStructurePopup<CR> " 大纲
nmap <Enter> :action EditorSelectWord<CR>
nmap <leader><Enter> :noh<CR>

xmap <Enter> :action EditorSelectWord<CR>
nmap <BS> :action EditorUnSelectWord<CR>
xmap <BS> :action EditorUnSelectWord<CR>

nmap <C-j> :action GotoNextElementUnderCaretUsage<CR>
nmap <C-k> :action GotoPrevElementUnderCaretUsage<CR>

nmap <leader>rn :action RenameElement<CR>
nmap <C-g> :action Annotate<CR>
nmap gcc :action CommentByLineComment

nmap Q :wq<CR>
nmap s <nop>
nmap S :action SaveAll<CR>
nmap C :action ShowIntentionActions<CR>
" nmap ca :action ShowIntentionActions<CR>
nmap <C-\> :action ActivateTerminalToolWindow<CR>

" nmap x \"_x
nmap = nzz
nmap - Nzz
nmap dw vb\"_d

"nmap <C-a> gg<S-v>G
nmap <leader>ss :split<Return><C-w>w<CR>
nmap <leader>sv :vsplit<Return><C-w>w<CR>

imap jk <C-c>

"Refactor
nnoremap <leader>n :action Inline<CR>
vnoremap <leader>n :action Inline<CR>
set sneak
