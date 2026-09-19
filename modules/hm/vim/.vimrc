" =============================================================================
" Basic
" =============================================================================

language en_US.UTF-8              " Vimのメッセージを英語にする

set nocompatible                  " Vi互換モードを無効にする
set fenc=utf-8                    " ファイルの文字コードをUTF-8にする
filetype plugin indent on         " filetype検出・plugin・indentを有効にする

set nobackup                      " バックアップファイルを作成しない
set noswapfile                    " スワップファイルを作成しない
set autoread                      " 外部変更されたファイルを自動で読み直す
set hidden                        " 未保存bufferがあっても別bufferへ移動可能にする


" =============================================================================
" Input / Operation
" =============================================================================

set timeoutlen=200                " 複数キーmapの入力待ち時間(ms)
set clipboard=unnamedplus         " + registerをシステムClipboardとして使う
set mouse=a                       " 全モードでマウス操作を有効にする


" =============================================================================
" Syntax / Color
" =============================================================================

syntax on                         " シンタックスハイライトを有効にする

set background=dark               " 暗い背景向けの配色を使用する
set termguicolors                 " 24bit RGBカラーを有効にする

" ColorScheme適用後に背景を透明化する
augroup transparent
  autocmd!
  autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
  autocmd ColorScheme * highlight NonText ctermbg=NONE guibg=NONE
  autocmd ColorScheme * highlight SpecialKey ctermbg=NONE guibg=NONE
  autocmd ColorScheme * highlight EndOfBuffer ctermbg=NONE guibg=NONE
  autocmd ColorScheme * highlight LineNr ctermbg=NONE guibg=NONE
  autocmd ColorScheme * highlight SignColumn ctermbg=NONE guibg=NONE
augroup END

" Hop風ラベルの色をColorScheme変更後にも再適用する
augroup custom_highlight
  autocmd!
  autocmd ColorScheme * highlight HopHint
        \ gui=bold
        \ guifg=#ff007c
        \ guibg=#1e1e2e
        \ cterm=bold
        \ ctermfg=198
        \ ctermbg=234
augroup END

" カラースキームを設定する
colorscheme slate

highlight HopHint
      \ gui=bold
      \ guifg=#ff007c
      \ guibg=#1e1e2e
      \ cterm=bold
      \ ctermfg=198
      \ ctermbg=234


" =============================================================================
" UI
" =============================================================================

set title                          " Terminalタイトルを表示する
set cmdheight=2                    " コマンドラインを2行確保する
set laststatus=2                   " StatusLineを常に表示する
set statusline=%<%f\               " ファイル名
set statusline+=%w%h%m%r           " ファイル状態
set statusline+=\ [%{&ff}]/%y      " fileformat / filetype
set statusline+=\ [%{getcwd()}]    " カレントディレクトリ
set statusline+=\ [%{&encoding}]   " encoding
set statusline+=%=%-14.(%l/%L,%c%V%)\ %p%% " 行・列・ファイル位置
set ruler                          " カーソルの行・列を表示する
set number                         " 行番号を表示する
set cursorline                     " 現在行をハイライトする
set showmatch                      " 対応する括弧をハイライトする
set list                           " 不可視文字を表示する
set listchars=tab:\▸\-,trail:·,eol:⏎
set showtabline=2                  " TabLineを常に表示する
set tabline=%!BufferLine()         " TabLineにbuffer一覧を表示する


" =============================================================================
" Command Line
" =============================================================================

set showcmd                        " 入力途中のコマンドを表示する
set wildmenu                       " コマンドライン補完を有効にする
set wildmode=list:longest          " 補完候補を一覧表示する


" =============================================================================
" Indent
" =============================================================================

set expandtab                      " Tab入力をスペースへ変換する
set autoindent                     " 前行のインデントを継承する
set smartindent                    " 構文を考慮して自動インデントする
set tabstop=2                      " Tab文字の表示幅
set shiftwidth=2                   " 自動インデントの幅


" =============================================================================
" Search
" =============================================================================

set ignorecase                     " 検索時に大文字・小文字を無視する
set smartcase                      " 大文字を含む検索では大小を区別する
set incsearch                      " 入力途中から検索結果を表示する
set hlsearch                       " 検索結果をハイライトする
set wrapscan                       " 検索が末尾に達したら先頭へ戻る


" =============================================================================
" Netrw
" =============================================================================

let g:netrw_liststyle = 3          " Tree形式で表示する
let g:netrw_winsize = 20           " Netrwの横幅
let g:netrw_browse_split = 4       " ファイルを別windowで開く


" =============================================================================
" Keymap
" =============================================================================

let mapleader = "\<space>"

" wrapped lineを表示行単位で移動する
map <silent> j gj
map <silent> k gk

" 検索Highlightを解除する
nnoremap <silent> <esc> :nohlsearch<cr>

" Netrw
nnoremap <silent> <leader>e :Lexplore<cr>

" Buffer
nnoremap <silent> <leader>h :bprevious<cr>
nnoremap <silent> <leader>l :bnext<cr>
nnoremap <silent> <leader>w :call DeleteCurrentBuffer()<cr>
nnoremap <silent> <leader>b :call SelectBuffer()<cr>

" Multi cursor-like vertical selection
nnoremap <silent> <C-M-Down> <C-V>j
nnoremap <silent> <C-M-Up>   <C-V>k
xnoremap <silent> <C-M-Down> j
xnoremap <silent> <C-M-Up>   k

" Visual BlockをInsert風に操作する
xnoremap <silent> i I
xnoremap <silent> a A

" Hop風word jump
nnoremap <silent><nowait> f <cmd>call JumpToWord()<cr>


" =============================================================================
" Functions
" =============================================================================

" 現在のbufferを削除する
" 他bufferが存在する場合は先に移動してから削除する
function! DeleteCurrentBuffer() abort
  let l:current = bufnr('%')

  if len(getbufinfo({'buflisted': 1})) > 1
    bnext
    execute 'bdelete' l:current
  else
    enew
    execute 'bdelete' l:current
  endif
endfunction


" listed bufferをTabLine用の文字列へ変換する
" 現在bufferだけTabLineSelで強調する
function! BufferLine() abort
  let l:line = ''

  for l:buffer in getbufinfo({'buflisted': 1})
    if l:buffer.bufnr == bufnr('%')
      let l:line .= '%#TabLineSel#'
    else
      let l:line .= '%#TabLine#'
    endif

    let l:name = fnamemodify(bufname(l:buffer.bufnr), ':t')

    if empty(l:name)
      let l:name = '[No Name]'
    endif

    let l:line .= ' ' . l:buffer.bufnr . ':' . l:name . ' '
  endfor

  let l:line .= '%#TabLineFill#'
  return l:line
endfunction


" :ls の結果をPopup表示し、入力された1桁のbuffer番号へ移動する
function! SelectBuffer() abort
  let l:lines = split(execute('ls'), "\n")

  let l:popup = popup_create(l:lines, {
        \ 'line': 2,
        \ 'col': 1,
        \ 'padding': [0, 1, 0, 1],
        \ })

  redraw

  let l:nr = getcharstr()

  call popup_close(l:popup)

  if l:nr =~# '^[0-9]$'
    execute 'buffer ' . l:nr
  endif
endfunction


" JumpToWord()が生成したPopupをすべて閉じる
function! CloseJumpPopups(popups) abort
  for l:id in a:popups
    if popup_getpos(l:id) != {}
      call popup_close(l:id)
    endif
  endfor
endfunction


" 現在画面に見えているwordを収集し、Hop風Hintを表示して選択位置へJumpする
function! JumpToWord() abort
  let l:keys = split('asdfghjklqwertyuiopzxcvbnm', '\zs')
  let l:targets = []
  let l:labels = []
  let l:popups = []
  let l:winid = win_getid()

  " 表示範囲内のkeyword先頭を収集する
  for l:lnum in range(line('w0'), line('w$'))
    let l:text = getline(l:lnum)
    let l:start = 0

    while l:start < strlen(l:text)
      let l:match = matchstrpos(l:text, '\k\+', l:start)

      if l:match[1] < 0
        break
      endif

      let l:col = l:match[1] + 1
      let l:screen = screenpos(l:winid, l:lnum, l:col)

      " foldなどで実際に見えていない位置は除外する
      if l:screen.row > 0 && l:screen.col > 0
        call add(l:targets, {
              \ 'line': l:lnum,
              \ 'col': l:col,
              \ 'row': l:screen.row,
              \ 'scol': l:screen.col,
              \ })
      endif

      let l:start = l:match[2]
    endwhile
  endfor

  if empty(l:targets)
    return
  endif

  " 26候補までは1文字、それ以上は2文字ラベルにする
  if len(l:targets) <= len(l:keys)
    let l:labels = l:keys[0 : len(l:targets) - 1]
    let l:label_len = 1
  else
    for l:first in l:keys
      for l:second in l:keys
        call add(l:labels, l:first . l:second)

        if len(l:labels) >= len(l:targets)
          break
        endif
      endfor

      if len(l:labels) >= len(l:targets)
        break
      endif
    endfor

    let l:label_len = 2
  endif

  " 2文字ラベルで表現可能な最大676候補に制限する
  if len(l:targets) > len(l:labels)
    let l:targets = l:targets[0 : len(l:labels) - 1]
  endif

  " 各wordの先頭へHintを重ねる
  for l:i in range(0, len(l:targets) - 1)
    let l:target = l:targets[l:i]
    let l:label = l:labels[l:i]

    let l:id = popup_create(l:label, {
          \ 'pos': 'topleft',
          \ 'line': l:target.row,
          \ 'col': l:target.scol,
          \ 'minwidth': strlen(l:label),
          \ 'maxwidth': strlen(l:label),
          \ 'minheight': 1,
          \ 'maxheight': 1,
          \ 'padding': [0, 0, 0, 0],
          \ 'border': [0, 0, 0, 0],
          \ 'highlight': 'HopHint',
          \ 'zindex': 300,
          \ })

    call add(l:popups, l:id)
  endfor

  redraw

  " 1文字目を取得、Escなら即キャンセルする
  let l:input = getcharstr()

  if l:input ==# "\<esc>"
    call CloseJumpPopups(l:popups)
    redraw
    return
  endif

  " 2文字ラベルの場合のみ2文字目を取得する
  if l:label_len == 2
    let l:second = getcharstr()

    if l:second ==# "\<esc>"
      call CloseJumpPopups(l:popups)
      redraw
      return
    endif

    let l:input .= l:second
  endif

  call CloseJumpPopups(l:popups)
  redraw

  " 入力されたHintに対応する位置へJumpする
  let l:index = index(l:labels, l:input)

  if l:index >= 0 && l:index < len(l:targets)
    call cursor(
          \ l:targets[l:index].line,
          \ l:targets[l:index].col
          \ )
  endif
endfunction

" Multi cursor-like vertical selection
nnoremap <silent> <C-M-Down> <C-V>j
nnoremap <silent> <C-M-Up>   <C-V>k

xnoremap <silent> <C-M-Down> j
xnoremap <silent> <C-M-Up>   k

xnoremap <silent> i I
xnoremap <silent> a A
