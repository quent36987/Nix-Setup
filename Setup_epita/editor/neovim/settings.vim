""""""""""""""""""""""""""""""""""""""
" => Settings
"""""""""""""""""""""""""""""""""""""""
let mapleader = ","			    " Leader key
set clipboard=unnamedplus
set number relativenumber		" Line numbering
set nohlsearch                  " No highlight
set ignorecase                  " Case Insensitive search
set smartcase
set nobackup                    " No backup files
set nowrap
set encoding=UTF-8
set mouse:a
"""""""""""""""""""""""""""""""""""
" => File explorer   
"""""""""""""""""""""""""""""""""""""""
:nnoremap <C-e> :NERDTree<CR>
:nnoremap <C-p> :Telescope find_files<CR>

"""""""""""""""""""""""""""""""""""""""
" => Theme
"""""""""""""""""""""""""""""""""""""""
syntax on
set t_Co=256
set termguicolors
colorscheme nord


"""""""""""""""""""""""""""""""""""""""
" => statusbar
"""""""""""""""""""""""""""""""""""""""
au BufEnter * :let g:airline_theme='nord'
au BufEnter * :AirlineRefresh


"""""""""""""""""""""""""""""""""""""""
" => Code sytling
"""""""""""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
set expandtab

au FileType Makefile set noexpandtab

"""""""""""""""""""""""""""""""""""""""
" => Keymaps
"""""""""""""""""""""""""""""""""""""""
" edit / reload vim.rc
nnoremap <Leader>ve :e $MYVIMRC<CR>			" edit
nnoremap <Leader>vr :source $MYVIMRC<CR>	" reload

" tabs
nnoremap <C-t><BS>   :tabc<CR>      " close tab
nnoremap <C-t><C-t>  :tabnew<CR>    " new tab  
nnoremap <C-t><up>   :tabr<CR>      " first tab
nnoremap <C-t><down> :tabl<CR>      " last tab
nnoremap <C-t><left> :tabp<CR>      " previous tab
nnoremap <C-t><right> :tabn<CR> " next tab


" Add GDB
packadd termdebug
 
" Gdb Config
let g:termdebug_wide=1
let g:termdebug_popup = 0
let g:termdebug_wide = 163
 
 
" Map ESC to exit terminal mode
tnoremap <Esc> <C-\><C-n>
nnoremap <silent> <C-b> :Break<CR> // Optionnal
nnoremap <silent> <C-c> :Clear<CR> // Optionnal
nnoremap <silent> <F5> :Continue<CR> // Optionnal

