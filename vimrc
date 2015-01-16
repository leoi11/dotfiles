" Functions "
 function! RestoreSession()
   if argc() == 0 "vim called without arguments
     execute 'source ~/.vim/Session.vim'
   end
 endfunction

 function! OnVimLeave()
   execute 'tabdo NERDTreeClose'
   mksession! ~/.vim/Session.vim
 endfunction

 function! SetupVAM()
   let c = get(g:, 'vim_addon_manager', {})
   let g:vim_addon_manager = c
   let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'
   let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
   if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
     execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
         \       shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
   endif
   call vam#ActivateAddons([], {'auto_install' : 0})
 endfun

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Plugins!
"                               Managed with VAM
"                https://github.com/MarcWeber/vim-addon-manager
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Startup "
set nocompatible | filetype indent plugin on | syn on
let g:vim_addon_manager = {}
let g:vim_addon_manager.shell_commands_run_method='system'

call SetupVAM()
" use <c-x><c-p> to complete plugin names

" My plugin declarations
VAMActivate ag
VAMActivate ctrlp
VAMActivate delimitMate
VAMActivate EasyMotion
VAMActivate fugitive
VAMActivate github:airblade/vim-gitgutter
VAMActivate github:flazz/vim-colorschemes
VAMActivate github:jelera/vim-javascript-syntax
VAMActivate github:MarcWeber/vim-addon-local-vimrc
VAMActivate github:mschartman/yartr
VAMActivate github:nathanaelkane/vim-indent-guides
VAMActivate github:pangloss/vim-javascript
VAMActivate github:scrooloose/nerdtree
VAMActivate github:tpope/vim-bundler
VAMActivate html5
VAMActivate molokai
VAMActivate rails
VAMActivate Rubytest
VAMActivate rust
VAMActivate Syntastic
VAMActivate Tabular
VAMActivate tComment
VAMActivate trailing-whitespace
VAMActivate UltiSnips
VAMActivate vim-coffee-script
VAMActivate vim-snippets
VAMActivate wmgraphviz
VAMActivate YouCompleteMe
" VAMActivate github:sjl/gundo.vim

" Autocmd "
 au VimEnter * call RestoreSession()
 au VimLeave * call OnVimLeave()
 au BufLeave,CursorHold,CursorHoldI,FocusLost * silent! wa " auto save

" Mappings "
 " ctags opens in new tab
 :nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T
 nnoremap ; :
 map <C-Space> :NERDTreeToggle<CR>
 nmap <C-f> :NERDTreeFind<CR>
 nmap <C-e> :TagbarToggle<CR>

" Set vars "
 set tags=./tags,tags;$HOME
 set background=light
 colorscheme solarized
 set number
 set autochdir
 set updatetime=750
 
 "Ruby standards
 set shiftwidth=2
 set tabstop=2
 
 set cursorline
 set cursorcolumn
 set expandtab
 set autoindent " always set autoindenting on
 set pastetoggle=<F2>

" Application Specific "
 "*** ctrlp ****
  let g:ctrlp_max_depth = 50
  let g:ctrlp_max_files = 0
  let g:ctrlp_follow_symlinks = 1
  let g:ctrlp_clear_cache_on_exit = 0
 "*** NERDTree ****
  let NERDTreeChDirMode=2
