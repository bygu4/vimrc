"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requires that you install https://github.com/amix/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" => Enable native vim packages as described in the README
""""""""""""""""""""""""""""""
set packpath+=~/.vim_runtime


""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
let s:vim_runtime = expand('<sfile>:p:h')."/.."
call pathogen#infect(s:vim_runtime.'/sources_forked/{}')
call pathogen#infect(s:vim_runtime.'/sources_non_forked/{}')
call pathogen#infect(s:vim_runtime.'/my_plugins/{}')
call pathogen#helptags()


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <silent> <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => YankStack
""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']

nmap <C-S-left> <Plug>yankstack_substitute_newer_paste
nmap <C-S-right> <Plug>yankstack_substitute_older_paste


""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

" Quickly find and open a file in the current working directory
map <silent> <leader>ff :CtrlP<cr>

" Quickly find and open a buffer
map <silent> <leader>fb :CtrlPBuffer<cr>

" Search for most recently used files
map <silent> <leader>fu :CtrlPMRU<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'


""""""""""""""""""""""""""""""
" => ZenCoding
""""""""""""""""""""""""""""""
" Enable all functions in all modes
let g:user_zen_mode='a'


""""""""""""""""""""""""""""""
" => snipMate (beside <TAB> support <CTRL-j>)
""""""""""""""""""""""""""""""
ino <C-j> <C-r>=snipMate#TriggerSnippet()<cr>
snor <C-j> <esc>i<right><C-r>=snipMate#TriggerSnippet()<cr>
let g:snipMate = { 'snippet_version' : 1 }


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = max([30, winwidth(0) * 20 / 100])
let g:NERDTreeShowHidden = 1
let g:NERDTreeFileLines = 1
let g:NERDTreeQuitOnOpen = 1

let g:NERDTreeIgnore = [
\   '\~$',
\   '\.swp$',
\   '\.d$',
\   '\.o$',
\   '\.ko$',
\   '\.obj$',
\   '\.elf$',
\   '\.ilk$',
\   '\.map$',
\   '\.exp$',
\   '\.lib$',
\   '\.a$',
\   '\.la$',
\   '\.lo$',
\   '\.dll$',
\   '\.so$',
\   '\.so.',
\   '\.exe$',
\   '\.out$',
\   '\.app$',
\   '\.hex$',
\   '\.su$',
\   '\.idb$',
\   '\.pdb$',
\   '\.mod$',
\   '\.mod.',
\   '\.cmd$',
\   '\.pyc$',
\   '^modules.order$',
\   '^Module.symvers$',
\   '^dkms.conf$',
\   '^.git$',
\   '^.cache$',
\   '^__pycache__$',
\   '^compile_commands.json$',
\   '^node_modules$',
\]

map <silent> <C-_> :NERDTreeToggle \| NERDTreeRefresh<cr>
map <silent> <leader>nr :NERDTreeRefresh<cr>
map <silent> <leader>nf :NERDTreeFind<cr>
map <leader>nb :NERDTreeFromBookmark<space>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_position = "vertical botright"
let g:tagbar_width = max([40, winwidth(0) * 30 / 100])
let g:tagbar_sort = 0
let g:tagbar_show_tag_linenumbers = 1
let g:tagbar_show_tag_count = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_wrap = 2

map <silent> <C-\> :TagbarToggle<cr>

" Open Tagbar on startup
" Use timer to avoid freezing vim
autocmd VimEnter * nested call timer_start(100, 'tagbar#OpenWindow')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => sonokai
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:sonokai_style='maia'
let g:sonokai_better_performance=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
let g:airline_theme='sonokai'
let g:airline_powerline_fonts=1
let g:airline_detect_modified=1
let g:airline_detect_paste=1

" Airline branch extension settings
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#branch#empty_message=''
let g:airline#extensions#branch#vcs_priority=['git', 'mercurial']
let g:airline#extensions#branch#displayed_head_limit=32
let g:airline#extensions#branch#format=0

" Tabline extension settings
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_close_button=0
let g:airline#extensions#tabline#show_buffers=0
let g:airline#extensions#tabline#show_tab_type=0
let g:airline#extensions#tabline#show_tab_nr=0
let g:airline#extensions#tabline#show_splits=0
let g:airline#extensions#tabline#fnamemod=':t'

" Enable ALE support
let g:airline#extensions#ale#enabled=1

" Enable Tagbar support
let g:airline#extensions#tagbar#enabled=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'c': ['gcc', 'clang', 'clangd'],
\   'cpp': ['gcc', 'clang', 'clangd'],
\   'rust': ['cargo', 'rustc', 'analyzer'],
\   'python': ['ruff', 'mypy', 'pyright'],
\   'bash': ['shellcheck'],
\   'json': ['spectral'],
\   'yaml': ['spectral'],
\   'make': ['checkmake'],
\}

let g:ale_fixers = {
\   '*': ['trim_whitespace', 'remove_trailing_lines'],
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\   'rust': ['rustfmt'],
\   'python': ['ruff', 'ruff_format'],
\   'bash': ['shfmt'],
\   'json': ['prettier'],
\   'yaml': ['prettier'],
\   'html': ['prettier'],
\}

let g:ale_c_clangformat_use_local_file=1

" Use highlights instead of signs
let g:ale_set_signs=0
let g:ale_set_highlights=1

" Run fixes on save
let g:ale_fix_on_save=1

" Enable completion
let g:ale_completion_enabled=1

" Hover settings
let g:ale_hover_cursor=1
let g:ale_hover_to_floating_preview=1

" Showing hover information
nmap <silent> <leader>w <Plug>(ale_hover)

" Navigation between errors
nmap <silent> <leader>a <Plug>(ale_next_wrap)
nmap <silent> <leader>A <Plug>(ale_previous_wrap)

" Navigation between definitions
nmap <silent> <leader>df <Plug>(ale_go_to_definition)
nmap <silent> <leader>dt <Plug>(ale_go_to_type_definition)
nmap <silent> <leader>im <Plug>(ale_go_to_implementation)

" Reference search
nmap <silent> <leader>fr <Plug>(ale_find_references)

" Symbol search
nmap <leader>fs :ALESymbolSearch<space>

" Refactoring
nmap <silent> <leader>rn :ALERename<cr>
nmap <silent> <leader>rf :ALEFileRename<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=1
let g:gitgutter_preview_win_floating=1

noremap <silent> <leader>gt :GitGutterToggle<cr>
noremap <silent> <leader>gp <Plug>(GitGutterPreviewHunk)
noremap <silent> <leader>gs <Plug>(GitGutterStageHunk)
noremap <silent> <leader>gu <Plug>(GitGutterUndoHunk)

function! GitGutterDiffOrigToggle()
  if &diff
    wincmd p | close
  else
    GitGutterDiffOrig
  endif
endfunction

nnoremap <silent> <leader>gd :call GitGutterDiffOrigToggle()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => EditorConfig (project-specific EditorConfig rule)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EditorConfig_exclude_patterns = ['fugitive://.*']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy the link to the line of a Git repository to the clipboard
nnoremap <leader>v :.GBrowse!<CR>
xnoremap <leader>v :GBrowse!<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Startify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ascii_header = [
            \ "                            ___________ _",
            \ "  \\/                    __/   .::::.-'-(/-/)",
            \ "                     _/:  .::::.-' .-'\\/\\_`*******          __ (_))",
            \ "        \\/          /:  .::::./   -._-.  d\\|               (_))_(__))",
            \ "                     /: (\"\"\"\"/    '.  (__/||           (_))__(_))--(__))",
            \ "                      \\::).-'  -._  \\/ \\\\/\\|",
            \ "              __ _ .-'`)/  '-'. . '. |  (i_O",
            \ "          .-'      \\       -'      '\\|",
            \ "     _ _./      .-'|       '.  (    \\\\                         % % %",
            \ "  .-'   :      '_  \\         '-'\\  /|/      @ @ @             % % % %",
            \ " /      )\\_      '- )_________.-|_/^\\      @ @ @@@           % %\\/% %",
            \ " (   .-'   )-._-:  /        \\(/\\'-._ `.     @|@@@@@            ..|........",
            \ "  (   )  _//_/|:  /          `\\()   `\\_\\     |/_@@             )'-._.-._.-",
            \ "   ( (   \\()^_/)_/             )/      \\\\    /                /   /",
            \ "    )  _.-\\\\.\\(_)__._.-'-.-'-.//_.-'-.-.)\\-'/._              /",
            \ ".-.-.-'   _o\\ \\\\\\     '::'   (o_ '-.-' |__\\'-.-;~ ~ ~ ~ ~ ~~/   /\\",
            \ "          \\ /  \\\\\\__          )_\\    .:::::::.-'\\          '- - -|",
            \ "     :::''':::::^)__\\:::::::::::::::::'''''''-.  \\                '- - -",
            \ "    :::::::  '''''''''''   ''''''''''''':::. -'\\  \\     C. SWANSIGER",
            \ "_____':::::_____________________________________\\__\\______________________",
            \ ]

let g:startify_padding_left = 20
let g:startify_custom_header = startify#pad(g:ascii_header + startify#fortune#quote())

nmap <leader>~ :Startify<cr>
