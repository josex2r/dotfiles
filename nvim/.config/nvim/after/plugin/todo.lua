local status_ok, todo = pcall(require, "todo-comments")

if not status_ok then
	require("utils.debug").log.error("Couldn't load plugin", "todo-comments.lua")
	return
end

todo.setup({})
