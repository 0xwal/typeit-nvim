local M = {}

local function simulateKeypresses(keys, delay)
	vim.cmd("set paste")
	local function processKey()
		if not vim.api.nvim_buf_get_option(0, "modifiable") or vim.api.nvim_buf_get_option(0, "readonly") then
			return
		end

		if vim.api.nvim_get_mode().mode ~= "i" and vim.api.nvim_get_mode().mode ~= "c" then
			vim.api.nvim_feedkeys("i", "n", true)
		end

		vim.api.nvim_feedkeys(keys:sub(1, 1), "n", true)

		keys = keys:sub(2)

		if #keys > 0 then
			vim.defer_fn(processKey, delay)
		else
			vim.api.nvim_input("<Esc>")
			vim.cmd("set nopaste")
		end
	end

	processKey()
end

M.typeit_delay = 25

function M.typeit(opt)
	opt = opt or {}
	local content = opt.content
	local delay = opt.delay or M.typeit_delay
	if not content then
		local lines = vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), false)
		content = table.concat(lines, "\n")
		vim.api.nvim_feedkeys("gg^vG$d", "n", true)
	end
	simulateKeypresses(content, delay)
end

return M
