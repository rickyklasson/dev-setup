function DoColors(color)
	color = color or "nord"
	vim.cmd.colorscheme(color)
end

DoColors()
