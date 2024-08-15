return {
    "hedyhli/outline.nvim",
    config = function()
        -- Example mapping to toggle outline
        vim.keymap.set("n", "<leader>cs", "<cmd>Outline<CR>",
                { desc = "Toggle Outline" })

        require("outline").setup {
            -- Your setup opts here (leave empty to use defaults)
        }
    end,
}