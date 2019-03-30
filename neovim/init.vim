call plug#begin()
  Plug 'haishanh/night-owl.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
call plug#end()

set number
set relativenumber
set listchars=eol:¬,trail:·,tab:»\
set noswapfile
set hidden
set ignorecase
set smartcase
set smartindent
set list
set expandtab
set shiftwidth=2
set tabstop=2
set nohlsearch

nnoremap <space> :
nnoremap <Leader>e :FZF<cr>
nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader><Leader> <c-^>

colorscheme night-owl

" FZF settings
let $FZF_DEFAULT_COMMAND = 'rg --files --glob !*node_module* --glob !*bin* --glob !*obj* --glob !*build* --glob !*packages*'

" nvim-typescript settings
let $NVIM_NODE_LOG_FILE = '/tmp/nvim-node.log'
let $NVIM_NODE_LOG_LEVEL = 'warn'
