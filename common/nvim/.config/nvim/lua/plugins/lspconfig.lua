local vim = vim

vim.lsp.handlers['textDocument/publishDiagnostics'] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = false,
        virtual_text = true,
        signs = true,
        update_in_insert = false,
    })

local signs = {
    Error = '',
    Warn = '',
    Info = '',
    Hint = 'ﴞ',
}

for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.lsp.protocol.CompletionItemKind = {
	" (text)",
	" (method)",
	" (function)",
	" (constructor)",
	"ﰠ (field)",
	" (variable)",
	" (class)",
	" (interface)",
	" (module)",
	" (property)",
	" (unit)",
	" (value)",
	" (enum)",
	" (key)",
	"﬌ (snippet)",
	" (color)",
	" (file)",
	" (reference)",
	" (folder)",
	" (enum member)",
	" (constant)",
	" (struct)",
	" (event)",
	" (operator)",
	" (type)",
}

-- TODO: move keybindings into appropriate on_attach functions
-- local on_attach = function(client)
-- end

-- enable completion in vscode lang servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').bashls.setup({})

require('lspconfig').cssls.setup({
    capabilities = capabilities,
})

require('lspconfig').diagnosticls.setup({
    -- on_attach=on_attach_vim,
    filetypes = { 'sh' },
    init_options = {
        filetypes = {
            ['javascript.jsx'] = 'eslint',
            javascript = 'eslint',
            javascriptreact = 'eslint',
            typescriptreact = 'eslint',
            sh = 'shellcheck',
        },
        linters = {
            eslint = {
                sourceName = 'eslint',
                command = './node_modules/.bin/eslint',
                rootPatterns = {
                    '.eslintrc',
                    '.eslintrc.json',
                    '.eslintrc.cjs',
                    '.eslintrc.js',
                    '.eslintrc.yml',
                    '.eslintrc.yaml',
                    'package.json',
                },
                debounce = 150,
                args = {
                    '--stdin',
                    '--stdin-filename',
                    '%filepath',
                    '--format',
                    'json',
                },
                parseJson = {
                    errorsRoot = '[0].messages',
                    line = 'line',
                    column = 'column',
                    endLine = 'endLine',
                    endColumn = 'endColumn',
                    message = '${message} [${ruleId}]',
                    security = 'severity',
                },
                securities = {
                    [2] = 'error',
                    [1] = 'warning',
                },
            },
            shellcheck = {
                sourceName = 'shellcheck',
                command = 'shellcheck',
                debounce = 150,
                args = { '--format=gcc', '-' },
                offsetLine = 0,
                offsetColumn = 0,
                formatLines = 1,
                formatPattern = {
                    '^[^:]+:(\\d+):(\\d+):\\s+([^:]+):\\s+(.*)$',
                    {
                        line = 1,
                        column = 2,
                        message = 4,
                        security = 3,
                    },
                },
                securities = {
                    error = 'error',
                    warning = 'warning',
                    note = 'info',
                },
            },
        },
        formatFiletypes = {
            sh = 'shfmt',
            terraform = 'terraform',
        },
        formatters = {
            shfmt = {
                command = 'shfmt',
                args = {
                    '-i',
                    '2',
                    '-bn',
                    '-ci',
                    '-p',
                },
            },
            terraform = {
                command = 'terraform',
                args = {
                    'fmt',
                    '-',
                },
            },
        },
    },
})

require('lspconfig').dockerls.setup({})

require('lspconfig').gopls.setup({})

--Enable (broadcasting) snippet capability for completion
require('lspconfig').html.setup({
    capabilities = capabilities,
})

require('lspconfig').jsonls.setup({
    commands = {
        Format = {
            function()
                vim.lsp.buf.range_formatting(
                    {},
                    { 0, 0 },
                    { vim.fn.line('$'), 0 }
                )
            end,
        },
    },
})

require('lspconfig').rust_analyzer.setup({})

-- require("lspconfig").sqlls.setup({
-- 	cmd = { "/bin/sql-language-server", "up", "--method", "stdio" },
-- })

require'lspconfig'.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        }
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end
}

-- sumneko is deprecated
-- local user = vim.fn.expand('$USER')
-- local sumneko_root_path = '/home/' .. user .. '/src/lua-language-server'
-- local sumneko_binary = sumneko_root_path .. '/bin/Linux/lua-language-server'
-- require('lspconfig').sumneko_lua.setup({
--     cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
--     settings = {
--         Lua = {
--             runtime = {
--                 -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--                 version = 'LuaJIT',
--                 -- Setup your lua path
--                 path = vim.split(package.path, ';'),
--             },
--             diagnostics = {
--                 -- Get the language server to recognize the `vim` global
--                 globals = { 'vim' },
--             },
--             workspace = {
--                 -- Make the server aware of Neovim runtime files
--                 library = {
--                     [vim.fn.expand('$VIMRUNTIME/lua')] = true,
--                     [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
--                 },
--             },
--             telemetry = {
--                 enable = false,
--             },
--         },
--     },
-- })

require('lspconfig').terraformls.setup({
    flags = {
        debounce_text_changes = 150,
    },
})

require('lspconfig').tflint.setup({
    flags = {
        debounce_text_changes = 150,
    },
})

require('lspconfig').tsserver.setup({})
require('lspconfig').yamlls.setup({})
