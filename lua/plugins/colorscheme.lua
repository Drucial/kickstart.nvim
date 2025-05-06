-- Aura Theme

-- return { -- Color Theme
--   'baliestri/aura-theme',
--   lazy = false,
--   priority = 1000,
--   config = function(plugin)
--     vim.opt.rtp:append(plugin.dir .. '/packages/neovim')
--     vim.cmd [[colorscheme aura-soft-dark]]
--
--     -- Adjust highlight settings
--     vim.cmd [[
--         highlight Visual guibg=#3d375e guifg=NONE gui=NONE
--         highlight NormalFloat guibg=NONE
--         highlight WinSeparator guifg=NvimDarkGrey4 guibg=NONE
--         highlight LspReferenceText guibg=NONE
--         highlight SnacksPickerTitle guifg=NvimBlue
--
--         highlight TSNone guifg=#ffca85
--       ]]
--   end,
-- }

return {
  { -- You can easily change to a different colorscheme.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        transparent = true,
        styles = {
          comments = { italic = false }, -- Disable italics in comments
          sidebars = 'transparent',
          floats = 'transparent',
        },
      }

      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
}
