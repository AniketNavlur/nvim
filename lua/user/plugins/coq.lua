return {
    'ms-jpq/coq_nvim',
    branch = 'coq',
    dependencies = {
        { 'ms-jpq/coq.artifacts',  branch = 'artifacts' },
        { 'ms-jpq/coq.thirdparty', branch = '3p' },
        { 'neovim/nvim-lspconfig' },
    },

    -- setup runs before plugin is loaded
    init = function()
        vim.g.coq_settings = {
            ["auto_start"] = "shut-up",
            ["display.icons.mappings"] = require("user.symbols").get_symbols()
        }
    end
}
