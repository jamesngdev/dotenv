return {
  "Pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      -- your config goes here
      -- or just leave it empty :)
    })
  end,
  setup = function()
    vim.api.nvim_set_keymap("n", "<leader>ast", ":ASToggle<CR>", {
      desc = "Toggle auto save",
    })
  end,
}
