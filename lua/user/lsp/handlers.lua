local M = {}

local keymaps = require("user.keymaps")

function M.setup()
    local config = {
        -- disable virtual text
        virtual_text = false,
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if ok then
    M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

    --[[
    M.capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
    }
    --]]
else
    vim.notify("cmp_nvim_lsp not loaded")
end

M.on_attach = function(client, bufnr)
    local opts = keymaps.default_opts()
    opts.buffer = bufnr
    keymaps.register_keymaps(keymaps.get_keymaps("lsp-keymaps"), opts)

    local attachs = require("user.lsp").get_registered_attachs()

    for _, on_attach_cb in ipairs(attachs) do
        on_attach_cb(client, bufnr)
    end
end

return M
