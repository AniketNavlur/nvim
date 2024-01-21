
vim.opt.cmdheight = 1
vim.opt.mouse = "a"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.conceallevel = 0
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.background = "dark"
vim.opt.showmode = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.shortmess:append('c')
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.laststatus = 3
vim.opt.scrolloff = 3

vim.opt.foldlevelstart = 99
vim.opt.foldlevel = 99
vim.opt.foldcolumn = '0'
vim.opt.foldenable = true
vim.opt.updatetime = 300


vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]]

vim.cmd [[
  syntax enable
]]

