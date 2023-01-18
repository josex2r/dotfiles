vim.wo.foldcolumn = "0"
vim.wo.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.wo.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

return {
  "kevinhwang91/nvim-ufo",

  dependencies = {
    "kevinhwang91/promise-async",
  },

  config = {
    provider_selector = function(bufnr, filetype)
      return { "treesitter", "indent" }
    end,
  },
}
