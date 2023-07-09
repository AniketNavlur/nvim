local utils = require("user.utils")

local M = {}

M.commands = {}

M.dispatcher = {}

function M.setup(core_lib)
    M.core_lib = core_lib

    M.register_cmd("editor.action.goto_declaration", vim.lsp.buf.declaration)
    M.register_cmd("editor.action.goto_definition", vim.lsp.buf.definition)
    M.register_cmd("editor.action.goto_type_definition", vim.lsp.buf.type_definition)
    M.register_cmd("editor.action.goto_incoming_calls", vim.lsp.buf.incoming_calls)
    M.register_cmd("editor.action.goto_outgoing_calls", vim.lsp.buf.outgoing_calls)
    M.register_cmd("editor.action.goto_references", vim.lsp.buf.references)
    M.register_cmd("editor.action.goto_implementation", vim.lsp.buf.implementation)
    M.register_cmd("editor.action.show_hover", vim.lsp.buf.hover)
    M.register_cmd("editor.action.format_document", utils.make_func(vim.lsp.buf.format, { async = true }))
    M.register_cmd("editor.action.format_selection", vim.lsp.buf.format)
    M.register_cmd("editor.action.code_actions", vim.lsp.buf.code_action)
    M.register_cmd("editor.action.rename_symbol", vim.lsp.buf.rename)
    M.register_cmd("editor.action.toggle_block_comment")
    M.register_cmd("editor.action.toggle_line_comment")
    M.register_cmd("editor.search")

    M.register_cmd("editor.action.source_actions",
        function()
            vim.lsp.buf.code_action({
                context = {
                    only = {
                        "source",
                    },
                    diagnostics = {},
                },
            })
        end
    )

    M.register_cmd("editor.action.show_diagnostic", vim.diagnostic.open_float)
    M.register_cmd("editor.action.goto_next_diagnostic", vim.diagnostic.goto_next)
    M.register_cmd("editor.action.goto_prev_diagnostic", vim.diagnostic.goto_prev)

    M.register_cmd("editor.debug.action.toggle_breakpoint")

    M.register_cmd("workbench.view.explorer", "Explore")
    M.register_cmd("workbench.view.plugin-manager")
    M.register_cmd("workbench.view.git")
    M.register_cmd("workbench.view.search")
    M.register_cmd("workbench.view.debug")
    M.register_cmd("workbench.view.outline")
    M.register_cmd("workbench.view.terminal")
    M.register_cmd("workbench.view.problems", vim.diagnostic.setloclist)
    M.register_cmd("workbench.view.bookmarks", "marks")
    M.register_cmd("workbench.view.quickfix", "copen")
    M.register_cmd("workbench.view.loclist", "lopen")

    M.register_cmd("workbench.action.close_active_editor", "bd")
    M.register_cmd("workbench.action.close_all_editors", "%bd")
    M.register_cmd("workbench.action.close_other_editors", "%bd|e#|bd#")
    M.register_cmd("workbench.action.quick_open")

    M.register_cmd("workbench.files.select_for_compare")
    M.register_cmd("workbench.files.compare_selected")

    M.register_cmd("workbench.debug.action.start")
    M.register_cmd("workbench.debug.action.continue")
    M.register_cmd("workbench.debug.action.pause")
    M.register_cmd("workbench.debug.action.step_into")
    M.register_cmd("workbench.debug.action.step_out")
    M.register_cmd("workbench.debug.action.step_over")
    M.register_cmd("workbench.debug.action.terminate")

    M.register_cmd("git.status", "!git status")
    M.register_cmd("git.stage_selected")
    M.register_cmd("git.unstage_selected")
    M.register_cmd("git.reset_selected")
    M.register_cmd("git.stage_file")
    M.register_cmd("git.unstage_file")
    M.register_cmd("git.reset_file")
    M.register_cmd("git.commit_staged")
    M.register_cmd("git.stash")
    M.register_cmd("git.reset")
    M.register_cmd("git.rebase_interactive")
    M.register_cmd("git.mergetool")
    M.register_cmd("git.fetch")
    M.register_cmd("git.pull")
    M.register_cmd("git.push")
    M.register_cmd("git.git-graph", "!git log --graph --oneline --all")
end

function M.register_cmd(api_name, func)
    if func ~= nil then
        M.commands[api_name] = func
    end
end

function M.bind(mode, keys, api_name, opts)
    local keymap = M.core_lib.keys.bind(mode, keys, M.core_lib.cmd.invoke(api_name), opts):add_desc(api_name)
    return keymap
end

function M.dispatch(api_name)
    local cmd = M.commands[api_name]
    if cmd == nil then
        vim.notify("Not Implemented: " .. api_name, vim.log.levels.WARN)
    elseif type(cmd) == 'function' then
        cmd()
    elseif type(cmd) == 'string' then
        vim.cmd(cmd)
    else
        vim.notify("Not supported: cmd type `" .. type(cmd) "` for" .. api_name, vim.log.levels.WARN)
    end
end

function M.invoke(api_name)
    if M.dispatcher[api_name] == nil then
        M.dispatcher[api_name] = utils.make_func(M.dispatch, api_name)
    end

    return M.dispatcher[api_name]
end

M.setup()

return M
