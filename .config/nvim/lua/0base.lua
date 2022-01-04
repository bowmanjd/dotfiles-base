vim.opt.hidden = true
vim.opt.mouse = 'a'

vim.opt.fileformat = 'unix'
vim.opt.fileformats= {'unix','dos'}

vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.clipboard = 'unnamed'
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.background = 'dark'

vim.cmd 'au BufNewFile,BufRead *.md set spell spelllang=en_us ft=markdown formatoptions=l lbr wrap textwidth=0 wrapmargin=0 nolist'
vim.cmd 'au BufNewFile,BufRead ssh_config,*/.ssh/config.d/*  setf sshconfig'
