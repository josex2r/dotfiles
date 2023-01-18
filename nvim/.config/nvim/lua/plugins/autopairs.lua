return {
  "windwp/nvim-autopairs",

  config = {
    -- Don't add pairs if it already has a close pair in the same line
    enable_check_bracket_line = true,
     -- will ignore alphanumeric and `.` `"` `'` symbols
    ignored_next_char = "[%w%.%'%\"]",
    -- disable in buffers of type
    disable_filetype = {
      "TelescopePrompt",
      "vim",
      "guihua",
      "guihua_rust",
      "clap_input",
      "spectre_panel",
    },
    fast_wrap = {
      map = '<C-e>',
      chars = { '{', '[', '(', '"', "'" },
      pattern = [=[[%'%"%)%>%]%)%}%,]]=],
      end_key = '$',
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      check_comma = true,
      highlight = 'Search',
      highlight_grey='Comment'
    },
  },

  init = function()
    -- If you want insert `(` after select function or method item
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')

    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )
  end,
}
