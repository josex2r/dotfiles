local M = {}

M.diagnostics = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " ",
}

M.lsp = {
  nvim_lsp = "[ LSP]",
  nvim_lua = "[ Lua]",
  buffer = "[﬘ Buf]",
  luasnip = "[ LSnip]",
  path = "[ Path]",
  cmdline = "[ CMD]",
}

M.git = {
  added = " ",
  modified = " ",
  removed = " ",
}

M.kinds = {
  Array = { icon = " ", hl = "TSConstant" },
  Boolean = { icon = " ", hl = "TSBoolean" },
  Class = { icon = " ", hl = "TSType" },
  Codeium = { icon = " ", hl = "TSType" },
  Color = { icon = " ", hl = "TSType" },
  Constant = { icon = " ", hl = "TSConstant" },
  Constructor = { icon = " ", hl = "TSConstructor" },
  Copilot = { icon = " ", hl = "TSType" },
  Enum = { icon = " ", hl = "TSType" },
  EnumMember = { icon = " ", hl = "TSField" },
  Event = { icon = " ", hl = "TSType" },
  Field = { icon = " ", hl = "TSField" },
  File = { icon = " ", hl = "TSURI" },
  Folder = { icon = " ", hl = "TSType" },
  Function = { icon = " ", hl = "TSFunction" },
  Interface = { icon = " ", hl = "TSType" },
  Key = { icon = " ", hl = "TSType" },
  Keyword = { icon = " ", hl = "TSType" },
  Method = { icon = "ƒ ", hl = "TSMethod" },
  Module = { icon = " ", hl = "TSNamespace" },
  Namespace = { icon = " ", hl = "TSNamespace" },
  Null = { icon = "ﳠ ", hl = "TSType" },
  Number = { icon = " ", hl = "TSNumber" },
  Object = { icon = " ", hl = "TSType" },
  Operator = { icon = " ", hl = "TSOperator" },
  Package = { icon = " ", hl = "TSNamespace" },
  Property = { icon = " ", hl = "TSMethod" },
  Reference = { icon = " ", hl = "TSMethod" },
  Snippet = { icon = " ", hl = "TSType" },
  String = { icon = " ", hl = "TSString" },
  Struct = { icon = " ", hl = "TSType" },
  Text = { icon = " ", hl = "TSType" },
  TypeParameter = { icon = "𝙏 ", hl = "TSParameter" },
  Unit = { icon = " ", hl = "TSType" },
  Value = { icon = " ", hl = "TSType" },
  Variable = { icon = " ", hl = "TSConstant" },
}

return M
