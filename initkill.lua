-- Nixvim's internal module table
-- Can be used to share code throughout init.lua
local _M = {}

-- Set up globals {{{
do
    local nixvim_globals = {
        rustaceanvim = { tools = { hover_actions = { replace_builtin_hover = true } } },
        vimtex_callback_progpath = "nvim",
        vimtex_conceallevel = 1,
        vimtex_enabled = true,
        vimtex_tex_conceal = "abdmg",
        vimtex_tex_flavor = "latex",
        vimtex_view_method = "general",
    }

    for k, v in pairs(nixvim_globals) do
        vim.g[k] = v
    end
end
-- }}}


require("lz.n").load({
    {
        "which-key.nvim",
        after = function()
            require("which-key").setup({
                delay = function(ctx)
                    return ctx.plugin and 0 or 1500
                end,
            })
        end,
        event = "DeferredUIEnter",
    },
    {
        "trouble.nvim",
        after = function()
            require("trouble").setup({})
        end,
        cmd = "Trouble",
    },
    {
        "nvim-autopairs",
        after = function()
            require("nvim-autopairs").setup({ map_cr = true })
        end,
        event = "InsertEnter",
    },
    {
        "neogit",
        after = function()
            require("neogit").setup({
                kind = "vsplit",
                sections = {
                    rebase = { folded = true, hidden = false },
                    recent = { folded = true, hidden = false },
                    sequencer = { folded = false, hidden = false },
                    staged = { folded = false, hidden = false },
                    stashes = { folded = true, hidden = false },
                    unmerged_pushRemote = { folded = false, hidden = false },
                    unmerged_upstream = { folded = false, hidden = false },
                    unpulled_pushRemote = { folded = true, hidden = false },
                    unpulled_upstream = { folded = true, hidden = false },
                    unstaged = { folded = false, hidden = false },
                    untracked = { folded = false, hidden = false },
                },
            })
        end,
        cmd = "Neogit",
    },
    {
        "mini.nvim",
        after = function()
            require("mini.move").setup({
                mappings = {
                    down = "J",
                    left = "H",
                    line_down = "",
                    line_left = "",
                    line_right = "",
                    line_up = "",
                    right = "L",
                    up = "K",
                },
            })

            require("mini.surround").setup({})
        end,
        event = "DeferredUIEnter",
    },
    {
        "luasnip",
        after = function()
            require("luasnip").config.setup({})

            require("luasnip.loaders.from_vscode").lazy_load({})
        end,
        event = "DeferredUIEnter",
    },
    {
        "lualine.nvim",
        after = function()
            require("lualine").setup({ options = { icons_enabled = true } })
        end,
        event = "DeferredUIEnter",
    },
    {
        "gitsigns.nvim",
        after = function()
            require("gitsigns").setup({})
        end,
        event = "DeferredUIEnter",
    },
})
require("nvim-web-devicons").setup({ color_icons = true })

-- nvim-lspconfig {{{
do
    local __lspServers = {
        { extraOptions = { settings = { nixd = { nixpkgs = { expr = "import <nixpkgs> { }" } } } }, name = "nixd" },
        { name = "lua_ls" },
        { name = "jdtls" },
        { name = "hls" },
        { name = "clangd" },
        { name = "basedpyright" },
    }

    local __lspCapabilities = function()
        capabilities = vim.lsp.protocol.make_client_capabilities()

        -- Capabilities configuration for blink-cmp
        capabilities = require("blink-cmp").get_lsp_capabilities(capabilities)

        return capabilities
    end

    local __setup = { capabilities = __lspCapabilities() }

    for i, server in ipairs(__lspServers) do
        local options = server.extraOptions

        if options == nil then
            options = __setup
        else
            options = vim.tbl_extend("keep", options, __setup)
        end

        require("lspconfig")[server.name].setup(options)
    end
end
-- }}}

vim.opt.runtimepath:prepend(vim.fs.joinpath(vim.fn.stdpath("data"), "site"))
require("nvim-treesitter.configs").setup({
    auto_install = false,
    highlight = { additional_vim_regex_highlighting = false, disable = { "latex" }, enable = true },
    ignore_install = { "latex" },
    indent = { enable = true },
    parser_install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "site"),
})

require("oil").setup({
    default_file_explorer = true,
    keymaps = { ["<C-->"] = "actions.refresh", ["<C-l>"] = "actions.select", ["<C-x>"] = "actions.select_split" },
    view_options = { show_hidden = true },
})

require("harpoon"):setup({})

require("blink-cmp").setup({
    completion = { documentation = { auto_show = true } },
    keymap = {
        ["<C-e>"] = { "cancel" },
        ["<C-j>"] = { "select_next" },
        ["<C-k>"] = { "select_prev" },
        ["<C-l>"] = { "accept" },
        preset = "none",
    },
    snippets = { preset = "luasnip" },
    sources = { default = { "lsp", "buffer", "snippets", "path" } },
})

require("diffview").setup({ use_icons = true })

-- Set up keybinds {{{
do
    local __nixvim_binds = {
        {
            action = "<cmd>DiffviewOpen<Enter>",
            key = "<Leader>gdd",
            mode = { "n" },
            options = { desc = "Open diffview", noremap = true, silent = true },
        },
        {
            action = "<cmd>Gitsigns<Enter>",
            key = "<Leader>ghh",
            mode = { "n" },
            options = { desc = "Open gitsigns menu", noremap = true, silent = true },
        },
        {
            action = function()
                require("gitsigns").nav_hunk("next")
            end,
            key = "]h",
            mode = { "n" },
            options = { desc = "Next hunk", noremap = true, silent = true },
        },
        {
            action = function()
                require("gitsigns").nav_hunk("prev")
            end,
            key = "[h",
            mode = { "n" },
            options = { desc = "Previous hunk", noremap = true, silent = true },
        },
        {
            action = function()
                require("gitsigns").stage_hunk()
            end,
            key = "<Leader>ghs",
            mode = { "n" },
            options = { desc = "Stage hunk", noremap = true, silent = true },
        },
        {
            action = function()
                require("gitsigns").undo_stage_hunk()
            end,
            key = "<Leader>ghu",
            mode = { "n" },
            options = { desc = "Undo stage hunk", noremap = true, silent = true },
        },
        {
            action = function()
                require("gitsigns").reset_hunk()
            end,
            key = "<Leader>ghr",
            mode = { "n" },
            options = { desc = "Reset hunk", noremap = true, silent = true },
        },
        {
            action = function()
                require("gitsigns").preview_hunk()
            end,
            key = "<Leader>ghp",
            mode = { "n" },
            options = { desc = "Preview hunk", noremap = true, silent = true },
        },
        {
            action = function()
                require("harpoon"):list():add()
            end,
            key = "<Leader>ha",
            mode = { "n" },
            options = { desc = "Add file to harpoon", noremap = true, silent = true },
        },
        {
            action = function()
                require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
            end,
            key = "<Leader>hh",
            mode = { "n" },
            options = { desc = "Open harpoon menu", noremap = true, silent = true },
        },
        {
            action = function()
                require("harpoon"):list():select(1)
            end,
            key = "<Leader>1",
            mode = { "n" },
            options = { desc = "Navigate to harpoon file 1", noremap = true, silent = true },
        },
        {
            action = function()
                require("harpoon"):list():select(2)
            end,
            key = "<Leader>2",
            mode = { "n" },
            options = { desc = "Navigate to harpoon file 2", noremap = true, silent = true },
        },
        {
            action = function()
                require("harpoon"):list():select(3)
            end,
            key = "<Leader>3",
            mode = { "n" },
            options = { desc = "Navigate to harpoon file 3", noremap = true, silent = true },
        },
        {
            action = function()
                require("harpoon"):list():select(4)
            end,
            key = "<Leader>4",
            mode = { "n" },
            options = { desc = "Navigate to harpoon file 4", noremap = true, silent = true },
        },
        {
            action = function()
                require("harpoon"):list():select(5)
            end,
            key = "<Leader>5",
            mode = { "n" },
            options = { desc = "Navigate to harpoon file 5", noremap = true, silent = true },
        },
        {
            action = function()
                require("harpoon"):list():select(6)
            end,
            key = "<Leader>6",
            mode = { "n" },
            options = { desc = "Navigate to harpoon file 6", noremap = true, silent = true },
        },
        {
            action = function()
                require("harpoon"):list():select(7)
            end,
            key = "<Leader>7",
            mode = { "n" },
            options = { desc = "Navigate to harpoon file 7", noremap = true, silent = true },
        },
        {
            action = function()
                require("harpoon"):list():select(8)
            end,
            key = "<Leader>8",
            mode = { "n" },
            options = { desc = "Navigate to harpoon file 8", noremap = true, silent = true },
        },
        {
            action = function()
                require("harpoon"):list():select(9)
            end,
            key = "<Leader>9",
            mode = { "n" },
            options = { desc = "Navigate to harpoon file 9", noremap = true, silent = true },
        },
        {
            action = function()
                if require("luasnip").jumpable(1) then
                    require("luasnip").jump(1)
                elseif require("luasnip").choice_active() then
                    require("luasnip").change_choice(1)
                end
            end,
            key = "<C-n>",
            mode = { "i", "s" },
            options = { desc = "Jump to next point in snippet", noremap = true, silent = true },
        },
        {
            action = function()
                if require("luasnip").jumpable(-1) then
                    require("luasnip").jump(-1)
                elseif require("luasnip").choice_active() then
                    require("luasnip").change_choice(-1)
                end
            end,
            key = "<C-p>",
            mode = { "i", "s" },
            options = { desc = "Jump to previous point in snippet", noremap = true, silent = true },
        },
        {
            action = "<cmd>Neogit<Enter>",
            key = "<Leader>gs",
            mode = { "n" },
            options = { desc = "Open neogit", noremap = true, silent = true },
        },
        {
            action = "<cmd>Neogit log<Enter>",
            key = "<Leader>gl",
            mode = { "n" },
            options = { desc = "Open neogit", noremap = true, silent = true },
        },
        {
            action = "<cmd>Neogit branch<Enter>",
            key = "<Leader>gb",
            mode = { "n" },
            options = { desc = "Open neogit", noremap = true, silent = true },
        },
        {
            action = "<cmd>Oil<Enter>",
            key = "<Leader>fe",
            mode = { "n" },
            options = { desc = "Open oil in current buffer", noremap = true, silent = true },
        },
        {
            action = function()
                vim.cmd.Trouble("diagnostics toggle")
            end,
            key = "<Leader>tt",
            mode = { "n" },
            options = { desc = "Toggle trouble diagnostics window", noremap = true, silent = true },
        },
        {
            action = "<cmd>UndotreeToggle<Enter>",
            key = "<Leader>u",
            mode = { "n" },
            options = { desc = "Toggle undotree", noremap = true, silent = true },
        },
    }
    for i, map in ipairs(__nixvim_binds) do
        vim.keymap.set(map.mode, map.key, map.action, map.options)
    end
end
-- }}}

-- Set up autogroups {{
do
    local __nixvim_autogroups = { nixvim_binds_LspAttach = { clear = true }, nixvim_lsp_on_attach = { clear = false } }

    for group_name, options in pairs(__nixvim_autogroups) do
        vim.api.nvim_create_augroup(group_name, options)
    end
end
-- }}
-- Set up autocommands {{
do
    local __nixvim_autocommands = {
        {
            callback = function(event)
                do
                    -- client and bufnr are supplied to the builtin `on_attach` callback,
                    -- so make them available in scope for our global `onAttach` impl
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    local bufnr = event.buf
                end
            end,
            desc = "Run LSP onAttach",
            event = "LspAttach",
            group = "nixvim_lsp_on_attach",
        },
        {
            callback = function(args)
                do
                    local __nixvim_binds = {
                        {
                            action = "<cmd>Telescope lsp_implementations<Enter>",
                            key = "gi",
                            mode = "n",
                            options = { noremap = true, silent = true },
                        },
                        {
                            action = "<cmd>Telescope lsp_references<Enter>",
                            key = "grr",
                            mode = "n",
                            options = { noremap = true, silent = true },
                        },
                    }

                    for i, map in ipairs(__nixvim_binds) do
                        local options = vim.tbl_extend("keep", map.options or {}, { buffer = args.buf })
                        vim.keymap.set(map.mode, map.key, map.action, options)
                    end
                end
            end,
            desc = "Load keymaps for LspAttach",
            event = "LspAttach",
            group = "nixvim_binds_LspAttach",
        },
        {
            callback = function()
                vim.opt_local.softtabstop = 3
                vim.opt_local.tabstop = 3
                vim.opt_local.shiftwidth = 3
            end,
            event = { "FileType" },
            pattern = { "lua" },
        },
        {
            callback = function()
                vim.opt_local.softtabstop = 2
                vim.opt_local.tabstop = 2
                vim.opt_local.shiftwidth = 2
            end,
            event = { "FileType" },
            pattern = { "nix" },
        },
    }

    for _, autocmd in ipairs(__nixvim_autocommands) do
        vim.api.nvim_create_autocmd(autocmd.event, {
            group = autocmd.group,
            pattern = autocmd.pattern,
            buffer = autocmd.buffer,
            desc = autocmd.desc,
            callback = autocmd.callback,
            command = autocmd.command,
            once = autocmd.once,
            nested = autocmd.nested,
        })
    end
end
-- }}
