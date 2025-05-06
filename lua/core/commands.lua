-- Function to check if the current buffer is the last listed buffer
local function is_last_listed_buffer()
  local listed_buffers = 0
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[bufnr].buflisted then
      listed_buffers = listed_buffers + 1
    end
  end
  return listed_buffers == 1
end

-- Function to check if the current buffer is a dashboard-like buffer
local function is_on_dashboard_like_buffer()
  local current_buf = vim.api.nvim_get_current_buf()
  -- Check if current buffer is unlisted and nofile type
  if not vim.bo[current_buf].buflisted and vim.bo[current_buf].buftype == 'nofile' then
    -- Additionally, check if there are no other *listed* buffers
    local other_listed_buffers_count = 0
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
      if bufnr ~= current_buf and vim.bo[bufnr].buflisted then
        other_listed_buffers_count = other_listed_buffers_count + 1
      end
    end
    return other_listed_buffers_count == 0
  end
  return false
end

-- Helper function to show the dashboard
local function show_dashboard_simple()
  vim.cmd('%bdelete!') -- Delete all buffers forcefully
  vim.cmd('enew')     -- Open a new empty buffer
  -- Configure the new buffer (optional, but good practice)
  vim.bo.buftype = 'nofile'
  vim.bo.bufhidden = 'wipe'
  vim.bo.swapfile = false
  vim.bo.buflisted = false

  -- Directly try to show Snacks dashboard as per your original commented code
  -- Ensure Snacks is globally available or require it if necessary before this call
  local success, err = pcall(vim.cmd, 'lua _G.Snacks.dashboard()')
  if not success then
    vim.notify("Error calling _G.Snacks.dashboard(): " .. tostring(err) .. "\nFalling back to UIEnter.", vim.log.levels.WARN)
    vim.api.nvim_exec_autocmds("UIEnter", { modeline = false })
  else
    vim.notify("Snacks dashboard initiated.", vim.log.levels.INFO)
  end
end

-- Custom command for :Q (mapped from :q)
vim.api.nvim_create_user_command('Q', function(opts)
  if is_on_dashboard_like_buffer() then
    vim.cmd('quitall' .. (opts.bang and '!' or ''))
  elseif is_last_listed_buffer() then
    if vim.bo.modified and not opts.bang then
      vim.notify("No write since last change for buffer " .. vim.api.nvim_get_current_buf() .. " (add ! to override)", vim.log.levels.ERROR)
      return
    end
    show_dashboard_simple()
  else
    vim.cmd('bdelete' .. (opts.bang and '!' or ''))
  end
end, { bang = true, desc = "Close buffer, show dashboard if last file, or quit if on dashboard" })

-- Custom command for :Wq (mapped from :wq)
vim.api.nvim_create_user_command('Wq', function(opts)
  if is_on_dashboard_like_buffer() then
    -- No file to write on dashboard, treat as :Q
    vim.cmd('quitall' .. (opts.bang and '!' or ''))
  else
    local write_cmd = 'write' .. (opts.bang and '!' or '')
    local write_success, write_err = pcall(vim.cmd, write_cmd)
    if not write_success then
      vim.notify("Error writing buffer: " .. tostring(write_err), vim.log.levels.ERROR)
      return -- Don't proceed if write fails
    end

    if is_last_listed_buffer() then
      show_dashboard_simple()
    else
      vim.cmd('bdelete' .. (opts.bang and '!' or ''))
    end
  end
end, { bang = true, desc = "Write buffer; close or show dashboard; or quit if on dashboard" })

-- Custom command for :Wqa (mapped from :wqa)
vim.api.nvim_create_user_command('Wqa', function(opts)
  local writeall_cmd = 'wa' .. (opts.bang and '!' or '')
  pcall(vim.cmd, writeall_cmd) -- Attempt to write all, proceed even if some fail with '!'
  show_dashboard_simple() -- Always show dashboard after attempting to write all
end, { bang = true, desc = "Write all buffers and show dashboard" })

-- Command-line abbreviations
vim.cmd("cabbrev q Q")
vim.cmd("cabbrev wq Wq")
vim.cmd("cabbrev wqa Wqa")
vim.cmd("cabbrev q! Q!")
vim.cmd("cabbrev wq! Wq!")
vim.cmd("cabbrev wqa! Wqa!")
-- Ensure :qa and :qall are not affected and work normally
vim.cmd("cabbrev qa qall")

-- Ensure other quit commands still work as expected
-- :qall (aliased above), :quitall, :cq will still quit Neovim directly.
