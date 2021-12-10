local tree = {}

tree.toggle = function()
  require'nvim-tree'.toggle(true)

  if require'nvim-tree.view'.win_open() then
    require'bufferline.state'.set_offset(31, 'File Tree')
  else
    require'bufferline.state'.set_offset(0)
  end
end

return tree
