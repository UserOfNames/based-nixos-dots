vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'Scroll Down' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'Scroll Up' })
vim.keymap.set("n", "n", "nzzzv", { desc = 'Next Search Result' })
vim.keymap.set("n", "N", "Nzzzv", { desc = 'Previous Search Result' })

-- TODO: Investigate buffer maps
-- vim.keymap.set("n", "<leader><leader>[", "<cmd>bprev<CR>", { desc = 'Previous buffer' })
-- vim.keymap.set("n", "<leader><leader>]", "<cmd>bnext<CR>", { desc = 'Next buffer' })
-- vim.keymap.set("n", "<leader><leader>l", "<cmd>b#<CR>", { desc = 'Last buffer' })
-- vim.keymap.set("n", "<leader><leader>d", "<cmd>bdelete<CR>", { desc = 'delete buffer' })


vim.keymap.set("n", "<Leader>os", function() vim.o.spell = not(vim.o.spell) end, { noremap = true, silent = true })

vim.keymap.set("n", "<Leader>ow", function() vim.o.wrap = not(vim.o.wrap) end, { noremap = true, silent = true })

vim.keymap.set("i", "<C-b>", "<C-g>u<Esc>[s1z=`]a<C-g>u", { noremap = true, silent = true })

vim.keymap.set({"n", "i", "c"}, "<C-l>", "<Enter>", { noremap = true })

-- Splits are handled with alt
vim.keymap.set("n", "<M-v>", "<cmd>vsplit<Enter>")
vim.keymap.set("n", "<M-s>", "<cmd>split<Enter>")
vim.keymap.set("n", "<M-k>", "<C-w>k")
vim.keymap.set("n", "<M-j>", "<C-w>j")
vim.keymap.set("n", "<M-l>", "<C-w>l")
vim.keymap.set("n", "<M-h>", "<C-w>h")
vim.keymap.set("n", "<M-K>", "<C-w>+")
vim.keymap.set("n", "<M-J>", "<C-w>-")
vim.keymap.set("n", "<M-L>", "<C-w>>")
vim.keymap.set("n", "<M-H>", "<C-w><")
vim.keymap.set("n", "<M-x>", "<C-w>x")
