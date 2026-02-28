-- https://github.com/folke/noice.nvim
return {
  "folke/noice.nvim",
  lazy = false,
  event = "VeryLazy",
  dependencies = {
    {
      "MunifTanjim/nui.nvim",
      config = function()
        local Popup = require("nui.popup")
        local command_list = [[

q - コマンドリストを閉じる

<Leader> - <Space>

<検索>
Normal mode, <Esc><Esc> - 検索結果のハイライトを取り消し

<バッファ>
Normal mode, Shift + j - 1つ前のバッファに移動する
Normal mode, Shift + k - 1つ後のバッファに移動する
Normal mode, Space + w - バッファを閉じる

<プラグイン>
Normal mode, Space + ee - Neo-treeの表示をトグルする

Normal mode, Space + lg - LazyGitを表示
  LazyGitがインストールされていること（https://github.com/jesseduffield/lazygit?tab=readme-ov-file#installation）
Normal mode, LazyGitが表示された状態で、q - LazyGitを非表示
  LazyGitがインストールされていること（https://github.com/jesseduffield/lazygit?tab=readme-ov-file#installation）

Normal mode, Space + ld - LazyDockerを表示
  LazyDockerがインストールされていること（https://github.com/jesseduffield/lazydocker?tab=readme-ov-file#binary-release-linuxosxwindows）
Normal mode, LazyDockerが表示された状態で、q - LazyDockerを非表示
  LazyDockerがインストールされていること（https://github.com/jesseduffield/lazydocker?tab=readme-ov-file#binary-release-linuxosxwindows）

Normal mode, f - HopWordを実行

Normal mode, 中クリック - カーソル追加
Normal mode, Ctrl + Alt + Up - 上にカーソル追加
Normal mode, Ctrl + Alt + Down - 下にカーソル追加
Normal mode, <Esc><Esc><Esc> - マルチカーソル解除

]]
        local function show_commands()
          local popup = Popup({
            enter = true,
            focusable = true,
            border = {
              style = "rounded",
              text = {
                top = " コマンドリスト ",
                top_align = "center"
              }
            },
            position = "50%",
            size = {
              width = 80,
              height = 30
            },
            buf_options = {
              modifiable = false,
              readonly = true
            }
          })
          vim.api.nvim_buf_set_lines(popup.bufnr, 0, -1, false, vim.split(command_list, "\n"))
          popup:map("n", "q", function()
            popup:unmount()
          end, { noremap = true })
          popup:mount()
        end
        vim.keymap.set("n", "<leader>h", show_commands, { noremap = true, desc = "コマンドリストを表示" })
      end,
    },
    "rcarriga/nvim-notify"
  },
  opts = {}
}
