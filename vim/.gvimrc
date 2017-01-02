set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
imap <C-j> <ESC>
nnoremap <silent> <C-t><C-n> : <C-u>tn<CR>
nnoremap <silent> <C-t><C-p> : <C-u>tp<CR>

command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>') 
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction

" Change current directory.
nnoremap <silent> <Space>cd :<C-u>CD<CR>

" 半透明設定
set transparency=1
autocmd FocusGained * set transparency=5
autocmd FocusLost * set transparency=50

" -vertical

" 日本語入力能登中でIMEが解除される問題の対応
set imdisable
set visualbell t_vb=

set lines=200
set columns=100
colorscheme phd
