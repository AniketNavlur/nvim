return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },

    config = function()
        vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

        require("neo-tree").setup {
            close_if_last_window = true,
            popup_border_style = "rounded",
            window = {
                position = "right",
                width = 30
            },
            filesystem = {
                follow_current_file = true, -- This will find and focus the file in the active buffer every
                -- time the current file is changed while the tree is open.
            },
            git_status = {
                window = {
                    position = "float",
                },
                symbols = {
                    -- Change type
                    added     = "✚", -- but this is redundant info if you use git_status_colors on the name
                    modified  = "", -- but this is redundant info if you use git_status_colors on the name
                    deleted   = "✖", -- this can only be used in the git_status source
                    renamed   = "", -- this can only be used in the git_status source
                    -- Status type
                    untracked = "",
                    ignored   = "",
                    unstaged  = "",
                    staged    = "",
                    conflict  = "",
                }
            },
            event_handlers = {

                {
                    event = "file_opened",
                    handler = function(file_path)
                        --auto close
                        require("neo-tree.sources.manager").close_all()
                    end
                },

            }
        }

        vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
    end
}
