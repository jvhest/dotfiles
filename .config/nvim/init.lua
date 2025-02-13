-- -----------------------------------------
-- Bootstrap lazy.nvim
-- -----------------------------------------
-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not (vim.uv or vim.loop).fs_stat(lazypath) then
--   local lazyrepo = "https://github.com/folke/lazy.nvim.git"
--   local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
--   if vim.v.shell_error ~= 0 then
--     vim.api.nvim_echo({
--       { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
--       { out, "WarningMsg" },
--       { "\nPress any key to exit..." },
--     }, true, {})
--     vim.fn.getchar()
--     os.exit(1)
--   end
-- end
-- vim.opt.rtp:prepend(lazypath)

-- -----------------------------------------
-- Vim-settings
-- -----------------------------------------
vim.g.mapleader = " "                -- sets leader key
vim.g.netrw_banner = 0               -- gets rid of the annoying banner for netrw
vim.g.netrw_browse_split=4           -- open in prior window
vim.g.netrw_altv = 1                 -- change from left splitting to right splitting
vim.g.netrw_liststyle=3              -- tree style view in netrw
--vim.cmd("let g:netrw_list_hide=netrw_gitignore#Hide()")

vim.opt.title = true                     -- show title
vim.opt.syntax = "ON"
vim.opt.backup = false
vim.opt.compatible = false               -- turn off vi compatibility mode
vim.opt.number = true                    -- turn on line numbers
vim.opt.relativenumber = true            -- turn on relative line numbers
vim.opt.mouse = 'a'                      -- enable the mouse in all modes
vim.opt.ignorecase = true                -- enable case insensitive searching
vim.opt.smartcase = true                 -- all searches are case insensitive unless there's a capital letter
vim.opt.hlsearch = true                  -- disable all highlighted search results
vim.opt.incsearch = true                 -- enable incremental searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = true                      -- enable text wrapping
vim.opt.tabstop = 4                      -- tabs=4spaces
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.fileencoding = "utf-8"           -- encoding set to utf-8
vim.opt.pumheight = 10                   -- number of items in popup menu
vim.opt.showtabline = 2                  -- always show the tab line
vim.opt.laststatus = 2                   -- always show statusline
vim.opt.signcolumn = "yes"
vim.opt.expandtab = true                 -- expand tab
vim.opt.smartindent = true
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.showmode = true
vim.opt.scrolloff = 8                    -- scroll page when cursor is 8 lines from top/bottom
vim.opt.backspace = "indent,eol,start"   -- allow backspace on indent, end of line or insert mode start position
vim.opt.cursorline = true
vim.opt.cursorlineopt = "both"
vim.opt.sidescrolloff = 8                -- scroll page when cursor is 8 spaces from left/right
vim.opt.scrolloff = 999                  -- keep cursorline in middle of screen
vim.opt.guifont = "monospace:h17"
-- vim.opt.clipboard = unnamedplus
vim.opt.clipboard:append("unnamedplus")
vim.opt.completeopt= { "menuone", "noselect" }
vim.opt.splitbelow = true                -- split go below
vim.opt.splitright = true                -- vertical split to the right
vim.opt.termguicolors = true             -- terminal gui colors
vim.opt.list = true                      -- display certain whitespace in the editor
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.o.statusline = "  %l    %Y        %F    %m %=    buffer:%n       %p%%      "

-- -----------------------------------------
-- Commands
-- -----------------------------------------
vim.api.nvim_create_user_command('SudoWrite',
    "write !sudo -A tee % >/dev/null",
    {bang = true, desc = "Write file as sudo user"}
)

-- -----------------------------------------
-- Autocommands
-- -----------------------------------------
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local myACGrp = augroup("myAutocmdGrp", { clear = true })

-- trim trailing spaces on save
autocmd(
    "BufWritePre", {
    pattern = "*",
    command = [[%s/\s\+$//e]],
group = myACGrp,
})

-- highlight on yank
autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank { higroup='IncSearch', timeout=300 }
    end,
    group = MyACGrp,
})

vim.cmd [[
    set path+=**
    colorscheme catppuccin
    highlight Normal ctermbg=NONE guibg=NONE
    filetype plugin on
    set wildmenu
]]

-- -----------------------------------------
-- Keybindings
-- -----------------------------------------
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- edit nvim config"
map("n", "<leader>ce", "<cmd>e! ~/.config/nvim<CR>")
-- reload neovim config
map("n", "<leader>cr", "<cmd>source ~/.config/nvim/init.lua<CR>")

-- tab bindings
map("n", "<leader>t", "<cmd>tabnew<CR>")                -- Creates new tab
map("n", "<leader>tx", "<cmd>tabclose<CR>")             -- Closes current tab
map("n", "<leader>tp", "<cmd>tabprevious<CR>")          -- Moves to previous tab
map("n", "<leader>tn", "<cmd>tabnext<CR>")              -- Moves to next tab

-- easy splits
map("n", "<leader>v", "<C-w>v")                         -- Split window vertically
map("n", "<leader>s", "<C-w>s")                         -- Split window horizontally
map("n", "<leader>wx", "<C-w>c")                        -- Close current split window
map("n", "<leader>wo", "<C-W>o")                        -- Close other windows

-- easy split navigation
map("n", "<C-h>", "<C-w>h")                             -- Switches to left split
map("n", "<C-l>", "<C-w>l")                             -- Switches to right split
map("n", "<C-j>", "<C-w>j")                             -- Switches to bottom split
map("n", "<C-k>", "<C-w>k")                             -- Switches to top split

-- buffer navigation
map("n", "<Tab>", "<cmd>bnext<CR>")                     -- Next buffer
map("n", "<S-Tab>", "<cmd>bprevious<CR>")               -- Previous buffer
map("n", "<leader>b", "<cmd>enew<CR>")                  -- New file buffer
map("n", "<leader>bc", "<cmd>bdelete!<CR>")             -- Close current buffer
map("n", "<leader>ba", "<cmd>bufdo bd<CR>")             -- Close all buffers

-- adjust split sizes easier
map("n", "<C-Left>", "<cmd>vertical resize +3<CR>")     -- Resizes vertical split +
map("n", "<C-Right>", "<cmd>vertical resize -3<CR>")    -- Resizes vertical split -
map("n", "<C-Up>", "<cmd>resize +3<CR>")                -- Resize horizontal split +
map("n", "<C-Down>", "<cmd>resize -3<CR>")              -- Resize horizontal split -

map("n", "<leader>e", "<cmd>20Lex<CR>")                 -- Open netrw in 20% split in tree view

-- back to normal mode
map("i", "kj", "<Esc>")
map("i", "jk", "<Esc>")

-- move lines
map("n", "<A-j>", "<cmd>m .+1<CR>==")                   -- Move current line down
map("n", "<A-k>", "<cmd>m .-2<CR>==")                   -- Move current line up
map("v", "<A-j>", "<cmd>m '>+1<CR>gv=gv")               -- Move current line down
map("v", "<A-k>", "<cmd>m '>-2<CR>gv=gv")               -- Move current line up

-- better indenting
map("v", "<", "<gv")                                    -- Move line(s) to left
map("v", ">", ">gv")                                    -- Move line(s) to right

-- other keys
map("n", "<C-s>", "<cmd>w<CR><esc>")                    -- Save file
map("n", "<Esc>", "<cmd>nohlsearch<CR>")                -- Clear search highlights
map("n", "0", "^")                                      -- Jump to first non-blank char
map("n", "x", '"_x')                                    -- Delete char without yank
map("n", "Q", "@q")                                     -- Play Macro in q reg (qq -> Q)
map("v", "p", '"_dP')                                   -- Paste Replace without Copy

-- autopairs
map("i", "'", "''<left>")
map("i", "\"", "\"\"<left>")
map("i", "(", "()<left>")
map("i", "[", "[]<left>")
map("i", "{", "{}<left>")
map("i", "`", "``<left>")

-- -----------------------------------------
-- Setup lazy.nvim
-- -----------------------------------------
-- require("lazy").setup({
--   spec = {
     -- Plugins
--   },
--   Configure any other settings here. See the documentation for more details.
--   colorscheme that will be used when installing plugins.
--   install = { colorscheme = { "habamax" } },
--   automatically check for plugin updates
--   checker = { enabled = true },
-- })

