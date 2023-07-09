local M = {}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

function M.load_plugins(plugins, opts)
    local core = require("user.core")
    core.cmd.register_cmd("workbench.view.plugin-manager", "Lazy")
    return require("lazy").setup(plugins, opts)
end

return M
