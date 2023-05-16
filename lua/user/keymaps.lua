local utils = require("user.utils")

local has_wk, wk = pcall(require, "which-key")

local M = {}

function M.get_opts()
    return { noremap = true, silent = true }
end

local function func(callable, args)
    return function()
        callable(args)
    end
end

local function cmd(command)
    return "<cmd>" .. command .. "<cr>"
end

local function keymap_prefix(mode, keys, prefix)
    return { mode = mode, keys = keys, prefix = prefix }
end

local function keymap(mode, keys, command, opts)
    return {
        mode = mode, keys = keys, cmd = command, opts = opts
    }
end

local user_keymaps = {
    keymap({ "n" }, "<leader>e", cmd("Neotree toggle"), { desc = "Explorer" }),
    keymap({ "n" }, "<leader>t", cmd("ToggleTerm"), { desc = "Terminal" }),
    keymap({ "n" }, "<leader>g", cmd("LazyGit"), { desc = "LazyGit" }),
    keymap({ "n" }, "<leader>n", cmd("Navbuddy"), { desc = "Navbuddy" }),
    keymap({ "n" }, "<C-p>", cmd("Telescope find_files theme=ivy"), { desc = "Find Files" }),

    -- indent text
    keymap({ "v" }, "<", "<gv", { desc = "Indent<" }),
    keymap({ "v" }, ">", ">gv", { desc = "Indent>" }),

    -- visual deletion: paste but donot yank on deletion
    keymap({ "v" }, "p", "\"_dP", { desc = "paste no yank deletion" }),

    -- Ctrl+S to save
    keymap({ "i", "n", "v" }, "<C-s>", cmd("write"), { desc = "Save File" }),

    -- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
    keymap({ "n", "x", "o" }, "n", "'Nn'[v:searchforward]", { desc = "Next Search Result", expr = true }),
    keymap({ "n", "x", "o" }, "N", "'nN'[v:searchforward]", { desc = "Prev Search Result", expr = true }),

    -- add undo breakpoints in insert mode
    keymap({ "i" }, ".", ".<C-g>u", { desc = "add undo break point" }),
    keymap({ "i" }, ".", ".<C-g>u", { desc = "add undo break point" }),
    keymap({ "i" }, ",", ",<C-g>u", { desc = "add undo break point" }),
    keymap({ "i" }, ";", ";<C-g>u", { desc = "add undo break point" }),
    keymap({ "i" }, "<cr>", "<cr><C-g>u", { desc = "add undo break point" }),
}

local lsp_keymaps = {
    -- goto lsp mappings
    keymap({ "n" }, "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" }),
    keymap({ "n" }, "gd", vim.lsp.buf.definition, { desc = "Goto Definition" }),
    keymap({ "n" }, "K", vim.lsp.buf.hover, { desc = "Hover" }),
    keymap({ "n" }, "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" }),
    keymap({ "n" }, "gr", vim.lsp.buf.references, { desc = "References" }),
    keymap({ "n" }, "gl", vim.diagnostic.open_float, { desc = "Show Diagnostics" }),

    -- lsp leader mappings
    keymap_prefix({ "n", "v" }, "<leader>l", "+lsp"),
    keymap({ "n" }, "<leader>li", cmd("LspInfo"), { desc = "LspInfo" }),
    keymap({ "n" }, "<leader>lf", func(vim.lsp.buf.format, { async = true }), { desc = "Format" }),
    keymap({ "n" }, "<leader>lj", func(vim.diagnostic.goto_next, { buffer = 0 }), { desc = "Diagnostics Next" }),
    keymap({ "n" }, "<leader>lk", func(vim.diagnostic.goto_prev, { buffer = 0 }), { desc = "Diagnostics Previous" }),
    keymap({ "n" }, "<leader>la", vim.lsp.buf.code_action, { desc = "Code Actions" }),
    keymap({ "n" }, "<leader>lr", vim.lsp.buf.rename, { desc = "Rename Symbol" }),
    keymap({ "n" }, "<leader>ls", vim.lsp.buf.signature_help, { desc = "Show Signature" }),
    keymap({ "n" }, "<leader>lq", vim.diagnostic.setloclist, { desc = "LocList" }),
    keymap({ "v" }, "<leader>lf", vim.lsp.buf.format, { desc = "Range Format" }),

    -- show signature
    keymap({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, { desc = "Show Signature" }),
}

function M.user_keymaps()
    return user_keymaps
end

function M.lsp_keymaps()
    return lsp_keymaps
end

function M.set_keymap(mode, key, command, opts)
    vim.keymap.set(mode, key, command, opts)
end

function M.register_keymaps(keymaps, opts)
    for _, mapping in pairs(keymaps) do
        if mapping.prefix then
            _ = has_wk and wk.register({ [mapping.keys] = { name = mapping.prefix } }, { mode = mapping.mode })
        end
        if mapping.cmd then
            local keyopts = utils.mergecopy(opts, mapping.opts)
            M.set_keymap(mapping.mode, mapping.keys, mapping.cmd, keyopts)
        end
    end
end

function M.setup()
    local opts = M.get_opts()

    vim.g.mapleader = " "
    vim.g.maplocalleader = " "

    M.register_keymaps(M.user_keymaps(), opts)
end

return M
