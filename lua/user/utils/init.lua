local M = {}

-- Save copied tables in `copies`, indexed by original table.
local function deepcopy(orig, copies)
    copies = copies or {}
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        if copies[orig] then
            copy = copies[orig]
        else
            copy = {}
            copies[orig] = copy
            for orig_key, orig_value in next, orig, nil do
                copy[deepcopy(orig_key, copies)] = deepcopy(orig_value, copies)
            end
            setmetatable(copy, deepcopy(getmetatable(orig), copies))
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function M.deepcopy(orig)
    deepcopy(orig)
end

function M.mergecopy(orig, overwrite)
    local copy = deepcopy(orig)
    for key, value in pairs(overwrite) do
        copy[key] = value
    end
    for key, value in ipairs(overwrite) do
        copy[key] = value
    end
    return copy
end

function M.split_str(str, sep)
    if sep == nil then
        sep = "%s"
    end

    local matches = {}

    for s in string.gmatch(str, "([^" .. sep .. "]+)") do
        table.insert(matches, s)
    end

    return matches
end

function M.make_func(callable, args)
    return function()
        callable(args)
    end
end

function M.make_nvim_cmd(command)
    return "<cmd>" .. command .. "<cr>"
end

return M
