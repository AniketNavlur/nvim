local M = {}

local has_wk, wk = pcall(require, "which-key")

function M.setup(core_lib)
    M.core_lib = core_lib
end

function M.bind(mode, keys, cmd, opts)
    if type(mode) == "string" then
        mode = vim.split(vim.trim(mode), "|")
    end

    local K = { mode = mode, keys = keys, cmd = cmd, opts = opts or {} }

    function K:add_desc(desc)
        K.opts.desc = desc
        return K
    end

    function K:add_prefix(prefix)
        K.prefix = prefix
        return K
    end

    function K:add_opts(options)
        K.opts = vim.tbl_deep_extend("force", K.opts, options)
        return K
    end

    function K.register(options)
        if K.cmd then
            vim.keymap.set(K.mode, K.keys, K.cmd, vim.tbl_deep_extend("force", K.opts, options or {}))
        end
    end

    return K
end

return M
