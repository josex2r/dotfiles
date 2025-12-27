return {
  {
    "saghen/blink.cmp",
    keys = {
      {
        "<C-z>",
        function(cmp)
          require("blink.cmp").show()
        end,
        mode = { "i", "n", "v" },
      },
    },
  },
}
