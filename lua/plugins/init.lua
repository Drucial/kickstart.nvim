return {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  { -- Center Curosr
    'arnamak/stay-centered.nvim',
  },
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
}
