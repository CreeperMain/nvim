vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzv")
vim.keymap.set("n", "N", "Nzzv")

-- nvim tree commands
vim.keymap.set("n", "<leader>n", vim.cmd.NvimTreeToggle) -- n for navigate
-- the "n" bit means while in nomral mode, second bit is if you press leaderpv it will execute the command in the third bit
vim.keymap.set("i", "jj", "<Esc>")
--vim.keymap.set("n", "jj", ":q!")

-- greatest remap ever
-- pasting related
vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- exiting veritcal thingy
vim.keymap.set("i", "<C-c>", "<Esc>")
-- idk what it does ^^^
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) --look into this very cool and i mean an idividual version
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) --makes a file executable, look at chmod

-- dap
vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>")
vim.keymap.set("n", "<leader>dr", "<cmd> DapContinue <CR>")

-- neorg
--[[["core.keybinds"] = {
    config = {
        hook = function(keybinds)
            -- Unmaps any Neorg key from the `norg` mode
            keybinds.unmap("norg", "n", "gtd")
            keybinds.unmap("norg", "n", keybinds.leader .. "nn")

            -- Binds the `gtd` key in `norg` mode to execute `:echo 'Hello'`
            keybinds.map("norg", "n", "gtd", "<cmd>echo 'Hello!'<CR>")

            -- Remap unbinds the current key then rebinds it to have a different action
            -- associated with it.
            -- The following is the equivalent of the `unmap` and `map` calls you saw above:
            keybinds.remap("norg", "n", "gtd", "<cmd>echo 'Hello!'<CR>")

            -- Sometimes you may simply want to rebind the Neorg action something is bound to
            -- versus remapping the entire keybind. This remap is essentially the same as if you
            -- did `keybinds.remap("norg", "n", "<C-Space>, "<cmd>Neorg keybind norg core.qol.todo_items.todo.task_done<CR>")
            keybinds.remap_event("norg", "n", "<C-Space>", "core.qol.todo_items.todo.task_done")

            -- Want to move one keybind into the other? `remap_key` moves the data of the
            -- first keybind to the second keybind, then unbinds the first keybind.
            keybinds.remap_key("norg", "n", "<C-Space>", "<Leader>t")
        end,
    }
}
]]
--
