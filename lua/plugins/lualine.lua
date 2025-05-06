return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = ' '
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    -- PERF: we don't need this lualine require madness 🤷
    local lualine_require = require 'lualine_require'
    lualine_require.require = require

    vim.o.laststatus = vim.g.lualine_laststatus
    vim.api.nvim_set_hl(0, 'Statusline', { fg = '#ffffff', bg = 'NONE' })

    local opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        -- for use with Auratheme
        -- theme = function()
        --   local colors = require('lualine.themes.auto')
        --   return {
        --     normal = {
        --       a = colors.normal.a,
        --       b = colors.normal.b,
        --       c = { fg = colors.normal.c.fg, bg = 'none' },
        --     },
        --     insert = {
        --       a = colors.insert.a,
        --       b = colors.insert.b,
        --       c = { fg = colors.insert.c.fg, bg = 'none' },
        --     },
        --     visual = {
        --       a = colors.visual.a,
        --       b = colors.visual.b,
        --       c = { fg = colors.visual.c.fg, bg = 'none' },
        --     },
        --     replace = {
        --       a = colors.replace.a,
        --       b = colors.replace.b,
        --       c = { fg = colors.replace.c.fg, bg = 'none' },
        --     },
        --     command = {
        --       a = colors.command.a,
        --       b = colors.command.b,
        --       c = { fg = colors.command.c.fg, bg = 'none' },
        --     },
        --     inactive = {
        --       a = colors.inactive.a,
        --       b = colors.inactive.b,
        --       c = { fg = colors.inactive.c.fg, bg = 'none' },
        --     },
        --   }
        -- end,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { statusline = {}, winbar = {} },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = {},
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    }
    return opts
  end,
}
