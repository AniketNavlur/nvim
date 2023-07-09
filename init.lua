if vim.g.vscode then
    return
end

require('user.options')
require('user.symbols').setup()
require('user.core').setup()
require('user.plugin-loader').load_all_plugins()
require('user.keymaps').setup()
require('user.lsp').setup()
require("user.ft")

