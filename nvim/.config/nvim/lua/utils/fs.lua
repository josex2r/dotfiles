local fn = vim.fn

local M = {}

function M.mkdir_here()
  local dir = fn.expand('<afile>:p:h')

  if fn.isdirectory(dir) == 0 then
    fn.mkdir(dir, 'p')
  end
end

return M
