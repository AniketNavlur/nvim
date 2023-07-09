local M = {}

M.cmd = require("user.core.cmd")
M.keys = require("user.core.keys")

function M.setup()
    M.cmd.setup(M)
    M.keys.setup(M)
end

return M
