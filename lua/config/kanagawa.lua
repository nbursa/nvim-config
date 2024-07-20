-- Load the Kanagawa theme
require('kanagawa').setup({
    compile = true,             -- enable compiling the colorscheme
    undercurl = true,           -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true },
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords
    transparent = true,         -- make background transparent
    dimInactive = false,        -- dim inactive window
    globalStatus = true,        -- adjust window separators highlight for laststatus=3
    colors = {},
    overrides = function(colors)
        return {
            Normal = { bg = "NONE" },
        }
    end,
})

-- Apply the colorscheme
vim.cmd('colorscheme kanagawa')

