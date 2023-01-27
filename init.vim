:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

call plug#begin()

if has('nvim')
  function! UpdateRemotePlugins(...)
    " Needed to refresh runtime files
    let &rtp=&rtp
    UpdateRemotePlugins
  endfunction

  Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
else
  Plug 'gelguy/wilder.nvim'

  " To use Python remote plugin features in Vim, can be skipped
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif



Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'hachy/eva01.vim', { 'branch': 'main' }
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'https://github.com/preservim/nerdtree'
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'nightsense/carbonized'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'chun-yang/auto-pairs'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'dikiaap/minimalist'
Plug 'joshdick/onedark.vim'
Plug 'prettier/prettier'
Plug 'https://github.com/xiyaowong/nvim-transparent'
Plug 'EdenEast/nightfox.nvim' 
Plug 'sainnhe/edge'
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'gelguy/wilder.nvim'
Plug 'https://github.com/LukasPietzschmann/telescope-tabs'
Plug 'yuttie/comfortable-motion.vim'
Plug 'tpope/vim-fugitive'
Plug 'https://github.com/tpope/vim-rhubarb'
if has('nvim') || has('patch-8.0.902')
	  Plug 'mhinz/vim-signify'
  else
	    Plug 'mhinz/vim-signify', { 'tag': 'legacy'  }
	endif
" Plug 'karb94/neoscroll.nvim'
" Plug 'https://github.com/gen740/SmoothCursor.nvim'
call plug#end()
" colorscheme carbonized-dark
" set background=dark
colorscheme tokyonight-night
 " if has('termguicolors')
 "          set termguicolors
 "        endif
 "        " The configuration options should be placed before `colorscheme edge`.
 "        let g:edge_style = 'aura'
 "        let g:edge_better_performance = 1
 "     colorscheme edge		"
	"colorscheme eva01-LCL
	"colorscheme onedark
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')	
let g:quantum_italics=1
let g:transparent_enabled = v:true
nnoremap <C-t> :TerminalVSplit zsh<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-s> :w<CR>
nnoremap <A-f> :NERDTreeToggle<CR>

set updatetime=100

" CocConfig
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

if has('nvim')
	  inoremap <silent><expr> <c-space> coc#refresh()
  else
	    inoremap <silent><expr> <c-@> coc#refresh()
	endif
" if has('nvim-0.4.0') || has('patch-8.2.0750')
"   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" endif


"---Wilder---


" Default keys

" Key bindings can be changed, see below
call wilder#setup({'modes': [':', '/', '?']})

call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#cmdline_pipeline(),
      \     wilder#search_pipeline(),
      \   ),
      \ ])

call wilder#set_option('renderer', wilder#wildmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ }))

" 'highlighter' : applies highlighting to the candidates
call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ }))
call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'pumblend': 5,
      \ }))
"---Move Lines Remapping---


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>tt <cmd>Telescope telescope-tabs list_tabs<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>


"---NEO SCROLL---
" lua require('neoscroll').setup()


let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

" nnoremap <silent> <C-;> :call comfortable_motion#flick(100)<CR>
" nnoremap <silent> <C-'> :call comfortable_motion#flick(-100)<CR>
" ---Line Mover---
" nnoremap <A-Down> :m .+1<CR>==
" nnoremap <A-Up> :m .-2<CR>==
" inoremap <A-Down> <Esc>:m .+1<CR>==gi
" inoremap <A-Up> <Esc>:m .-2<CR>==gi
" vnoremap <A-Down> :m '>+1<CR>gv=gv
" vnoremap <A-Up> :m '<-2<CR>gv=gv


" ---Line Mover Hyper Terminal ---
nnoremap <S-Down> :m .+1<CR>==
nnoremap <S-Up> :m .-2<CR>==
inoremap <S-Down> <Esc>:m .+1<CR>==gi
inoremap <S-Up> <Esc>:m .-2<CR>==gi
vnoremap <S-Down> :m '>+1<CR>gv=gv
vnoremap <S-Up> :m '<-2<CR>gv=gv

nmap <F8> :TagbarToggle<CR>
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : <Tab>
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
