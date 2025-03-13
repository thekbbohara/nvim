return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup {
      defaults = {
        file_ignore_patterns = { "node_modules/", "venv/", ".venv/", "__pycache__", "public/static", "public/fonts","prisma/migrations" },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--ignore-file", ".gitignore",
          "--glob", "!**/node_modules/*",  -- Ignore node_modules
          "--glob", "!**/*.svg",           -- Ignore .svg files
          "--glob", "!**/*.jpg",           -- Ignore .jpg files
          "--glob", "!**/*.png",           -- Ignore .png files
          "--ignore-dir=node_modules",  -- Ignore node_modules during live_grep
          "--ignore-dir=public/static", -- Ignore node_modules during live_grep
          "--ignore-dir=public/fonts", -- Ignore node_modules during live_grep
        }
      }
    }

    local builtin = require('telescope.builtin')
    local map = vim.keymap.set

    -- Map live_grep
    map('n', '<leader>fs', builtin.live_grep, { desc = 'Telescope live grep' })
    
    -- Other mappings
    map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    map('n', '<leader>fg', builtin.git_files, { desc = 'Telescope git files' })
  end

}
