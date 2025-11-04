return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown", "vimwiki", "pandoc.markdown", "mkd" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    -- init = function()
    --   vim.g.mkdp_filetypes = { "markdown" }
    -- end,

    keys = {
      { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview Toggle" },
    },

    config = function()
      -- 1. VimScript関数を定義
      vim.cmd([[
        function OpenMarkdownPreview (url)
          " WSL内で 'firefox' がWindows側のブラウザを起動することを利用
          " --new-window オプションを付けて新しいウィンドウで開く
          execute "silent ! firefox --new-window " . a:url
        endfunction
      ]])

      -- 2. markdown-preview.nvimにカスタム関数を設定
      vim.g.mkdp_browserfunc = "OpenMarkdownPreview"

      -- (その他の init 設定)
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },
}
