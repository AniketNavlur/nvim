local utils = require("user.utils")
local core = require("user.core")

local has_wk, wk = pcall(require, "which-key")

local keys = core.keys
local cmd = core.cmd

local M = {}

function M.default_opts()
    return { noremap = true, silent = true }
end

local vim_cmd = utils.make_nvim_cmd

core.cmd.invoke("editor.action.toggle_block_comment")
core.cmd.invoke("editor.action.toggle_line_comment")
core.cmd.invoke("workbench.view.search")
core.cmd.invoke("workbench.view.debug")
core.cmd.invoke("workbench.view.bookmarks")
core.cmd.invoke("workbench.view.quickfix")
core.cmd.invoke("workbench.view.loclist")
core.cmd.invoke("workbench.action.close_all_editors")
core.cmd.invoke("workbench.action.close_other_editors")
core.cmd.invoke("workbench.files.select_for_compare")
core.cmd.invoke("workbench.files.compare_selected")

local KEYMAPS = {
    ["user-keymaps"] = {

        cmd.bind("n", "<leader>P", "workbench.view.plugin-manager"):add_desc("plugin manager"),
        cmd.bind("n", "<leader>e", "workbench.view.explorer"):add_desc("explorer"),
        cmd.bind("n", "<leader>t", "workbench.view.terminal"):add_desc("terminal"),
        cmd.bind("n", "<leader>n", "workbench.view.outline"):add_desc("outline"),
        cmd.bind("n", "<C-p>", "workbench.action.quick_open"):add_desc("quick open file"),
        cmd.bind("n", "<leader>q", "workbench.action.close_active_editor"):add_desc("close buffer"),

        -- search
        keys.bind("n", "<leader>s"):add_prefix("+search"),
        cmd.bind("n", "<leader>sb", "editor.search"):add_desc("search buffer"),
        cmd.bind("n", "<leader>sp", "workbench.view.search"):add_desc("live search project"),
        cmd.bind("n", "<leader>/", "workbench.view.search"):add_desc("live search project"),

        -- indent text
        keys.bind("v", "<", "<gv"):add_desc("indent <"),
        keys.bind("v", ">", ">gv"):add_desc("indent >"),

        -- visual paste: paste but donot yank deletion
        keys.bind("v", "p", "\"_dP"):add_desc("paste but donot yank deletion"),

        -- Ctrl+S to save
        keys.bind("i|n|v", "<C-s>", vim_cmd("write")):add_desc("save file"),

        -- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
        keys.bind("n|x|o", "n", "'Nn'[v:searchforward]"):add_opts({ expr = true }):add_desc("Next Search Result"),
        keys.bind("n|x|o", "N", "'nN'[v:searchforward]"):add_opts({ expr = true }):add_desc("Prev Search Result"),

        -- add undo breakpoints in insert mode
        keys.bind("i", ".", ".<C-g>u"):add_desc("add undo break point"),
        keys.bind("i", ".", ".<C-g>u"):add_desc("add undo break point"),
        keys.bind("i", ",", ",<C-g>u"):add_desc("add undo break point"),
        keys.bind("i", ";", ";<C-g>u"):add_desc("add undo break point"),
        keys.bind("i", "<cr>", "<cr><C-g>u"):add_desc("add undo break point"),
    },

    ["lsp-keymaps"] = {

        -- goto lsp mappings
        cmd.bind("n", "gD", "editor.action.goto_declaration"):add_desc("goto declaration"),
        cmd.bind("n", "gd", "editor.action.goto_definition"):add_desc("goto definition"),
        cmd.bind("n", "gy", "editor.action.goto_type_definition"):add_desc("goto type definition"),
        cmd.bind("n", "K", "editor.action.show_hover"):add_desc("show hover"),
        cmd.bind("n", "gI", "editor.action.goto_implementation"):add_desc("goto implementation"),
        cmd.bind("n", "gr", "editor.action.goto_references"):add_desc("goto references"),
        cmd.bind("n", "gl", "editor.action.show_diagnostic"):add_desc("show diagnostic"),

        -- lsp leader mappings
        keys.bind("n|v", "<leader>l"):add_prefix("+lsp"),
        keys.bind("n", "<leader>li", vim_cmd("LspInfo")):add_desc("lsp info"),
        cmd.bind("n", "<leader>lf", "editor.action.format_document"):add_desc("format document"),
        cmd.bind("n", "<leader>lj", "editor.action.goto_next_diagnostic"):add_desc("next diagnostic"),
        cmd.bind("n", "<leader>lk", "editor.action.goto_prev_diagnostic"):add_desc("prev diagnostic"),
        cmd.bind("n", "<leader>la", "editor.action.code_actions"):add_desc("code actions"),
        cmd.bind("n", "<leader>lA", "editor.action.source_actions"):add_desc("source actions"),
        cmd.bind("n", "<leader>lr", "editor.action.rename_symbol"):add_desc("rename symbol"),
        cmd.bind("n", "<F2>", "editor.action.rename_symbol"):add_desc("rename symbol"),
        keys.bind("n", "<leader>ls", vim.lsp.buf.signature_help):add_desc("show signature"),
        cmd.bind("n", "<leader>lp", "workbench.view.problems"):add_desc("problems"),
        cmd.bind("v", "<leader>lf", "editor.action.format_selection"):add_desc("format selection"),

        -- show signature
        keys.bind("n|i", "<C-k>", vim.lsp.buf.signature_help):add_desc("show signature"),
    },

    ["git-keymaps"] = {

        keys.bind("n|v", "<leader>g"):add_prefix("+git"),
        cmd.bind("n", "<leader>G", "workbench.view.git"):add_desc("git"),
        cmd.bind("v", "<leader>g+", "git.stage_selected"):add_desc("git stage range"),
        cmd.bind("v", "<leader>g-", "git.unstage_selected"):add_desc("git unstage range"),
        cmd.bind("v", "<leader>gr", "git.reset_selected"):add_desc("git reset range"),
        cmd.bind("n", "<leader>ga", "git.stage_file"):add_desc("git stage file"),
        cmd.bind("n", "<leader>gu", "git.unstage_file"):add_desc("git unstage file"),
        cmd.bind("n", "<leader>gr", "git.reset_file"):add_desc("git reset file"),
        cmd.bind("n", "<leader>gs", "git.status"):add_desc("git status"),
        cmd.bind("n", "<leader>gc", "git.commit_staged"):add_desc("git commit"),
        cmd.bind("n", "<leader>gS", "git.stash"):add_desc("git stash"),
        cmd.bind("n", "<leader>gR", "git.reset"):add_desc("git reset"),
        cmd.bind("n", "<leader>gi", "git.rebase_interactive"):add_desc("git rebase --interactive"),
        cmd.bind("n", "<leader>gM", "git.mergetool"):add_desc("git mergetool"),
        cmd.bind("n", "<leader>gf", "git.fetch"):add_desc("git fetch"),
        cmd.bind("n", "<leader>gp", "git.pull"):add_desc("git pull"),
        cmd.bind("n", "<leader>gP", "git.push"):add_desc("git push"),
        cmd.bind("n", "<leader>gg", "git.git-graph"):add_desc("git-graph"),
    },

    ["dap-keymaps"] = {

        keys.bind("n", "<leader>d"):add_prefix("+dap"),
        cmd.bind("n", "<leader>db", "editor.debug.action.toggle_breakpoint"):add_desc("toggle breakpoint"),
        cmd.bind("n", "<leader>ds", "workbench.debug.action.start"):add_desc("start debug"),
        cmd.bind("n", "<leader>dc", "workbench.debug.action.continue"):add_desc("continue debug"),
        cmd.bind("n", "<leader>dp", "workbench.debug.action.pause"):add_desc("pause"),
        cmd.bind("n", "<leader>di", "workbench.debug.action.step_into"):add_desc("step into"),
        cmd.bind("n", "<leader>do", "workbench.debug.action.step_out"):add_desc("step out"),
        cmd.bind("n", "<leader>dO", "workbench.debug.action.step_over"):add_desc("step over"),
        cmd.bind("n", "<leader>dt", "workbench.debug.action.terminate"):add_desc("terminate"),
    },
}

function M.get_keymaps(name)
    return KEYMAPS[name]
end

function M.set_keymap(mode, key, command, opts)
    vim.keymap.set(mode, key, command, opts)
end

function M.register_keymaps(keymaps, opts)
    for _, mapping in pairs(keymaps) do
        if mapping.prefix then
            for _, m in pairs(mapping.mode) do
                _ = has_wk and wk.register({ [mapping.keys] = { name = mapping.prefix } }, { mode = m })
            end
        end
        mapping.register(opts)
    end
end

function M.setup()
    local opts = M.default_opts()

    vim.g.mapleader = " "
    vim.g.maplocalleader = " "

    M.register_keymaps(M.get_keymaps("user-keymaps"), opts)
    M.register_keymaps(M.get_keymaps("git-keymaps"), opts)
    M.register_keymaps(M.get_keymaps("dap-keymaps"), opts)
end

return M
