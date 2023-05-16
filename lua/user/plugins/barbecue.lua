return {
    "utilyre/barbecue.nvim",
    tag = "*",
    requires = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons",
    },
    after = "nvim-web-devicons",

    config = function()
        require("barbecue").setup()
    end,
}
