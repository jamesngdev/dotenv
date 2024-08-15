return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = false,
      show_help = false,
      question_header = "## jamesngdev ", -- Header to use for user questions
      answer_header = "## AI ", -- Header to use for AI answers
      auto_insert_mode = true,
    },
  },
}
