-- https://github.com/jake-stewart/multicursor.nvim
return {
  "jake-stewart/multicursor.nvim",
  lazy = false,
  branch = "1.0",
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()
    local set = vim.keymap.set
    local hl = vim.api.nvim_set_hl

    -- Ctrl+Alt+Up/Down でカーソル追加
    set({"n", "x"}, "<c-a-Up>", function() mc.lineAddCursor(-1) end)
    set({"n", "x"}, "<c-a-Down>", function() mc.lineAddCursor(1) end)

    -- 中クリックで非連続カーソル追加
    set({"n", "x"}, "<middlemouse>", mc.handleMouse)

    -- ESC3回クリックでマルチカーソル解除
    set({"n", "x"}, "<Esc><Esc><Esc>", function()
      mc.clearCursors()
    end)
  end,
  opts = {}
}
