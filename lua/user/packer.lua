local ensure_packer = function()
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

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'dstein64/vim-startuptime'

    use 'nvim-lua/plenary.nvim'

    use 'neovim/nvim-lspconfig'

    -- use(require("user.plugins.coq"))
    use(require("user.plugins.cmp"))

    use(require("user.plugins.nvim-treesitter"))

    use(require("user.plugins.neo-tree"))

    use(require("user.plugins.trouble"))

    use(require("user.plugins.telescope"))

    use(require("user.plugins.which-key"))

    use(require("user.plugins.lualine"))

    use(require("user.plugins.bufferline"))

    -- use(require("user.plugins.symbols-outline"))
    use(require("user.plugins.nvim-navbuddy"))
    use(require("user.plugins.barbecue"))

    -- use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    use(require("user.plugins.gitsigns"))
    use('kdheepak/lazygit.nvim')

    use(require("user.plugins.auto-session"))

    use(require("user.plugins.toggleterm"))

    use(require("user.plugins.catppuccin"))

    use(require("user.plugins.neodev"))

    if packer_bootstrap then
        require('packer').sync()
    end
end)
