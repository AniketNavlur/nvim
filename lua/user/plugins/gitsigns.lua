return {
    'lewis6991/gitsigns.nvim',

    config = function()
        require('gitsigns').setup()

        local gitsigns = require("gitsigns")

        local core = require("user.core")

        core.cmd.register_cmd("git.stage_selected",
            function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        core.cmd.register_cmd("git.reset_selected",
            function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)

        core.cmd.register_cmd("git.stage_hunk", gitsigns.stage_hunk)
        core.cmd.register_cmd("git.reset_hunk", gitsigns.reset_hunk)
        core.cmd.register_cmd("git.preview_hunk", gitsigns.preview_hunk)
        core.cmd.register_cmd("git.stage_file", gitsigns.stage_buffer)
        core.cmd.register_cmd("git.reset_file", gitsigns.reset_buffer)
        -- core.cmd.register_cmd("git.diff", gitsigns.diffthis)
        core.cmd.register_cmd("git.diff", function() gitsigns.diffthis('~') end)
    end
}
