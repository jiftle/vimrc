" gvim或MacVim字体设置
set guifont=DroidSansMono\ Nerd\ Font\ Mono\ 10


" -------------------- 插件声明 ------------
call plug#begin('~/.vim/plugged')

" 默认配置，Tab空格设置
Plug 'jiftle/vim-jiftle-conf-default'
Plug 'jiftle/vim-jiftle-listchars'

" 常用插件集合
Plug 'jiftle/vim-jiftle-plugins-sets'
" BusHound抓包文件，语法高亮
Plug 'jiftle/vim-jiftle-bushound-syntax'

" Markdown博客预览插件
Plug 'jiftle/vim-jiftle-gitmdblog'

" ==================== vim功能增强 ========================
" 中文帮助
Plug 'yianwillis/vimcdoc'


" ==================== 构建基本的IDE框架 ==================
" left : 树状文件浏览器
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" right : 显示tag
Plug 'majutsushi/tagbar'
" Bottom-Popup : 最近打开文件列表
Plug 'vim-scripts/mru.vim'
" Bottom : 好看的状态栏
Plug 'vim-airline/vim-airline'

" ------------- 文件修改历史 ------------
"  打开文件时，停留在上次编辑的位置
Plug 'farmergreg/vim-lastplace'
" 文件修改历史可视化 :UndotreeToggle
Plug 'mbbill/undotree'


" git状态显示, nerdtree的扩展
Plug 'Xuyuanp/nerdtree-git-plugin' 

" --------------- 美化 ----------------
" 文件浏览器显示好看的图标
Plug 'ryanoasis/vim-devicons'

" ------------- 模糊搜索 --------------
" 全局搜索某个单词，ubuntu需要在机器上安装`apt-get install ack-grep
Plug 'mileszs/ack.vim'

" ==================== 主题配色 ====================
Plug 'morhetz/gruvbox'
Plug 'liuchengxu/space-vim-theme'
Plug 'iCyMind/NeoSolarized'
Plug 'joshdick/onedark.vim'

" ----------------- git插件，状态栏显示状态，快捷提交 -------------------------
Plug 'https://github.com/tpope/vim-fugitive.git'

" ====================== 通用开发语言支持 ======================
" ----------------- 自动补全插件 -------------------------
Plug 'https://gitee.com/mirrors_trending/coc.nvim.git'

" ----------- 批量注释 ---------------
Plug 'scrooloose/nerdcommenter'
" ---------------- 快捷代码块 --------------
" 支持代码片段功能, coc.nvim 功能更强，所以注释
" 如果coc.nvim，可以使用该插件
"Plug 'SirVer/ultisnips'
" " 常用的代码片段
Plug 'honza/vim-snippets'
" " 自定义片段插件，解决键位YCM冲突
Plug 'jiftle/vim-jiftle-snippets'


" ====================== golang 开发支持 ======================
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


" ====================== TypeScript 开发支持 ======================
" 支持TypeScript
Plug 'leafgarland/typescript-vim'


" ------------- Emacs的Org-Mode，一种生活方式 -------------
" vim-orgmode的依赖，<C-A>/<C-X>增加减少日期
Plug 'tpope/vim-speeddating'
" " 缩窄到可视区域
" Plug 'chrisbra/NrrwRgn'
" Plug 'jceb/vim-orgmode'
" 
" ----------------- Markdown 预览firefox --------------------
" If you have nodejs and yarn
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" ----------------- Markdown 支持 --------------------
Plug 'plasticboy/vim-markdown'
" ----------------- Markdown TOC 支持 --------------------
Plug 'mzlogin/vim-markdown-toc'


" " ======================== 时间管理 =======================
" " -------------- 记录Coding时间，存储到云端，有好看的图表 ------------
Plug 'wakatime/vim-wakatime'
" 
" " -------------- 翻译工具 ----------------
" "  有道翻译
" Plug 'voldikss/vim-translator'
" 
" Plug 'jiftle/vim-jiftle-evernote-sync'

" " =================== 测试区 ======================

" Plug 'godlygeek/tabular'
" 
" " 提供类似TurbC的菜单栏
" Plug 'skywind3000/vim-quickui'
" 
" " =============== 没搞明白的插件 ===================
" " 一款文本对齐的插件，非常神奇
" " Plug 'junegunn/vim-easy-align'
" 
" " ===================== 暂时无用的插件 =====================



" Initialize plugin system
call plug#end()

"" --------------- 快捷代码块，配置 -----------------
"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"


" -------------------- tagbar ---------------
" 设置tagbar的窗口宽度
let g:tagbar_width=30
"
" ----------------- 编译 ---------------
" 编译
func! CompileRunGcc()
    exec "w"
    "exec "!clear"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'javascript'
		exec "!node %<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
        exec "!time python3 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
    "    exec "!go build %<"
    "    exec "!time go run %"
         exec ":GoBuild"
         exec ":GoRun"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
	endif
endfunc

" " ---------------- 根据不同平台，设置默认的配色方案 ---------------
" if has('unix')
"   "设置默认配色方案
"   colorscheme default
" elseif has('win64')
"   " win7
"   colorscheme darkblue
" elseif has('win32')
"   " xp
"   colorscheme blue
" else
" endif

" ------------- vim-markdown 关闭自动折叠 -----------------
let g:vim_markdown_folding_disabled = 1



let g:UltiSnipsUsePythonVersion=3
" let g:coc_disable_startup_warning = 1


" colorscheme morning
    
" ----------------- 印象笔记 同步插件 ---------------------
let g:evervim_devtoken='S=s999:U=9ee99c9:E=999d9999c99:C=99a99a99999:P=9cd:A=en-devtoken:H=cd99999de9999c99b999d99d999cb9f9'
"let g:coc_disable_startup_warning = 1

" --------------------- coc.nvim 配置 ---------------------------
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" -------------------------------------- 键盘映射 -------------------------------
" 大纲标签
map <F3> :TagbarToggle<CR>
" 文件管理器
map <F4> :NERDTreeToggle<CR>
" 编译并运行
map <F5> :call CompileRunGcc()<CR>
" 最近打开文件列表
map <F6> :MRU<CR>
" Markdown 预览
map <F7> :MarkdownPreview<CR>

set bg=light
colo space_vim_theme
" colo gruvbox
