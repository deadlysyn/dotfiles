local map = vim.keymap.set

-- See :help vim.diagnostic.Opts
vim.diagnostic.config({
    underline = true,
    severity_sort = true,
    update_in_insert = false, -- less flicker
    float = {
        -- focusable = true,
        -- style = 'minimal',
        border = 'rounded',
        source = true,
        -- source = 'always',
        -- header = '',
        -- prefix = '',
    },
    underline = { severity = vim.diagnostic.severity.ERROR },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
    },
    linehl = {
        [sev.ERROR] = 'DiagnosticErrorLine',
    },
    virtual_text = {
        -- source = 'always',
        source = 'if_many',
        spacing = 4,
        -- format = function(diagnostic)
        --     local diagnostic_message = {
        --         [vim.diagnostic.severity.ERROR] = diagnostic.message,
        --         [vim.diagnostic.severity.WARN] = diagnostic.message,
        --         [vim.diagnostic.severity.INFO] = diagnostic.message,
        --         [vim.diagnostic.severity.HINT] = diagnostic.message,
        --     }
        --     return diagnostic_message[diagnostic.severity]
        -- end,
    },
})

-- diagnostic keymaps
local diagnostic_goto = function(next, severity)
    severity = severity and vim.diagnostic.severity[severity] or nil
    return function()
        vim.diagnostic.jump({
            count = next and 1 or -1,
            float = true,
            severity = severity,
        })
    end
end

map('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Line Diagnostics' })
map('n', ']d', diagnostic_goto(true), { desc = 'Next Diagnostic' })
map('n', '[d', diagnostic_goto(false), { desc = 'Prev Diagnostic' })
map('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Next Error' })
map('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Prev Error' })
map('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Next Warning' })
map('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Prev Warning' })

-- map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
-- map('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
-- local toggle_loclist = function()
--     for _, info in ipairs(vim.fn.getwininfo()) do
--         if info.loclist == 1 then
--             vim.cmd('lclose')
--             return
--         end
--     end
--     vim.diagnostic.setloclist()
-- end
-- map('n', '<leader>d', toggle_loclist, { desc = 'Toggle diagnostic list' })
