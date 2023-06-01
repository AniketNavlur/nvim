local SYMBOLS = {
    Array               = '󰅪 ',
    Boolean             = ' ',
    Class               = '󰠱 ',
    Color               = ' ',
    Constant            = ' ',
    Constructor         = ' ',
    Enum                = '了',
    EnumMember          = ' ',
    Event               = ' ',
    Field               = ' ',
    File                = '󰈙 ',
    Folder              = ' ',
    Function            = ' ',
    Interface           = ' ',
    Keyword             = ' ',
    Macro               = ' ',
    Method              = '󰆧 ',
    Module              = ' ',
    Namespace           = '󰌗 ',
    Null                = '󰟢 ',
    Number              = ' ',
    Object              = '󰅩 ',
    Operator            = '󰆕 ',
    Package             = ' ',
    Parameter           = ' ',
    Property            = '󰜢 ',
    Reference           = ' ',
    Snippet             = '﬌ ',
    StaticMethod        = ' ',
    String              = '󰉿 ',
    Struct              = ' ',
    Text                = '󰉿 ',
    TypeAlias           = ' ',
    TypeParameter       = ' ',
    Undefined           = ' ',
    Unit                = ' ',
    Value               = ' ',
    Variable            = ' ',
    DiagnosticSignError = ' ',
    DiagnosticSignHint  = ' ',
    DiagnosticSignInfo  = ' ',
    DiagnosticSignWarn  = ' ',
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
