local M = {}

local function ensure_packer()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        vim.notify("downloaded packer")
        return true
    end
    return false
end

local function packerize(spec)

    if type(spec) == "string" then
        return spec
    end

    local packer_spec = {}

    packer_spec[1] = spec[1]

    packer_spec.setup = spec.init
    packer_spec.requires = spec.dependencies
    packer_spec.as = spec.name
    packer_spec.opt = spec.lazy
    packer_spec.run = spec.build
    packer_spec.lock = spec.pin

    packer_spec.after = spec.after

    if spec.enabled ~= nil then
        packer_spec.disabled = not spec.enabled
    end

    if spec.version ~= nil and spec.version == "*" then
        packer_spec.tag = "*"
    end

    packer_spec.config = spec.config

    return packer_spec
end

local packer_bootstrap = ensure_packer()

function M.load_plugins(plugins, opts)
    return require("packer").startup(function(use)
        for _, spec in pairs(plugins) do
            use(packerize(spec))
        end

        if packer_bootstrap then
            require('packer').sync()
        end
    end)
end

return M
