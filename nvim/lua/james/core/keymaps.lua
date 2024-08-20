vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- vi + [chractor] to select around by charactor

local keymap = vim.keymap -- for conciseness

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>s", ":w<CR>", { desc = "Fast save" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Fast navigate window
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to Left" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window Right" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window Down" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window Up" })

keymap.set("i", "<C-h>", "<Left>", { desc = "Move to Left" })
keymap.set("i", "<C-l>", "<Right>", { desc = "Window Right" })
keymap.set("i", "<C-j>", "<Down>", { desc = "Window Down" })
keymap.set("i", "<C-k>", "<Up>", { desc = "Window Up" })

-- Fast quit
keymap.set("n", "<leader>q", ":q", { desc = "Fast quit" })

-- BarBar
keymap.set("n", "<leader>bl", "<cmd>BufferNext<CR>", { desc = "Buffer Next" })
keymap.set("n", "<leader>bh", "<cmd>BufferPrevious<CR>", { desc = "Buffer BufferPrevious" })
keymap.set("n", "<leader>bd", "<cmd>BufferClose<CR>", { desc = "Buffer Delete", silent = true })
keymap.set(
  "n",
  "<leader>bo",
  "<cmd>BufferCloseAllButCurrentOrPinned<CR>",
  { desc = "Buffer Close Other", silent = true }
)

keymap.set("n", "<leader>bdp", "<cmd>BufferPickDelete<CR>", { desc = "Buffer Pick To Delete", silent = true })

-- Telescope
keymap.set("n", "<leader>fo", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>o", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
keymap.set("n", "<leader>fb", [[<cmd>lua require('telescope.builtin').buffers()<CR>]])

-- VTSLS
keymap.set("n", "<leader>cc", "<cmd>VtsExec remove_unused<cr>", { desc = "Clean unused code" })

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- Function to safely call set_terminal_keymaps with error handling
function _G.safe_set_terminal_keymaps()
  local status, err = pcall(set_terminal_keymaps)
  if not status then
    print("Error setting terminal keymaps: " .. err)
  end
end

-- Call the safe function when entering terminal mode
vim.cmd("autocmd! TermOpen term://* lua safe_set_terminal_keymaps()")

--- Keymaps for CopilotChat
keymap.set("n", "<leader>sc", "<cmd>CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat" })

--- Toggle Term
keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })

keymap.set("n", "<leader>t1", "<cmd>1TermExec cmd='echo Hello, James'<CR>", { desc = "Open terminal 1" })
keymap.set("n", "<leader>t2", "<cmd>2TermExec cmd='echo Hello, James'<CR>", { desc = "Open terminal 2" })
keymap.set("n", "<leader>t3", "<cmd>3TermExec cmd='echo Hello, James'<CR>", { desc = "Open terminal 3" })
keymap.set("n", "<leader>t4", "<cmd>4TermExec cmd='echo Hello, James'<CR>", { desc = "Open terminal 4" })

keymap.set("n", "<leader>t1d", "<cmd>1TermExec cmd='exit'<CR>", { desc = "Open terminal 1" })
keymap.set("n", "<leader>t2d", "<cmd>2TermExec cmd='exit'<CR>", { desc = "Open terminal 2" })
keymap.set("n", "<leader>t3d", "<cmd>3TermExec cmd='exit'<CR>", { desc = "Open terminal 3" })
keymap.set("n", "<leader>t4d", "<cmd>4TermExec cmd='exit'<CR>", { desc = "Open terminal 4" })
-- DriffView
keymap.set("n", "<leader>gdo", "<cmd>DiffviewOpen<CR>", { desc = "Open Git DiffView" })
keymap.set("n", "<leader>gdc", "<cmd>DiffviewClose<CR>", { desc = "Close Git DiffView" })
keymap.set("n", "<leader>gdr", "<cmd>DiffviewRefresh<CR>", { desc = "Refesh Git DiffView" })
keymap.set("n", "<leader>gds", "<cmd>DiffviewStageFile<CR>", { desc = "Stag file" })

keymap.set("n", "<leader>nd", ':lua require("notify").dismiss()<CR>', { desc = "Clear notification" })

keymap.set("n", "<leader>y", "<cmd>Telescope yank_history<CR>", { desc = "Yank history" })

vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

vim.keymap.set("n", "<c-h>", "<Plug>(YankyPreviousEntry)")
vim.keymap.set("n", "<c-j>", "<Plug>(YankyNextEntry)")

-- Markdown
keymap.set("n", "<leader>mt", "<cmd>RenderMarkdown toggle<CR>", { desc = "Toggle markdown" })
