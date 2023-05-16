local M = {}

M.registered_on_attach_cb = {}

function M.setup()
    local status_ok, lspconfig = pcall(require, "lspconfig")

    if not status_ok then
        vim.notify("lspconfig not available")
        return
    end

    require("user.lsp.handlers").setup()

    local handlers = require("user.lsp.handlers")
    local servers = require("user.lsp.servers")

    for _, s in pairs(servers) do
        local has_extra_config, config = pcall(require, "user.lsp.clients." .. s)

        if has_extra_config then
            config.on_attach = handlers.on_attach
            config.capabilities = handlers.capabilities
        else
            config = {
                on_attach = handlers.on_attach,
                capabilities = handlers.capabilities
            }
        end

        lspconfig[s].setup(config)
    end
end

function M.get_registered_attachs()
    return M.registered_on_attach_cb
end

function M.attach(on_attach)
    M.registered_on_attach_cb[#M.registered_on_attach_cb + 1] = on_attach
end

return M
