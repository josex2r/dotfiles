local status_ok, comment = pcall(require, "Comment")

if not status_ok then
	require("utils.debug").log.error("Couldn't load plugin", "Comment.lua")
	return
end

comment.setup({
	toggler = {
		line = "gcc",
		block = "gbc",
	},
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
})
