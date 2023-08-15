require("nvim-treesitter.configs").setup {
    ensure_installed = {
		"awk",
		"bash",
		"comment",
		"css",
        "haskell",
		"html",
		"javascript",
		"jsdoc",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"mermaid",
		"php",
        "rust",
        "toml",
		"sql",
		"tsx",
		"yaml",
        "c",
    },
    sync_install = false, -- install async (faster)
    auto_install = true,
    highlight = {
        enable = true, -- `false` will disable the whole extension

        -- TODO: i do not understand function below. study it
        -- or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        disable = function(lang, buf)
            local max_filesize = 1024 * 1024
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end
    }
}
