local status_ok, indent_blankline = pcall(require, "indent_blankline")

if not status_ok then
	return
end

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

vim.g.indent_blankline_filetype = {
  "javascript",
  "typescript",
  "python",
  "lua",
  "json",
  "yaml",
  "conf",
  "sh",
}
vim.gindent_blankline_filetype_exclude = {
  "lspinfo",
  "packer",
  "checkhealth",
  "help",
  "dashboard",
  "NvimTree",
  "lsp-installer",
  "aerial",
  ""
};

indent_blankline.setup({
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true
})
