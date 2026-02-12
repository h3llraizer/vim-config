" ===== Basic Vim settings =====
syntax on                   " Enable syntax highlighting
filetype plugin indent on   " Enable filetype detection and indentation
set number                  " Show line numbers
set relativenumber          " Show relative numbers
set tabstop=4
set shiftwidth=4
set expandtab               " Use spaces instead of tabs
set clipboard=unnamed
set mouse=a                 " Enable mouse support
set hlsearch

set cursorline              " Highlight current line

set hidden  "allows switching buffers without saving first.

" Enable true color support everywhere
if has('termguicolors')
    set termguicolors
endif

" remap completion menu from space to . and ->

" ===== VIM Key-Mappings =====
" ===== Visual Mode =====
vnoremap <leader>c :s/^/\/\/<CR>  
" Uncomment selected lines
vnoremap <leader>u :s/^\/\/<CR>

" ===== Insert Mode =====
" Trigger coc completion manually
"inoremap <silent><expr> <C-Space> coc#refresh()

inoremap <silent><expr> : CheckDoubleColon()

function! CheckDoubleColon() abort
  " If the previous character was :, insert : + trigger refresh
  if getline('.')[col('.')-2] ==# ':'
    return ':' . coc#refresh()
  else
    return ':'
  endif
endfunction

inoremap <silent><expr> . '.' . coc#refresh()
" inoremap <silent><expr> . '.' . coc#refresh() "->


" Navigate completion popup safely
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

" Accept selected completion item
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"

" ===== Normal Mode =====
" Jump to definition / references
nnoremap gd <Plug>(coc-definition)
nnoremap gr <Plug>(coc-references)
nnoremap K  :call CocActionAsync('doHover')<CR>

" ===== VIM Highlighting =====
"569CD6 - VS Keyword
highlight vimHighlight ctermfg=15 ctermbg=8 guifg=#FFFFFF guibg=#3A3A3A
highlight CursorLine guibg=#222222 gui=NONE cterm=NONE
highlight Function guifg=#DCDCAA gui=NONE ctermfg=214 cterm=NONE
"highlight Keyword guifg=#569CD6 gui=NONE ctermfg=214 cterm=NONE
highlight Comment guifg=#6A9955 gui=NONE

" Standard Vim highlight groups
highlight Statement         guifg=#569CD6 gui=NONE
highlight Type              guifg=#569CD6 gui=NONE
highlight StorageClass      guifg=#569CD6 gui=NONE
highlight Label             guifg=#569CD6 gui=NONE
highlight Keyword           guifg=#569CD6 gui=NONE
highlight Conditional       guifg=#569CD6 gui=NONE
highlight Repeat            guifg=#569CD6 gui=NONE
highlight Operator          guifg=#569CD6 gui=NONE
highlight cTypeName         guifg=#DCDCAA gui=NONE
highlight cppSTLvariable    guifg=#4EC9B0 gui=NONE
highlight cppSTLnamespace    guifg=#4EC9B0 gui=NONE


" Normal popup menu items
highlight Pmenu ctermfg=15 ctermbg=8 guifg=#FFFFFF guibg=#3A3A3A
" Selected item in popup menu
highlight PmenuSel ctermfg=0 ctermbg=14 guifg=#000000 guibg=#87CEEB
" Scrollbar in popup menu (optional)
highlight PmenuSbar ctermbg=7 guibg=#AAAAAA
highlight PmenuThumb ctermbg=4 guibg=#555555



" ===== C & C++ Modern Syntax Highlighting =====
let g:cpp_modern_highlight_stdlib = 1
let g:cpp_modern_highlight_operators = 1
let g:cpp_modern_highlight_functions = 1
" ===== C & C++ Modern Syntax Highlighting =====


" ===== CoC =====
highlight link CocType Type
highlight link CocFunction Function
" ===== highlighting colors =====
highlight CocErrorHighlight     cterm=underline ctermfg=Red     guifg=#FF0000 guibg=NONE gui=undercurl
highlight CocWarningHighlight   cterm=underline ctermfg=Yellow  guifg=#FFFF00 guibg=NONE gui=underline
highlight CocInfoHighlight      cterm=underline ctermfg=Blue    guifg=#00BFFF guibg=NONE gui=underline
highlight CocHintHighlight      cterm=underline ctermfg=Cyan    guifg=#00FFFF guibg=NONE gui=underline
" ===== completion menu colors =====
highlight CocMenu ctermfg=15 ctermbg=8 guifg=#FFFFFF guibg=#3A3A3A
highlight CocMenuSel ctermfg=0 ctermbg=14 guifg=#000000 guibg=#87CEEB
highlight CocMenuSbar ctermbg=7 guibg=#AAAAAA
highlight CocMenuThumb ctermbg=4 guibg=#555555
" ===== CoC =====

