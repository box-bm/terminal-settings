-- ============================================================================
-- File Preview Utilities
-- ============================================================================

-- SVG preview: rasterize with rsvg-convert, display via image.nvim (Kitty protocol)
-- Requires: brew install librsvg
local function preview_svg()
	local filepath = vim.api.nvim_buf_get_name(0)
	if not filepath:match("%.svg$") then
		vim.notify("Not an SVG file", vim.log.levels.WARN)
		return
	end

	local tmpfile = vim.fn.tempname() .. ".png"

	vim.system({ "rsvg-convert", "-w", "1200", filepath, "-o", tmpfile }, {}, function(result)
		if result.code ~= 0 then
			vim.schedule(function()
				vim.notify("rsvg-convert failed. Run: brew install librsvg", vim.log.levels.ERROR)
			end)
			return
		end

		vim.schedule(function()
			local width = math.floor(vim.o.columns * 0.85)
			local height = math.floor(vim.o.lines * 0.85)
			local row = math.floor((vim.o.lines - height) / 2)
			local col = math.floor((vim.o.columns - width) / 2)

			local buf = vim.api.nvim_create_buf(false, true)
			local win = vim.api.nvim_open_win(buf, true, {
				relative = "editor",
				width = width,
				height = height,
				row = row,
				col = col,
				style = "minimal",
				border = "rounded",
				title = " " .. vim.fn.fnamemodify(filepath, ":t") .. " ",
				title_pos = "center",
			})

			local close = function()
				if vim.api.nvim_win_is_valid(win) then
					vim.api.nvim_win_close(win, true)
				end
				vim.fn.delete(tmpfile)
			end

			vim.keymap.set("n", "q", close, { buffer = buf, silent = true })
			vim.keymap.set("n", "<Esc>", close, { buffer = buf, silent = true })

			local ok, image_api = pcall(require, "image")
			if not ok then
				vim.notify("image.nvim not loaded", vim.log.levels.ERROR)
				return
			end

			local img = image_api.from_file(tmpfile, {
				buffer = buf,
				window = win,
				with_virtual_padding = true,
			})

			if img then
				img:render()
			end
		end)
	end)
end

vim.keymap.set("n", "<leader>pi", preview_svg, { desc = "Preview SVG as image" })
