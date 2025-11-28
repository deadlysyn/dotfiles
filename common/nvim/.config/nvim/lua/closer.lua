local config = {
  close_key = '<leader>c', -- key to close buffer/window
  enabled = true,
}

-- safely close buffer, window, or exit
local function close_buffer_or_window_or_exit()
  local current_buf = vim.api.nvim_get_current_buf()
  local current_win = vim.api.nvim_get_current_win()
  local windows_with_buffer = vim.fn.win_findbuf(current_buf)

  local function count_visible_windows()
    local count = 0
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_config(win).relative == '' then
        count = count + 1
      end
    end
    return count
  end

  -- If the buffer is displayed in multiple visible windows, close only the current window
  if #windows_with_buffer > 1 then
    if count_visible_windows() > 1 then
      vim.api.nvim_win_close(current_win, false)
      return
    end
  end

  local listed_buffers = vim.tbl_filter(function(b)
    return vim.bo[b].buflisted and vim.api.nvim_buf_is_valid(b)
  end, vim.api.nvim_list_bufs())

  local function find_next_buffer()
    -- First try alternate buffer
    local alternate = vim.fn.bufnr '#'
    if
      alternate ~= -1
      and vim.api.nvim_buf_is_valid(alternate)
      and vim.bo[alternate].buflisted
    then
      return alternate
    end

    -- Then try the most recently used buffer
    local mru_buf = nil
    local max_lastused = 0
    for _, buf in ipairs(listed_buffers) do
      if buf ~= current_buf then
        local lastused = vim.fn.getbufinfo(buf)[1].lastused
        if lastused > max_lastused then
          max_lastused = lastused
          mru_buf = buf
        end
      end
    end

    return mru_buf
  end

  local function close_buffer()
    local next_buf = find_next_buffer()

    if next_buf then
      -- Try to switch to the next buffer first
      local ok = pcall(vim.api.nvim_win_set_buf, current_win, next_buf)
      if not ok then
        vim.notify('Failed to switch to next buffer', vim.log.levels.WARN)
        return
      end
    else
      vim.cmd 'enew'
    end

    -- Now try to close the buffer
    local ok, err = pcall(function()
      vim.cmd('bdelete ' .. current_buf)
    end)
    if (not ok) and vim.bo[current_buf].buflisted then
      vim.api.nvim_win_set_buf(current_win, current_buf)
      vim.notify('Failed to close buffer: ' .. err, vim.log.levels.WARN)
    end
  end

  local function exit_vim()
    vim.cmd 'quitall'
  end

  if #listed_buffers > 1 then
    close_buffer()
  else
    exit_vim()
  end
end

local function setup_buffer_mapping(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  -- Check if the key is already mapped
  local mappings = vim.api.nvim_buf_get_keymap(bufnr, 'n')
  for _, map in ipairs(mappings) do
    if map.lhs == config.close_key then
      return
    end
  end

  vim.api.nvim_buf_set_keymap(bufnr, 'n', config.close_key, '', {
    callback = function()
      if config.enabled then
        close_buffer_or_window_or_exit()
      else
        -- Execute the default behavior when plugin is disabled
        local default_action =
          vim.api.nvim_replace_termcodes(config.close_key, true, false, true)
        vim.api.nvim_feedkeys(default_action, 'n', false)
      end
    end,
    noremap = true,
    silent = true,
  })
end

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  group = vim.api.nvim_create_augroup('BufferCloserMapping', { clear = true }),
  callback = function(ev)
    setup_buffer_mapping(ev.buf)
  end,
})
