" check vim-plugin
if empty(glob('~/.config/nvim/autoload/plug.vim'))
silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

lua require "user.options"
lua require "user.keymaps"
lua require "user.plugins"
lua require "user.colorscheme"
lua require "user.cmp"
lua require "user.lsp"
lua require "user.telescope"
lua require "user.gitsigns"
lua require "user.treesitter"
lua require "user.autopairs"
lua require "user.comment"
" lua require "user.nvim-tree"
lua require "user.neo-tree"
lua require "user.bufferline"
lua require "user.lualine"
lua require "user.toggleterm"
lua require "user.project"
lua require "user.impatient"
lua require "user.indentline"
lua require "user.alpha"
lua require "user.whichkey"
lua require "user.autocommands"
lua require "user.im-select"
lua require "user.noice"
" 自动保存
" autocmd InsertLeave * :w
" autocmd CursorHold,CursorHoldI * update

autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif
" ----- Plug -----
call plug#begin('~/.config/nvim/autoload/')
    " 快速跳转
    Plug 'easymotion/vim-easymotion'
    " vim中文文档
    Plug 'yianwillis/vimcdoc'
   Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    " ---- R语言 ----
    " Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
    " Plug 'voldikss/vim-floaterm'
    " Plug 'jpalardy/vim-slime' 
call plug#end()

" 插件设置
" slime设置
" let g:slime_target = "tmux"
" let g:slime_paste_file = "$HOME/.slime_paste"
" let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}
" let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
" autocmd FileType python nnoremap <buffer> <leader>f :!python % <CR>
" autocmd FileType python nmap <buffer> <leader>d <Plug>SlimeLineSend
" autocmd FileType python xmap <buffer> <leader>d <Plug>SlimeRegionSend
" autocmd FileType python nmap <buffer> <leader>p <Plug>SlimeParagraphSend
" autocmd FileType python nmap <buffer> <leader>v <Plug>SlimeConfig
" let g:slime_python_ipython = 1
" let g:slime_no_mappings = 1
" xmap <leader>c <Plug>SlimeRegionSend
" nmap <leader>c <Plug>SlimeParagraphSend
" nmap <c-c>v     <Plug>SlimeConfig

if !exists("g:slime_dispatch_ipython_pause")
  let g:slime_dispatch_ipython_pause = 100
end

function! _EscapeText_python(text)
  if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1
    return ["%cpaste -q\n", g:slime_dispatch_ipython_pause, a:text, "--\n"]
  else
    let empty_lines_pat = '\(^\|\n\)\zs\(\s*\n\+\)\+'
    let no_empty_lines = substitute(a:text, empty_lines_pat, "", "g")
    let dedent_pat = '\(^\|\n\)\zs'.matchstr(no_empty_lines, '^\s*')
    let dedented_lines = substitute(no_empty_lines, dedent_pat, "", "g")
    let except_pat = '\(elif\|else\|except\|finally\)\@!'
    let add_eol_pat = '\n\s[^\n]\+\n\zs\ze\('.except_pat.'\S\|$\)'
    return substitute(dedented_lines, add_eol_pat, "\n", "g")
  end
endfunction

" indentline
" autocmd FileType json,markdown let g:indentLine_conceallevel = 0

" ---- multi cursor ----
"按键映射前缀: <leader>v。
let g:VM_maps = {}                 "取消默认按键映射。
let g:VM_maps['Find Under'] = 'gb' "进入多光标模式并选中光标下字符串。
let g:VM_maps['Find Subword Under'] = 'gb'
let g:VM_mouse_mappings = 1
let g:VM_highlight_matches = 'underline'

" ----Nvim-R ----
let R_auto_start = 1
" let R_set_omnifunc = ["r",  "rmd", "quarto", "rnoweb", "rhelp", "rrst"]
let R_objbr_auto_start = 0
" let R_built_in_terminal = ":ToggleTerm size=80 direction=vertical"
let R_external_term = 1
" let R_applescript = 1 "run R in r.gui"
let RStudio_cmd = "/Applications/RStudio.app/Contents/MacOS/RStudio"
" let R_source = "/Users/Mingyan/.local/share/nvim/site/pack/packer/start/Nvim-R/R/tmux_split.vim"
let g:python3_host_prog = '/Users/Mingyan/anaconda3/bin/python3'
let g:ruby_host_prog = '/usr/local/bin/neovim-ruby-host'
let g:node_host_prog = '/usr/local/bin/neovim-node-host'
let g:perl_host_prog = '/usr/bin/perl'
let R_app = "radian"
let R_cmd = "R"
let R_hl_term = 0
let R_args = []  " if you had set any
let R_bracketed_paste = 1
let R_assign_map = '<M-1>'
" inoremap <TAB> <C-x><C-o>
let maplocalleader = ' ' 
let R_objbr_place = 'script,left'
function! s:customNvimRMappings()
    inoremap <M-2> <Space>%>%<Space>
    " inoremap <buffer> $ $<C-x><C-o>
    " inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endfunction
augroup myNvimR
   au!
   autocmd filetype r call s:customNvimRMappings()
augroup end
"
" Floating term -------
" nnoremap   <silent>   <M-->    :FloatermNew<CR>
" tnoremap   <silent>   <M-->    <C-\><C-n>:FloatermNew<CR>
" nnoremap   <silent>   <F8>    :FloatermPrev<CR>
" tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
" nnoremap   <silent>   <F9>    :FloatermNext<CR>
" tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
" nnoremap   <silent>   <M-=>   :FloatermToggle<CR>
" tnoremap   <silent>   <M-=>   <C-\><C-n>:FloatermToggle<CR>

