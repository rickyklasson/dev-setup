function DoColors(color)
	color = color or "tokyodark"
	vim.cmd.colorscheme(color)
end

DoColors()
