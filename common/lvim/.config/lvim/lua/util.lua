local M = {}
local vim = vim

--- try requiring a submodule and do not crash all the configs
function M.try_require(name)
  local ok, _ = pcall(require, name)
  if not ok then
    local msg = string.format(
      'The configuration is not fully loaded. Requiring `%s` failed. Check the path and syntax.',
      name
    )
    vim.api.nvim_echo(
      { { 'config.lua', 'ErrorMsg' }, { ' ' .. msg } },
      true,
      {}
    )
  end
end

return M
