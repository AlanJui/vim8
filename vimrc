"===========================================================
" Maintainer:
"       Alan Jui : alanjui.1960@gmail.com
" Version:
"       V 0.7.0    2021/02/09 20:56
"===========================================================

scriptencoding utf-8
set shell=$SHELL
set nocompatible
let g:mapleader = ","

au FocusGained,BufEnter * :silent! checktime
au FocusLost,WinLeave * :silent! w

" bash-language-server
if executable('bash-language-server')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'bash-language-server',
                \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bash-language-server start']},
                \ 'allowlist': ['sh'],
                \ })
endif

"===========================================================
" 擴充套件(Plugins)
"===========================================================
" 需安裝之擴充套件
source ~/.vim/plugins.vim

" 擴充套件設定（Configuration of Plugins)
source ~/.vim/config/nerdtree.rc.vim
source ~/.vim/config/ranger.vim
source ~/.vim/config/fzf.vim
source ~/.vim/config/surround.vim
source ~/.vim/config/auto-pairs.vim
source ~/.vim/config/multiple-cursors.vim
source ~/.vim/config/simply-fold.vim
source ~/.vim/config/nerd-commenter.vim
source ~/.vim/config/change-tag-name.vim
source ~/.vim/config/live-server.vim
source ~/.vim/config/markdown-preview.vim
source ~/.vim/config/window-swap.vim
source ~/.vim/config/float-term.vim
source ~/.vim/config/echodoc.vim
source ~/.vim/config/plantuml-previewer.vim
source ~/.vim/config/find-and-replace.vim
source ~/.vim/config/vim-closetag.vim

"===========================================================
" Vim 通用設定
"===========================================================
source ~/.vim/global.vim

"==========================================================
" 程式碼版面與格式設定
"==========================================================
source ~/.vim/format.vim

" Fix conflicts with indentLine and vim-json
let g:vim_json_syntax_conceal=0
let g:indentLine_noConcealCursor=""
let g:indentLine_noConcealCursor="nc"

"==========================================================
" COC-NVIM 配合環境
" https://github.com/neoclide/coc.nvim/wiki/Language-servers#bash
"==========================================================
" source ~/.vim/coc-nvim.vim
source ~/.vim/my-coc-config.vim
source ~/.vim/config/coc-explorer.vim

"==========================================================
" 快速鍵設定
"==========================================================
source ~/.vim/keymap.vim

source ~/.vim/config/which-key.vim

"==========================================================
" 使用者操作介面設定
"==========================================================
source ~/.vim/UI.vim

" Theme Colors
if $TERM_PROGRAM == "Apple_Terminal"
    set notermguicolors

    try
        colorscheme OceanicNext
    catch
        colorscheme gruvbox
    endtry

    let g:airline_theme='oceanicnext'

else
    source ~/.vim/config/color-theme-ccc.vim
endif

" Status line
" source ~/.vim/config/light-line.vim
source ~/.vim/config/airline-theme.vim

"==========================================================
" 其它設定
"==========================================================
source ~/.vim/Misc.vim

if has("unix")
    let s:uname = system("uname -s")
    " Do Mac stuff
    if s:uname == "Darwin\n"
        source ~/.vim/vimrc.osx
    endif
endif

" set exrc

" Don't convert tab to spaces
" set tabstop=4
" set expandtab
" set list!
" if has('gui_running')
"     set listchars=tab:▶\ ,trail:·,extends:\#,nbsp:.
" else
"     set listchars=tab:>.,trail:.,extends:\#,nbsp:.
" endif


set tabstop=4
set et!
set expandtab!
set noexpandtab
" setlocal list
" set listchars=tab:▷▷,trail:.
" Highlight tabs as errors.
" https://vi.stackexchange.com/a/9353/3168
" match Error /\t/

" To use fzf in Vim
set rtp+=/usr/local/opt/fzf
