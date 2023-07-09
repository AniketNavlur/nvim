return {
    'kdheepak/lazygit.nvim',
    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        local core = require("user.core")
        core.cmd.register_cmd("workbench.view.git", "LazyGit")
    end
}
