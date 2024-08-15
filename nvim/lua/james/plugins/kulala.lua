return {
  "mistweaverco/kulala.nvim",
  config = function()
    -- Setup is required, even if you don't pass any options
    require("kulala").setup()
  end,
  init = function()
    vim.filetype.add({
      extension = { ["http"] = "http" },
    })
  end,
  keys = function()
    local kulala = require("kulala")
    return {
      { "<leader>rr", kulala.run, desc = "Send the request" },
      { "<leader>rt", kulala.toggle_view, desc = "Toggle headers/body" },
      { "<leader>rp", kulala.jump_prev, desc = "Jump to previous request" },
      { "<leader>rn", kulala.jump_next, desc = "Jump to next request" },
    }
  end,
  opts = {},
}
