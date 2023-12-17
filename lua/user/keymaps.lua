local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --


-- Clear search with <esc>
keymap( "i", "<esc>", "<cmd>noh<cr><esc>",opts)
keymap( "n", "<esc>", "<cmd>noh<cr><esc>",opts)


-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi<ESC>", opts)
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi<ESC>", opts)
keymap("n", "<A-j>", "<cmd>m .+1<cr>==", opts)
keymap("n", "<A-k>", "<cmd>m .-2<cr>==", opts)
keymap("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", opts)
keymap("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", opts)
keymap("v", "<A-j>", ":m '>+1<cr>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<cr>gv=gv", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)
keymap("i", "<M-l>", "<C-o>l", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("n", "<leader>d", ":ToggleTermSendCurrentLine<cr><ESC>j", opts)
-- keymap("n", "<leader>ts", "<ESC>j", opts)
keymap("n", "<leader>v", "vap:ToggleTermSendVisualLines<cr>", opts)
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- windows
keymap("n", "<leader>oo", "<C-W>w", opts) --other window
keymap("n", "<leader>oc", "<C-W>c", opts) --Delete
-- keymap("n", "<leader>w-", "<C-W>s", opts) -- split below
-- keymap("n", "<leader>w|", "<C-W>v", opts) -- split right
-- keymap("n", "<leader>-", "<C-W>s", opts) --split below
-- keymap("n", "<leader>|", "<C-W>v", opts) -- split right

-- tabs
-- keymap("n", "<leader><tab>l", "<cmd>tablast<cr>", opts) -- last tab
-- keymap("n", "<leader><tab>f", "<cmd>tabfirst<cr>", opts) -- first tab
-- keymap("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", opts) -- new tab
-- keymap("n", "<leader><tab>]", "<cmd>tabnext<cr>", opts) -- next tab
-- keymap("n", "<leader><tab>d", "<cmd>tabclose<cr>", opts) -- close tab
-- keymap("n", "<leader><tab>[", "<cmd>tabprevious<cr>", opts) -- Previous tab

vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>rw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('v', '<leader>rw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>rp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})
