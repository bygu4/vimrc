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
" => fzf.vim
""""""""""""""""""""""""""""""
nmap <silent> <leader>zz :Rg<cr>
nmap <silent> <leader>zf :Files<cr>
nmap <silent> <leader>zg :GFiles<cr>
nmap <silent> <leader>zb :Buffers<cr>
nmap <silent> <leader>zw :Windows<cr>
nmap <silent> <leader>zl :Lines<cr>
nmap <silent> <leader>zm :Maps<cr>
nmap <silent> <leader>zc :Commits<cr>
nmap <silent> <leader>zd :Changes<cr>
nmap <silent> <leader>zt :Colors<cr>
nmap <silent> <leader>zh :History<cr>
nmap <silent> <leader>z: :History:<cr>
nmap <silent> <leader>z/ :History/<cr>

let g:fzf_preview_window = ['right,50%', 'ctrl-/']
let g:fzf_colors = {
\ 'fg':      ['fg', 'Normal'],
\ 'bg':      ['bg', 'Normal'],
\ 'hl':      ['fg', 'Comment'],
\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
\ 'hl+':     ['fg', 'Statement'],
\ 'info':    ['fg', 'PreProc'],
\ 'border':  ['fg', 'Ignore'],
\ 'prompt':  ['fg', 'Conditional'],
\ 'pointer': ['fg', 'Exception'],
\ 'marker':  ['fg', 'Keyword'],
\ 'spinner': ['fg', 'Label'],
\ 'header':  ['fg', 'Comment'],
\}

if has('nvim')
    " edit causes LSP issues with :ALEFindReferences -fzf, use drop
    let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit',
    \ 'enter': 'drop'
    \}
else
    " drop doesn't work, but edit doesn't cause issues here
    let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit',
    \ 'enter': 'edit'
    \}
endif


""""""""""""""""""""""""""""""
" => bufExplorer
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
nmap <silent> <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => YankStack
""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']

nmap <C-S-left> <Plug>yankstack_substitute_older_paste
nmap <C-S-right> <Plug>yankstack_substitute_newer_paste


""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

" Quickly find and open a file in the current working directory
nmap <silent> <leader>ff :CtrlP<cr>

" Quickly find and open a buffer
nmap <silent> <leader>fb :CtrlPBuffer<cr>

" Search for most recently used files
nmap <silent> <leader>fu :CtrlPMRU<cr>

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
\   '\.swn$',
\   '\.swo$',
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
\   '\.state$',
\   '^modules.order$',
\   '^Module.symvers$',
\   '^dkms.conf$',
\   '^.git$',
\   '^.cache$',
\   '^__pycache__$',
\   '^compile_commands.json$',
\   '^node_modules$',
\]

nmap <silent> <C-_> :NERDTreeToggle \| NERDTreeRefresh<cr>
nmap <silent> <leader>ng :NERDTreeVCS<cr>
nmap <silent> <leader>nc :NERDTreeCWD<cr>
nmap <silent> <leader>nr :NERDTreeRefresh<cr>
nmap <silent> <leader>nf :NERDTreeFind<cr>
nmap <leader>nb :NERDTreeFromBookmark<space>


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

nmap <silent> <C-\> :TagbarToggle<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Color scheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark

let g:sonokai_style='maia'
let g:sonokai_better_performance=1
let s:is_transparent=1

if s:is_transparent
    let g:airline_theme='transparent'
    let g:sonokai_transparent_background = 2
else
    let g:airline_theme='sonokai'
    let g:sonokai_transparent_background = 0
endif
colorscheme sonokai

function! ToggleTransparency()
    if s:is_transparent
        let g:airline_theme='sonokai'
        let g:sonokai_transparent_background = 0
        let s:is_transparent = 0
    else
        let g:airline_theme='transparent'
        let g:sonokai_transparent_background = 2
        let s:is_transparent = 1
    endif
    colorscheme sonokai
endfunction
nnoremap <silent> <leader>tt :call ToggleTransparency()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
let g:airline_powerline_fonts=1
let g:airline_detect_modified=1
let g:airline_detect_paste=1

let s:airline_use_separators = !s:is_transparent
if s:airline_use_separators
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
else
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
endif

let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#whitespace#enabled=0

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

let g:airline#extensions#ale#enabled=1
let g:airline#extensions#tagbar#enabled=1
let g:airline#extensions#nvimlsp#enabled=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>y :Goyo<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'c': ['gcc', 'clang', 'clangd'],
\   'cpp': ['gcc', 'clang', 'clangd'],
\   'rust': ['cargo', 'rustc', 'analyzer'],
\   'python': ['ruff', 'mypy', 'pyright'],
\   'go': ['gopls', 'go vet', 'golangci-lint'],
\   'latex': ['texlab', 'chktex'],
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
\   'go': ['gofmt'],
\   'latex': ['tex-fmt'],
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
nmap <silent> W <Plug>(ale_hover)

" Navigation between errors
nmap <silent> [e <Plug>(ale_previous_wrap)
nmap <silent> ]e <Plug>(ale_next_wrap)

" Navigation between definitions
nmap <silent> df <Plug>(ale_go_to_definition)
nmap <silent> tp <Plug>(ale_go_to_type_definition)
nmap <silent> im <Plug>(ale_go_to_implementation)

" Refactoring
nmap <silent> rn :ALERename<cr>
nmap <silent> rf :ALEFileRename<cr>
nmap <silent> ca :ALECodeAction<cr>
xmap <silent> ca :ALECodeAction<cr>

" Reference search
nmap <silent> fr :ALEFindReferences -fzf -relative<cr>
nmap <silent> rs :ALERepeatSelection<cr>

" Symbol search
nmap <leader>fs :ALESymbolSearch -relative<space>

nmap <silent> <leader>at :ALEToggle<cr>
nmap <silent> <leader>ai :ALEInfo<cr>
nmap <silent> <leader>al :ALELint<cr>
nmap <silent> <leader>af :ALEFix<cr>
nmap <silent> <leader>aq :ALEPopulateQuickfix<cr>
nmap <silent> <leader>aw :ALEPopulateLocList<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=1
let g:gitgutter_preview_win_floating=1

nnoremap <silent> <leader>gt :GitGutterToggle<cr>
nnoremap <silent> <leader>gp <Plug>(GitGutterPreviewHunk)
nnoremap <silent> <leader>gs <Plug>(GitGutterStageHunk)
nnoremap <silent> <leader>gu <Plug>(GitGutterUndoHunk)

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
nnoremap <silent> <leader>v :.GBrowse!<CR>
xnoremap <silent> <leader>v :GBrowse!<CR>

nnoremap <silent> <leader>gg :Git status<CR>
nnoremap <silent> <leader>gb :Git blame<CR>

" Fugitive extensions
nnoremap <silent> <leader>gl :GV<CR>
nnoremap <silent> <leader>gr :Twiggy<CR>

let g:twiggy_group_locals_by_slash = 0
let g:twiggy_local_branch_sort = 'mru'
let g:twiggy_remote_branch_sort = 'date'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-tmux-navigator
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tmux_navigator_no_mappings = 1

if exists('$TMUX')
    nnoremap <silent> <C-h> :<C-U>TmuxNavigateLeft<cr>
    nnoremap <silent> <C-j> :<C-U>TmuxNavigateDown<cr>
    nnoremap <silent> <C-k> :<C-U>TmuxNavigateUp<cr>
    nnoremap <silent> <C-l> :<C-U>TmuxNavigateRight<cr>
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Startify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_version = matchstr(execute('version'), 'Vi IMproved \zs\d[^ ]*')

let s:ascii_header = [
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

let s:ascii_footer = [
            \ "                                        _/      _/  _/",
            \ " .-.-.  .-.-.  .-.-.  .-.-.  .-.-.     _/      _/      _/_/_/  _/_/",
            \ "=`. .'==`. .'==`. .'==`. .'==`. .'=    _/     _/  _/  _/    _/    _/",
            \ "   \"      \"      \"      \"      \"       _/  _/    _/  _/    _/    _/   " . s:vim_version,
            \ "                                        _/      _/  _/    _/    _/",
            \ "",
            \ ]

let g:startify_padding_left = 20
let g:startify_custom_header = startify#pad(s:ascii_header + startify#fortune#quote())
let g:startify_custom_footer = startify#pad(s:ascii_footer)

nmap <leader>~ :Startify<cr>
