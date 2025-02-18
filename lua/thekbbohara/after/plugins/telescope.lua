return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup {
      defaults = {
        -- Add trailing slashes to explicitly match directories
        file_ignore_patterns = { "node_modules/", "venv/", ".venv/", "__pycache__/","public/static/charting_library" },
      }
    }
    local builtin = require('telescope.builtin')
    local map = vim.keymap.set
    map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    map('n', '<leader>fs', builtin.live_grep, { desc = 'Telescope live grep' })
    map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    -- Fixed duplicate mapping (assuming '<leader>fg' was intended for git_files)
    map('n', '<leader>fg', builtin.git_files, { desc = 'Telescope git files' })
  end
}
