local SYMBOLS = {
    Class               = " ",
    Color               = " ",
    Constant            = " ",
    Constructor         = " ",
    Enum                = "了",
    EnumMember          = " ",
    Field               = " ",
    File                = " ",
    Folder              = " ",
    Function            = " ",
    Interface           = "ﰮ ",
    Keyword             = " ",
    Method              = "ƒ ",
    Module              = " ",
    Property            = " ",
    Snippet             = "﬌ ",
    Struct              = " ",
    Text                = " ",
    Unit                = " ",
    Value               = " ",
    Variable            = " ",
    Reference           = "",
    Event               = "",
    Operator            = " ",
    TypeParameter       = "",
    DiagnosticSignError = " ",
    DiagnosticSignWarn  = " ",
    DiagnosticSignHint  = " ",
    DiagnosticSignInfo  = " ",
}

local M = {}

function M.define_symbols(prefix, symbol)
    if type(symbol) == 'table' then
        for k, v in pairs(symbol) do
            M.define_symbols(prefix .. k, v)
        end
    else
        vim.fn.sign_define(prefix, { texthl = prefix, text = symbol, numhl = "" })
    end
end

function M.get_symbols()
    return SYMBOLS
end

function M.setup()
    M.define_symbols('', SYMBOLS)
end

return M
