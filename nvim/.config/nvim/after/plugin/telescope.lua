local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      hijack_netrw = true,
    },
    fzf = {
    },
  },
}

telescope.load_extension('file_browser')
telescope.load_extension('fzf')

vim.keymap.set('n', '<Leader>ff', function()
  builtin.find_files()
end)
vim.keymap.set('n', '<Leader>fg', function()
  builtin.live_grep()
end)
vim.keymap.set('n', '<Leader>fb', function()
  builtin.buffers()
end)
vim.keymap.set('n', '<Leader>ft', function()
  builtin.help_tags()
end)
vim.keymap.set('n', '<Leader>fe', function()
  builtin.diagnostics()
end)
