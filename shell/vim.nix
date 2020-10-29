{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [ neovim ];  
    variables = {
		  "EDITOR" = "nvim";
      "VISUAL" = "nvim";
		};
    etc = {
      "xdg/nvim/sysinit.vim".text = ''
        set tabstop=2
        set softtabstop=0 noexpandtab
        set shiftwidth=2

        syntax on
        set number relativenumber
        set statusline+=%y
        set completeopt=longest,menuone

        inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
        nnoremap <C-Down> :m .+1<CR>==
        nnoremap <C-UP> :m .-2<CR>==
        inoremap <C-Down> <Esc>:m .+1<CR>==gi
        inoremap <C-UP> <Esc>:m .-2<CR>==gi
        vnoremap <C-Down> :m '>+1<CR>gv=gv
        vnoremap <C-UP> :m '<-2<CR>gv=gv
      '';
    };
  };
}
