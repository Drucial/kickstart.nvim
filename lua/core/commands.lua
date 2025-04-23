-- Override :q to close the current buffer
vim.api.nvim_create_user_command('Q', 'bd', {})

-- Override :wq to write and close the current buffer
vim.api.nvim_create_user_command('Wq', 'w | bd', {})

-- Override :wqa to write all and quit all buffers
vim.api.nvim_create_user_command('Wqa', 'wa | qa', {})

-- Create command-line abbreviations to map the lowercase commands to the new uppercase commands
vim.cmd [[
  cabbrev q Q
  cabbrev wq Wq
  cabbrev wqa Wqa
]]
