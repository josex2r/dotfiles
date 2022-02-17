local status_ok, telescope = pcall(require, "telescope")

if not status_ok then
	return
end

-- Telescope extension
telescope.load_extension("dap")
