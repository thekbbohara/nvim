require("thekbbohara.core.opt")
require("thekbbohara.core.remap")
require("thekbbohara.core.lazy")

if vim.g.neovide then
	-- Example: Use a coding font with a fallback to an emoji font.
	vim.opt.guifont = "FiraCode Nerd Font, Noto Color Emoji:h12"
end
