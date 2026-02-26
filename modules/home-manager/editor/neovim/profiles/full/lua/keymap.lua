-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

vim.g.mapleader = " "

-- ノーマルモードで、「J」を押すと、現在のバッファの一つ前のバッファに移動する（バッファ切り替え）
map("n", "J", "<Cmd>BufferPrevious<CR>")

-- ノーマルモードで、「K」を押すと、現在のバッファの一つ後のバッファに移動する（バッファ切り替え）
map("n", "K", "<Cmd>BufferNext<CR>")

-- ノーマルモードで、「Space + w」を押すと、現在のバッファを閉じる
map("n", "<Leader>w", "<Cmd>BufferClose<CR>")

-- ノーマルモードで、ESCを2回連打すると、現在の検索ハイライトが解除される
map("n", "<Esc><Esc>", "<Cmd>nohlsearch<CR><Esc>")

-- ノーマルモードで、「Space + ee」を押すことで、ファイルエクスプローラー(Neo-tree)の表示をトグルする（表示・非表示の切り替え）
map("n", "<Leader>ee", "<Cmd>Neotree toggle<CR>")

-- ノーマルモードで、「f」を押すことで、HopWordを実行
map("n", "f", "<Cmd>HopWord<CR>")
