local M = {}

M.gitdir = function()
	local cwd = vim.fn.getcwd():gsub(" ", "\\ ")
	local gitdir = vim.fn.finddir(".git", cwd .. ";")
	return gitdir ~= ""
end

return M
