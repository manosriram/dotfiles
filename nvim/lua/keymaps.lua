require('Navigator').setup()
require('Navigator').left()
require('Navigator').right()
require('Navigator').up()
require('Navigator').down()
require('Navigator').previous()

vim.g.mapleader = " "
nmap(",v", ":vsplit<CR>")
nmap(",h", ":split<CR>")
nmap("<C-e>", ":set nomore <Bar> :ls <Bar> :set more <CR>:b<Space>")
nmap("<Enter>", "o<ESC>")
nmap("z", "dd")
nmap("<C-b>", ":NERDTreeFocus<CR>")
nmap("<C-n>", ":NERDTreeToggle<CR>")
nmap("<Leader>l", ":tabnext<CR>")
nmap("<Leader>h", ":tabprev<CR>")
nmap("<Leader>t", ":tabnew<CR>")
nmap("<Leader>x", ":tabclose<CR>")
nmap("K", ":Rg<CR>")
nmap(";b", ":Buffers<CR>")
nmap(";f", ":Files<CR>")
nmap(";w", ":Windows<CR>")
nrmap("f", "<Plug>Lightspeed_s")
nrmap("F", "<Plug>Lightspeed_S")
nmap("gm", ":GitMessenger<CR>")
nmap("gc", ":GitMessengerClose<CR>")
nmap("gd", ":call CocActionAsync('jumpDefinition')<CR>")
nmap("mm", ":b#<CR>")

map('n', "<C-h>", '<CMD>NavigatorLeft<CR>')
map('n', "<C-l>", '<CMD>NavigatorRight<CR>')
map('n', "<C-k>", '<CMD>NavigatorUp<CR>')
map('n', "<C-j>", '<CMD>NavigatorDown<CR>')
map('n', "<C-p>", '<CMD>NavigatorPrevious<CR>')

vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})
