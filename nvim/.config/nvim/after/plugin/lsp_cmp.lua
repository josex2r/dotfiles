local exists, cmp = pcall(require, "cmp")
local utils = require("utils")
local lspkind = require('lspkind')

if not exists then
  return
end

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<Up>'] = cmp.config.disable,
    ['<Down>'] = cmp.config.disable,
    ["<C-e>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.close()
      elseif vim.b._copilot_suggestion then
        vim.fn["copilot#Dismiss"]()
      end
      -- Continue doind what this key does
      fallback()
    end, { "i", "s" }),
    ['<CR>'] = cmp.mapping.confirm({
      -- behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      -- Go to next item if cmp is visible
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        local copilot_keys = vim.fn["copilot#Accept"]()

        -- Complete with copilot if there is any suggestion
        if copilot_keys ~= "" then
          vim.api.nvim_feedkeys(copilot_keys, "i", true)
        -- Insert tab if prev char is a space
        elseif utils.keymap.check_backspace() then
          fallback()
        -- Otherwise open cmp
        else
          cmp.complete()
        end
      end
    end, { 'i', 's' }),
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      end
      fallback()
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'buffer' },
    { name = 'luasnip' },
    { name = 'path' },
  }),
  documentation = {
    border = "rounded",
  },
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      maxwidth = 50,
      menu = {
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        buffer = "[Buffer]",
        vsnip = "[Snip]",
        path = "[Path]",
        cmdline = "[CMD]",
      }
    })
  },
}
