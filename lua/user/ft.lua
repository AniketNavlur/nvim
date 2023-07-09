local keymap = require("user.keymaps")
local utils  = require("user.utils")

local ft     = {
    ["xacro"] = "xml",
    ["urdf"]  = "xml",
}

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = {
        "*.xacro",
        "*.urdf",
    },
    callback = function()
        local substrs = utils.split_str(vim.fn.expand('<afile>'), ".")
        vim.cmd("set ft=" .. ft[substrs[#substrs]])
    end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = {
        "qf",
        "help",
        "man",
        "startuptime",
    },
    callback = function()
        local opts = keymap.default_opts()
        opts.buffer = 0
        keymap.set_keymap("n", "q", ":close<cr>", opts)
    end,
})
