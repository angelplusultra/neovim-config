-- require('nvim-treesitter.configs').setup{
-- ensure_installed = { "javascript", "typescript", "lua", "vim", "json", "html", "rust", "tsx" },
-- sync_install = false,
-- auto_install = true,
-- highlight = {
-- enable = true,
-- indent = {
--   enable = true,
-- }
-- }

local treesitter = require'nvim-treesitter.configs'

treesitter.setup {
  ensure_installed = {
    'c', 'cpp', 'dart', 'go', 'html', 'java', 'javascript', 'python', 'ruby',
    'rust', 'typescript'
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true
  },
  indent = {
    enable = false
  },
  autotag = {
      enable = true
  }
} 
