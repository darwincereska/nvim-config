return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
        local npairs = require('nvim-autopairs')
        local Rule = require('nvim-autopairs.rule')
        local cond = require('nvim-autopairs.conds')

        npairs.setup({
            check_ts = true,  -- Enable treesitter integration
            ts_config = {
                lua = {'string', 'source'},
                kotlin = {'string', 'comment'},
                java = {'string', 'comment'},
            },
            disable_filetype = { "TelescopePrompt", "spectre_panel" },
            disable_in_macro = false,
            disable_in_visualblock = false,
            disable_in_replace_mode = true,
            ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
            enable_moveright = true,
            enable_afterquote = true,
            enable_check_bracket_line = false,
            enable_bracket_in_quote = true,
            enable_abbr = false,
            break_undo = true,
            map_cr = true,
            map_bs = true,
            map_c_h = false,
            map_c_w = false,

            -- Fast wrap feature - press Alt+e to wrap selection
            fast_wrap = {
                map = '<M-e>', -- or whatever key you prefer
                chars = { '{', '[', '(', '"', "'", '*' }, -- Added * here
                pattern = [=[[%'%"%)%>%]%)%}%,]]=],
                end_key = '$',
                keys = 'qwertyuiopzxcvbnmasdfghjkl',
                check_comma = true,
                highlight = 'Search',
                highlight_grey = 'Comment'
            },
        })

        -- Custom rules for better Kotlin support
        npairs.add_rules({
            -- Add spaces inside brackets for function calls
            Rule(' ', ' ')
                :with_pair(function(opts)
                    local pair = opts.line:sub(opts.col - 1, opts.col)
                    return vim.tbl_contains({ '()', '[]', '{}' }, pair)
                end),

            -- Don't pair quotes after backslash
            Rule('"', '"', 'kotlin')
                :with_pair(cond.not_before_regex('\\', 1)),

            -- Smart pairing for lambda expressions
            Rule('{', '}', 'kotlin')
                :with_pair(function(opts)
                    -- Don't autopair if we're after forEach, let, etc.
                    local line = opts.line:sub(1, opts.col - 1)
                    if line:match('forEach%s*$') or line:match('let%s*$') or line:match('run%s*$') then
                        return false
                    end
                    return true
                end),
        })

        -- Integration with nvim-cmp if you have it
        local cmp_status_ok, cmp = pcall(require, "cmp")
        if cmp_status_ok then
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
        end
    end
}

