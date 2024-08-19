return {
  "folke/twilight.nvim",
  config = function()
    vim.keymap.set("n", "<leader>vt", "<cmd>Twilight<CR>", { desc = "Focus mode toggle" })
  end,
}
