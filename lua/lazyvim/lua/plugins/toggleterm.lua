return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      auto_scroll = false,
    })
    vim.keymap.set(
      "n",
      "<leader>tt",
      "<cmd>ToggleTerm direction=tab dir=./ size=40<cr>",
      { desc = "ToggleTerm in tab." }
    )
    vim.keymap.set(
      "n",
      "<leader>tf",
      "<cmd>ToggleTerm direction=float dir=./ size=40<cr>",
      { desc = "Toggle floating terminal." }
    )
    vim.keymap.set(
      "n",
      "<leader>tv",
      "<cmd>ToggleTerm direction=vertical dir=./ size=40<cr>",
      { desc = "Toggle vertical terminal." }
    )
    vim.keymap.set(
      "n",
      "<leader>th",
      "<cmd>ToggleTerm direction=horizontal dir=./ size=40<cr>",
      { desc = "Toggle horizontal terminal." }
    )
  end,
}
-- or
-- {'akinsho/toggleterm.nvim', version = "*", opts = {--[[ things you want to change go here]]}}
