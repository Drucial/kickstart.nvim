require 'core.commands'
require 'core.settings'
require 'core.keymaps'
require 'core.autocmds'
require 'core.health'

require('lazy').setup({
  { import = 'plugins' },
  { import = 'kickstart' },
}, {
  ui = {
    border = 'rounded',
    size = {
      width = 0.8,
      height = 0.8,
    },
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
