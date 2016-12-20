" neobundle
" set nocompatible
filetype plugin indent off

if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

let g:neobundle#types#git#default_protocol = 'https'

call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

" NeoBundle 'Shougo/neobundle-vim-recipes'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/vimfiler'
" NeoBundle 'Shougo/vimproc.vim' " make -f make_mac.mak
NeoBundle 'Shougo/vimproc.vim', {
\ 'build': {
\ 'mac': 'make -f make_mac.mak',
\ }
\}

" 動作が遅いのでコメント
"NeoBundle 'marcus/rsense', {
"\   'autoload': {
"\     'filetypes': 'ruby',
"\   },
"\ }
"NeoBundle 'supermomonga/neocomplete-rsense.vim'
NeoBundle 'basyura/unite-rails'
NeoBundle 'scrooloose/syntastic'
NeoBundleLazy 'alpaca-tc/alpaca_tags', {
              \    'depends': ['Shougo/vimproc'],
              \    'autoload' : {
              \       'commands' : [
              \          { 'name' : 'AlpacaTagsBundle', 'complete': 'customlist,alpaca_tags#complete_source' },
              \          { 'name' : 'AlpacaTagsUpdate', 'complete': 'customlist,alpaca_tags#complete_source' },
              \          'AlpacaTagsSet', 'AlpacaTagsCleanCache', 'AlpacaTagsEnable', 'AlpacaTagsDisable', 'AlpacaTagsKillProcess', 'AlpacaTagsProcessStatus',
              \       ],
              \    }
              \ }

NeoBundle 'tsukkee/unite-tag'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'gregsexton/gitv.git'
NeoBundle 'tpope/vim-surround'
NeoBundle 'jreybert/vimagit'

NeoBundle '29decibel/codeschool-vim-theme'
NeoBundle 'vim-scripts/dbext.vim'

NeoBundle 'thinca/vim-ref'

NeoBundle 'tpope/vim-rails'
NeoBundle 'mattn/emmet-vim'

" color scheme
NeoBundle 'google/vim-colorscheme-primary'
NeoBundle 'vim-scripts/phd'

" neo vim only
if has('nvim')
  NeoBundle 'Shougo/deoplete.nvim'
  let g:deoplete#enable_at_startup = 1
endif

NeoBundle "elixir-lang/vim-elixir"

NeoBundle 'slim-template/vim-slim'

call neobundle#end()

filetype plugin indent on

set keywordprg=:help
set noswapfile
set backupdir=~/.vim/vimbkup
" set clipboard=unnamed
set clipboard=unnamed,autoselect
set tabstop=2
set tw=0
set nowrap
set nu
set softtabstop=2
set shiftwidth=2
" tab => スペース
set expandtab

" Gstatusなどの高さ
set previewheight=25

" set lines=200
" set columns=90
" colorscheme codeschool
set encoding=UTF-8
set fileencodings=utf-8,sjis,cp932

set display=lastline
set pumheight=10
" set showmatch
" set matchtime=1

" call pathogen#infect()
" call pathogen#helptags()
set imdisable

syntax on
filetype plugin indent on


let macvim_hig_shift_movement = 1
let macvim_skip_colorscheme=1
let macvim_skip_cmd_opt_movement = 1

"unite
"unite prefix key.
nnoremap [unite] <Nop>
nmap <C-c> [unite]

"unite general settings
"インサートモードで開始
let g:unite_enable_start_insert = 1
"最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 50
 
"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''
 
"現在開いているファイルのディレクトリ下のファイル一覧。
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
"バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
"arails用
nnoremap <silent> [unite]k :<C-u>Unite rails/
"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  "ESCでuniteを終了
  nmap <buffer> <ESC> <Plug>(unite_exit)
  "入力モードのときjjでノーマルモードに移動
  imap <buffer> jj <Plug>(unite_insert_leave)
  "入力モードのときctrl+wでバックスラッシュも削除
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  "ctrl+jで縦に分割して開く
  nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  "ctrl+lで横に分割して開く
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  "ctrl+oでその場所に開く
  nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction"}}}


" Vimfiler
" nmap <Space>ff :<C-u>VimFiler -split -simple -winwidth=35 -no-quit<CR>
" nmap <Space>fd :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>

"vimデフォルトのエクスプローラをvimfilerで置き換える
" let g:vimfiler_as_default_explorer = 1
"セーフモードを無効にした状態で起動する
"let g:vimfiler_safe_mode_by_default = 0

set grepprg=grep\ -nH

" 動作がかったのでコメントアウト
" また、ctagもうまく効かない
" rsense
"let g:rsenseUseOmniFunc = 1
"if !exists('g:neocomplete#force_omni_input_patterns')
"  let g:neocomplete#force_omni_input_patterns = {}
"endif
"let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

" neocomplatecache
" 起動時に有効化
"let g:neocomplcache_enable_at_startup = 1
" 大文字が入力されるまで大文字小文字の区別を無視する
"let g:neocomplcache_enable_smart_case = 1
" 強制読み込み 
"let g:neocomplcache_enable_camel_case_completion  =  1

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" 日本語時無効化
let g:neocomplete#lock_iminsert=1
" 挿入モードから抜けるとIMを解除
set iminsert=1

" for snippets
" let g:neosnippet#disable_runtime_snippets = { '_' : 1 }
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>" 
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/snippets'

set list
set listchars=trail:-,tab:>.,extends:<,extends:>,precedes:<,nbsp:_
set cindent

" カッコの場合にカーソルを戻す
" imap {} {}<Left>
" imap [] []<Left>
" imap () ()<Left>
" imap "" ""<Left>
" imap '' ''<Left>
" imap <> <><Left>

" 無限undo
if has('persistent_undo')
	set undodir=~/.vim/undo
	set undofile
endif

source ~/.vim/bundle/matchit/plugin/matchit.vim

" 窓移動
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap <C-p> "0p<CR>

" 幅調整
nnoremap <C-w>u <C-w>>
nnoremap <C-w>d <C-w><

" シンタックスチェック
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'passive_filetypes': ['ruby'] }
"            \ 'active_filetypes': ['ruby'] } " rubyのときは保存時に実行
let g:syntastic_ruby_checkers = ['rubocop']


" 遅いのでかっこのハイライトしない
" let loaded_matchparen = 1

let g:ruby_path=""

" quick vim
nnoremap <C-q><C-r> :QuickRun<CR>

function! GetLine(val)
  %s/\(.*a:arg.*\)\|.*/\1/g
endfunction
command! -nargs=1 Line :call GetLine(<f-args>)

nnoremap Y y$
nnoremap + <C-a>
nnoremap - <C-x>

nnoremap ) <C-w>>
nnoremap ( <C-w><

" twitVim
"let twitvim_count = 50
"let twitvim_show_header = 0

" emmet vim
let g:user_emmet_mode = 'iv'
let g:user_emmet_leader_key = '<C-Y>' " load command -> <C-Y>,
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
      \ 'lang' : 'ja',
      \ 'html' : {
      \   'filters' : 'html',
      \ },
      \ 'erb' : {
      \   'extends' : 'html',
      \ },
      \ 'css' : {
      \   'filters' : 'fc',
      \ },
      \}

" tab tabnew -> (Real)Ctrl-t
nnoremap sn :tabnext<CR>

" pushlog to cust_no sql
command! LogToSql :call LogToSqlFunc()
function! LogToSqlFunc()

  %s/^.*停止.*\n//g
  %s/^.*失敗.*\n//g
  %s/^.*"datetime".*\n//g

  %s/^.*\[\(.*\)\].*$/'\1'/g

  call append(0, "select cust_no from tdevicetoken where device_token in (")

  " 1行目はSQLなので無視する
  let lines = getline(2, line("$"))
  let loop_cnt = 2
  for l in lines
    if loop_cnt % 100 == 0
      call setline(loop_cnt, l . ") union ###BREAK###select cust_no from tdevicetoken where device_token in (")
    else
      call setline(loop_cnt, l . ",")
    endif
    let loop_cnt += 1
  endfor

  %s/###BREAK###/\r/g
  %s/\(,\|(\)\n/\1/g
endfunction

command! ClearUndo :call <sid>ClearUndo()
function! s:ClearUndo()
  let old_undolevels = &undolevels
  set undolevels=-1
  exe "normal a \<BS>\<Esc>"
  let &undolevels = old_undolevels
  unlet old_undolevels
endfunction

" alpaca ctags
let g:alpaca_tags#config = {
      \ '_' : '-R --sort=yes --languages=+Ruby --languages=-js,JavaScript --exclude=*spec.rb --exclude=*spec.rb --exclude=*spec.rb --exclude=*spec.rb --exclude=*spec.rb --exclude=*spec.rb --exclude=*spec.rb --exclude=*_spec.rb > /dev/null',
      \ 'js' : '--languages=+js',
      \ '-js' : '--languages=-js',
      \ 'css' : '--languages=+css',
      \ '-css' : '--languages=-css',
      \ 'ruby': '--languages=+Ruby',
      \ '-ruby': '--languages=-Ruby',
      \ }

augroup AlpacaTags
  autocmd!
  if exists(':AlpacaTags')
    autocmd BufWritePost * AlpacaTagsUpdate ruby
    autocmd BufWritePost Gemfile AlpacaTagsBundle
    autocmd BufEnter     * AlpacaTagsSet
  endif
augroup END

" nnoremap <expr>tt  ':Unite tags -horizontal -buffer-name=tags -input='.expand("<cword>").'<CR>'
autocmd BufEnter *
    \   if empty(&buftype)
    \|      nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
    \|  endif

let g:unite_source_tag_max_fname_length = 100
" let g:unite_source_tag_strict_truncate_string = 0

autocmd BufEnter *
\   if empty(&buftype)
\|      nnoremap <buffer> <C-t> :<C-u>Unite jump<CR>
\|  endif

let g:ruby_indent_access_modifier_style="outdent"

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
