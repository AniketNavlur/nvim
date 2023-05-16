if vim.g.vscode then
    return
end

require('user.options')
require('user.symbols').setup()
require("user.ft")
require('user.packer')
require('user.keymaps').setup()
require('user.lsp').setup()

