vim.cmd("language en_US.UTF-8")

local opt = vim.opt

-- ===== 基本設定（ファイルやバックアップ、読み込み関連）=====

opt.fileencoding = "utf-8" -- 文字コードをUTF-8に設定
opt.backup = false         -- バックアップファイルを作らない
opt.swapfile = false       -- スワップファイルを作らない
opt.autoread = true        -- 編集中のファイルが変更されたら自動で読み直す
opt.hidden = true          -- バッファが編集中でも他のファイルを開けるように

-- ===== UI設定（表示・ステータス・タイトル関連）=====

opt.number = true     -- 行番号を表示
opt.cursorline = true -- カーソル行をハイライト
opt.laststatus = 2    -- ステータスラインを常に表示
opt.list = true       -- 特殊文字を表示
opt.listchars = {     -- 表示する特殊文字の設定
    tab = "▸-",
    trail = "·",
    eol = "⏎",
}
opt.title = true -- タイトルを表示

-- ===== 動作設定（補完や検索、マウス操作）=====

opt.showcmd = true                      -- 入力中のコマンドを表示
opt.wildmode = { "list", "longest" }    -- コマンドライン補完の設定
opt.completeopt = { "menuone" }         -- 補完ウィンドウの設定
opt.wrapscan = true                     -- 検索時、最後まで行ったら最初に戻る
opt.mouse = "a"                         -- マウス操作を有効にする
opt.clipboard:append({ "unnamedplus" }) -- レジスタをシステムのクリップボードと同期させる

-- ===== インデントとタブ設定 =====

opt.expandtab = true  -- Tab文字を半角スペースにする
opt.autoindent = true -- 前の行のインデントを継承する
opt.tabstop = 2       -- 行頭以外のTab幅（スペース数）
opt.shiftwidth = 2    -- 行頭でのインデント幅（スペース数）

-- ===== 検索設定 =====

opt.ignorecase = true -- 検索時、大文字小文字を区別しない
opt.smartcase = true  -- 大文字を含む場合は区別する
opt.incsearch = true  -- インクリメンタルサーチ
opt.hlsearch = true   -- 検索結果をハイライト

-- ===== インデントと補完関連 =====

opt.smartindent = true -- スマートインデント
opt.showmatch = true   -- 対応する括弧を表示
