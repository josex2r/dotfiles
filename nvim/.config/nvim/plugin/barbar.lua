vim.cmd [[
  autocmd User CocExplorerOpenPre lua require'bufferline.state'.set_offset(31, 'FileTree')
  autocmd User CocExplorerQuitPre lua require'bufferline.state'.set_offset(0)
]]
