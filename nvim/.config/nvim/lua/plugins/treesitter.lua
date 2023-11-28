return {
  -- Automatically add closing tags for HTML and JSX
  {
    "windwp/nvim-ts-autotag",
    event = "LazyFile",
    opts = {
      enable_close_on_slash = false, -- https://github.com/windwp/nvim-ts-autotag/issues/124
    },
  },
}
