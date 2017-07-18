To get go working in neovim(i think most of the go community uses neovim over vim), which also
makes sense in a IDE kind of feature set because we need the asynchronity of neovim 
to get awesome autocomplete features. 

call plug#begin('$HOME/.config/nvim/plugged')
    Plug 'Shougo/deoplete.nvim'
    Plug 'fatih/vim-go'
    Plug 'nsf/gocode', { 'rtp': 'nvim', 'do':'~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
    Plug 'zchee/deoplete-go', {'do': 'make'}
call plug#end()

To make it work with neovim i had to install another plugin manager than Vundle, i didn't try to make it work
for that long with vundle, so maybe it is a option to try to go back to vundle and attempt again,
to avoid the complexity of 2 package managers.

Its quite simply just to look at the github directories of plug-vim, deoplete, vim-go, gocode and deoplete-go,
and there is some python installs that has to happend, remember to restart vim once in a while going through the installation,
remember the :UpdateRemotePlugins command, that seemed helpful and was one i forgot to do. Check if neovim is compiled with python3.

I think one of the most important things aswell 


