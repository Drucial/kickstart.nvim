-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- go to definition of word under cursor
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { desc = 'Go to definition of word under cursor' })

-- go to declaration of word under cursor
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { desc = 'Go to declaration of word under cursor' })

-- go to implementation of word under cursor
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { desc = 'Go to implementation of word under cursor' })

-- go to type definition of word under cursor
vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { desc = 'Go to type definition of word under cursor' })

-- go to references of word under cursor
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { desc = 'Go to references of word under cursor' })

-- go to document symbol of word under cursor
vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', { desc = 'Go to document symbol of word under cursor' })

-- go to workspace symbol of word under cursor
vim.keymap.set('n', 'gws', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', { desc = 'Go to workspace symbol of word under cursor' })

-- go to code action of word under cursor
vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', { desc = 'Go to code action of word under cursor' })
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Save file
vim.keymap.set({ 'n', 'v', 'i' }, '<D-s>', function()
  vim.cmd 'w'
end, { desc = 'Save file' })

-- quitfile
vim.keymap.set({ 'n', 'v', 'i' }, '<D-S>', function()
  vim.cmd 'Wq'
end, { desc = 'Quit file' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Move current line down in normal mode
vim.keymap.set('n', '<A-Down>', ':m .+1<CR>==', { desc = 'Move line down' })

-- Move current line up in normal mode
vim.keymap.set('n', '<A-Up>', ':m .-2<CR>==', { desc = 'Move line up' })

-- Move highlighted lines down in visual mode
vim.keymap.set('v', '<A-Down>', ":m '>+1<CR>gv=gv", { desc = 'Move highlighted lines down' })

-- Move highlighted lines up in visual mode
vim.keymap.set('v', '<A-Up>', ":m '<-2<CR>gv=gv", { desc = 'Move highlighted lines up' })

-- Centered page up and page down
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up half a page' })
vim.keymap.set('n', '<C-up>', '<C-u>zz', { desc = 'Scroll up half a page' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down half a page' })
vim.keymap.set('n', '<C-down>', '<C-d>zz', { desc = 'Scroll down half a page' })

-- Centered page for n resulats from search
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Neext search result in centered page' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
