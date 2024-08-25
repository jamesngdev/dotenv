return {
  "sindrets/diffview.nvim",
  config = function()
    local keymap = vim.keymap

    keymap.set("n", "<leader>gdf", "<cmd>DiffviewFileHistory %<CR>", { desc = "Diff View Current File" })
    keymap.set("n", "<leader>gdb", "<cmd>DiffviewFileHistory<CR>", { desc = "Diff View Branch" })
    keymap.set("n", "<leader>gdx", "<cmd>DiffviewClose<CR>", { desc = "Diff View Close" })
  end,
}
