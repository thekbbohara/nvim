local filename = vim.fn.expand("%:t")
print(filename)
vim.api.nvim_create_user_command("CodeRunner", function()
  vim.cmd("!node %")
end, {})
