language en_US.UTF-8          " 英語に設定

set fenc=utf-8                " 文字コードをUTF-8に設定
filetype plugin indent on     " ファイルタイプの検出、プラグイン、インデントを有効にする
set nobackup                  " バックアップファイルを作らない
set noswapfile                " スワップファイルを作らない
set autoread                  " 編集中のファイルが変更されたら自動で読み直す
set hidden                    " バッファが編集中でもその他のファイルを開けるように

set nocompatible              " Vi互換モードを無効にする
set clipboard=unnamedplus     " システムクリップボードを使用する
set mouse=a                   " マウス操作を有効にする
set title                     " タイトルを表示

set background=dark           " 背景色を暗く設定する
set termguicolors             " 24ビットRGBカラーを有効にする
colorscheme elflord           " カラースキームを設定する

" 背景透過(順序を変えると効かなくなるので注意)
augroup transparent
  autocmd!
  autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
  autocmd ColorScheme * highlight NonText ctermbg=NONE guibg=NONE
  autocmd ColorScheme * highlight SpecialKey ctermbg=NONE guibg=NONE
  autocmd ColorScheme * highlight EndOfBuffer ctermbg=NONE guibg=NONE
  autocmd ColorScheme * highlight LineNr ctermbg=NONE guibg=NONE
  autocmd ColorScheme * highlight SignColumn ctermbg=NONE guibg=NONE
augroup END

set cmdheight=2               " コマンドラインの高さを2行にする
set laststatus=2              " 常にステータスラインを表示する
set ruler                     " カーソル位置の行と列番号を表示する
syntax on                     " シンタックスハイライトを有効にする
set number                    " 行番号を表示する
set cursorline                " 現在の行をハイライトする
set showmatch                 " 対応する括弧をハイライトする
set list listchars=tab:\▸\-,trail:·,eol:⏎

set showcmd                   " 入力中のコマンドをステータスに表示する
set wildmenu                  " コマンドライン補完を有効にする
set wildmode=list:longest     " コマンドライン補完モード
set wrapscan                  " 検索時に最後まで行ったら最初に戻る

set expandtab                 " Tab文字を半角スペースにする
set autoindent                " 前の行のインデントを継承する
set smartindent               " 新しい行でスマートインデントを有効にする
set tabstop=2                 " 行頭以外のTab文字の表示幅（スペースいくつ分）
set shiftwidth=2              " 行頭でのインデント幅（スペースいくつ分）

set ignorecase                " 検索時大文字小文字を区別しない
set smartcase                 " 検索時に大文字を入力した場合ignorecaseが無効になる
set incsearch                 " 検索文字列入力時に順次対象文字列にヒットさせる
set hlsearch                  " 検索語をハイライト表示
set wrapscan                  " 検索時に最後まで行ったら最初に戻る

" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
