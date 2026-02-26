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
      -- CursorLine
      hl.CursorLine = { bg = "NONE" }
      hl.CursorLineNr = { fg = c.orange, bold = true }

      -- lualine
      hl.StatusLine = { bg = "NONE" }
      hl.StatusLineNC = { bg = "NONE" }

      -- barbar
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

      -- neotree
      hl.NeoTreeNormal = { bg = "NONE" }
      hl.NeoTreeNormalNC = { bg = "NONE" }
      hl.NeoTreeWinBar = { bg = "NONE" }          -- 上の横棒
      hl.NeoTreeEndOfBuffer = { bg = "NONE" }     -- 下の余白（~ の部分）
      hl.NeoTreeStatusLine = { bg = "NONE" }      -- ステータスライン
      hl.NeoTreeStatusLineNC = { bg = "NONE" }
    end
  }
}
