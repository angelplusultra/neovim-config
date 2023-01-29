--vim.g.mapleader = ' '
--vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.number = true
vim.opt.relativenumber = true


vim.opt.tabstop = 1
vim.opt.shiftwidth = 1
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', '<leader>p', ':Prettier<CR>')

-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<C-Left>", ":tabprevious<CR>")
map("n", "<C-Right>", ":tabnext<CR>")
map("n", "<leader>f", ":Autoformat<CR>")


map("n", "<A-Down>", ":m .+1<CR>==") -- move line up(n)
map("n", "<A-Up>", ":m .-2<CR>==") -- move line down(n)
map("v", "<A-Down>", ":m '>+1<CR>gv=gv") -- move line up(v)
map("v", "<A-Up>", ":m '<-2<CR>gv=gv") -- move line down(v)
