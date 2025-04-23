return { -- Color Theme
  'baliestri/aura-theme',
  lazy = false,
  priority = 1000,
  config = function(plugin)
    vim.opt.rtp:append(plugin.dir .. '/packages/neovim')
    vim.cmd [[colorscheme aura-soft-dark]]

    -- Adjust highlight settings
    vim.cmd [[
        highlight Visual guibg=#3d375e guifg=NONE gui=NONE
        highlight NormalFloat guibg=NONE
        highlight WinSeparator guifg=NvimDarkGrey4 guibg=NONE
        highlight LspReferenceText guibg=NONE
        highlight SnacksPickerTitle guifg=NvimBlue

        highlight TSNone guifg=#ffca85
      ]]
  end,
}
