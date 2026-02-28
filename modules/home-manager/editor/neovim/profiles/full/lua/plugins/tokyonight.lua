-- https://github.com/folke/tokyonight.nvim
return {
  "folke/tokyonight.nvim",
  lazy = false,
  opts = {
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent"
    },
    on_highlights = function(hl, c)
      -- コマンドラインで highlight で Enter を押下することで、詳細確認可能
      -- :filter /^Neo/ highlight

      -- Line
      hl.LineNr = { fg = "#828bb8", bold = true }

      -- CursorLine
      hl.CursorLine = { bg = "NONE" }
      hl.CursorLineNr = { fg = c.orange, bold = true }

      -- Neo-tree.nvim
      hl.NeoTreeNormal = { bg = "NONE" }
      hl.NeoTreeNormalNC = { bg = "NONE" }

      -- barbar.nvim
      hl.BufferCurrent = { bg = "NONE", bold = true }
      hl.BufferCurrentSign = { bg = "NONE" }
      hl.BufferCurrentMod = { bg = "NONE" }
      hl.BufferInactive = { bg = "NONE", fg = c.dark5 }
      hl.BufferInactiveSign = { bg = "NONE" }
      hl.BufferInactiveMod = { bg = "NONE" }
      hl.BufferVisible = { bg = "NONE" }
      hl.BufferVisibleSign = { bg = "NONE" }
      hl.BufferTabpages = { bg = "NONE" }
      hl.BufferTabpageFill = { bg = "NONE" }
      hl.BufferOffset = { bg = "NONE" }

      -- lualine.nvim
      hl.StatusLine = { bg = "NONE" }
      hl.StatusLineNC = { bg = "NONE" }
    end
  }
}
