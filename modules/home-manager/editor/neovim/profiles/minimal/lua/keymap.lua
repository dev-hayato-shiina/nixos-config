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
