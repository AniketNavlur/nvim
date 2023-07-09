return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
        require("telescope").setup {
            defaults = {
                path_display = function(_, path)
                    local tail = require("telescope.utils").path_tail(path)
                    return string.format("%s (%s)", tail, path)
                end,
            },
        }

        local core = require("user.core")
        core.cmd.register_cmd("workbench.action.quick_open", "Telescope find_files theme=ivy")
        core.cmd.register_cmd("editor.action.goto_definition", "Telescope lsp_definitions theme=cursor")
        core.cmd.register_cmd("editor.action.goto_type_definition", "Telescope lsp_type_definitions theme=cursor")
        core.cmd.register_cmd("editor.action.goto_implementation", "Telescope lsp_implementations theme=cursor")
        core.cmd.register_cmd("editor.action.goto_references", "Telescope lsp_references theme=cursor")
        core.cmd.register_cmd("workbench.view.bookmarks", "Telescope marks theme=ivy")
        core.cmd.register_cmd("workbench.view.search", "Telescope live_grep theme=dropdown")
        core.cmd.register_cmd("editor.search", "Telescope current_buffer_fuzzy_find theme=dropdown")
    end
}
