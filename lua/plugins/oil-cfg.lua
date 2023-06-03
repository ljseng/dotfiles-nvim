require("oil").setup {
    columns = {
        -- "icon",
        "permissions",
        -- "size",
        -- "mtime",
    },
    default_file_explorer = false, -- oil will not take over directory buffers (e.g. `vim .` or `:e src/`
    delete_to_trash = true, -- deleted files will be removed with the trash_command (below)
    trash_command = "trash-put", -- change this to customize the command used when deleting to trash
    keymaps = {
        ["g?"] = "actions.show_help",
        ["g."] = "actions.toggle_hidden",
        ["<CR>"] = "actions.select",
        ["<C-s>"] = "actions.select_vsplit",
        ["<C-h>"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
    },
    use_default_keymaps = true, -- set to false to disable all of the above keymaps
    view_options = {
        show_hidden = true, -- show files and directories that start with "."
    },
    -- configuration for the floating window in oil.open_float
    float = {
        padding = 10,
        max_width = 140,
        max_height = 100,
        border = "rounded",
        win_options = {
            winblend = 0,
        },
    },
}
