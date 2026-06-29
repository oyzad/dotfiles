vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end
-- map('n', '<leader>f', ":Pick files<CR>", "Open file picker")
map('n', '<leader>h', ":Pick help<CR>", "Open help picker")
map('n', '<leader>e', '<cmd>Oil<CR>', 'Open file explorer')

-- System clipboard
map('n', '<leader>y', '"+y', 'Yank to system clipboard')
map('n', '<leader>Y-default', '"+Y-default', 'Yank to system clipboard')
map('n', '<leader>d', '"+d', 'Delete to system clipboard')
map('n', '<leader>D', '"+D', 'Delete to system clipboard')
map('n', '<leader>p', '"+p', 'Paste from system clipboard')
map('n', '<leader>P', '"+P', 'Paste from system clipboard')
map('n', '<leader>w', "<Cmd>update<CR>", 'Write the current buffer')

-- window management 
map('n', '<leader>sv', '<C-w>v', 'Split window vertically')
map('n', '<leader>sn', '<C-w>w', 'Next window')
map('n', '<leader>sh', '<C-w>s', 'Split window horizontally')
map('n', '<leader>se', '<C-w>=', 'Make splits equal size')
map('n', '<leader>sx', ':close<CR>', 'Close current split')

-- tab management
map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", "Go to next buffer")
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", "Go to previous buffer")
map("n", "<leader>x", "<cmd>bdelete<CR>", "Close current buffer")
map("n", "<leader>n", "<cmd>tabnew<CR>", "New tab" )
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Nvim obsidian 
map('n', '<leader>od', ':tabe ~/Documents/HOMEWORK/home/Obsidian/Notes/Daily.md<CR>', 'Open obsidian daily note' )
map('n', '<leader>oo', ':ObsidianOpen <CR>', 'Open obsidian in current file.')
map('n', "<leader>os", ":ObsidianSearch<CR>", "Search Obsidian notes")
map('n', "<leader>ol", ":ObsidianLinks<CR>", "Obsidian note links")
map('n', "<leader>oq", ":ObsidianQuickSwitch<CR>", "Obsidian quick switch")
map('n', "<leader>ot", ":ObsidianTemplate<CR>", "Insert Obsidian template")


-- Move between windows
map('n', '<C-h>', '<C-w>h', 'Go to the left window')
map('n', '<C-j>', '<C-w>j', 'Go to the down window')
map('n', '<C-k>', '<C-w>k', 'Go to the up window')
map('n', '<C-l>', '<C-w>l', 'Go to the right window')

-- Navigate the terminal
map('t', '<Esc>', '<C-\\><C-n>')
map('t', '<C-h>', '<C-\\><C-n><C-w>h', 'Go to the left window')
map('t', '<C-j>', '<C-\\><C-n><C-w>j', 'Go to the down window')
map('t', '<C-k>', '<C-\\><C-n><C-w>k', 'Go to the up window')
map('t', '<C-l>', '<C-\\><C-n><C-w>l', 'Go to the right window')

-- Remap the enter key to insert lines in normal mode
map('n', '<CR>', '<Cmd>call append(line("."), repeat([""], v:count1))<CR>', 'Insert new line below')
map('n', '<S-CR>', '<Cmd>call append(line(".")-1, repeat([""], v:count1))<CR>', 'Insert new line above')

map({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)', 'Leap forward')
map({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)', 'Leap backward')

map('n', '<leader>?', ':lua require(\'which-key\').show({ global = false })<CR>', 'Buffer local keymaps (which-key)')

map("n", "<Down>", "gj", "Move down ignoring wrap")
map("n", "<Up>", "gk", "Move up ignoring wrap")


-- telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find recent files" })
vim.keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

