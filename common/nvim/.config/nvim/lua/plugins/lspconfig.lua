return {
    'neovim/nvim-lspconfig',
    enabled = true,
    lazy = false,

    dependencies = {
        -- Mason must be loaded before its dependents so we need to set it up here.
        {
            'mason-org/mason.nvim',
            opts = {
                max_concurrent_installers = 4,
                ui = {
                    width = 0.8,
                    height = 0.9,
                    border = 'rounded',
                    keymaps = {
                        toggle_package_expand = '<CR>',
                        install_package = 'i',
                        update_package = 'u',
                        check_package_version = 'c',
                        update_all_packages = 'U',
                        check_outdated_packages = 'C',
                        uninstall_package = 'X',
                        cancel_installation = '<C-c>',
                        apply_language_filter = '<C-f>',
                    },
                },
                icons = {
                    package_installed = '◍',
                    package_pending = '◍',
                    package_uninstalled = '◍',
                },
                pip = {
                    upgrade_pip = false,
                },
            },
        },
        'mason-org/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        { 'j-hui/fidget.nvim', opts = {} },
        'saghen/blink.cmp',
    },

    config = function()
        --  This function gets run when an LSP attaches to a particular buffer.
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup(
                '_lsp-attach',
                { clear = true }
            ),
            callback = function(event)
                local map = function(keys, func, desc, mode)
                    mode = mode or 'n'
                    vim.keymap.set(
                        mode,
                        keys,
                        func,
                        { buffer = event.buf, desc = 'LSP: ' .. desc }
                    )
                end

                -- Rename the variable under your cursor.
                --  Most Language Servers support renaming across files, etc.
                map('<leader>rn', vim.lsp.buf.rename, 'ReName')

                -- Execute a code action, usually your cursor needs to be on top of an error
                -- or a suggestion from your LSP for this to activate.
                map(
                    '<leader>ca',
                    vim.lsp.buf.code_action,
                    'Code Action',
                    { 'n', 'x' }
                )

                -- Find references for the word under your cursor.
                map(
                    '<leader>gr',
                    require('telescope.builtin').lsp_references,
                    'Goto References'
                )

                -- Jump to the implementation of the word under your cursor.
                --  Useful when your language has ways of declaring types without an actual implementation.
                map(
                    '<leader>gi',
                    require('telescope.builtin').lsp_implementations,
                    'Goto Implementation'
                )

                -- Jump to the definition of the word under your cursor.
                --  This is where a variable was first declared, or where a function is defined, etc.
                --  To jump back, press <C-t>.
                map(
                    '<leader>gd',
                    require('telescope.builtin').lsp_definitions,
                    'Goto Definition'
                )

                -- WARN: This is not Goto Definition, this is Goto Declaration.
                --  For example, in C this would take you to the header.
                map('<leader>gD', vim.lsp.buf.declaration, 'Goto Declaration')

                -- Fuzzy find all the symbols in your current document.
                --  Symbols are things like variables, functions, types, etc.
                -- map(
                --     'gO',
                --     require('telescope.builtin').lsp_document_symbols,
                --     'Open Document Symbols'
                -- )

                -- Fuzzy find all the symbols in your current workspace.
                --  Similar to document symbols, except searches over your entire project.
                -- map(
                --     'gW',
                --     require('telescope.builtin').lsp_dynamic_workspace_symbols,
                --     'Open Workspace Symbols'
                -- )

                -- Jump to the type of the word under your cursor.
                --  Useful when you're not sure what type a variable is and you want to see
                --  the definition of its *type*, not where it was *defined*.
                map(
                    '<leader>gt',
                    require('telescope.builtin').lsp_type_definitions,
                    'Goto Type definition'
                )
            end,
        })

        -- Diagnostic Config
        -- See :help vim.diagnostic.Opts
        vim.diagnostic.config({
            severity_sort = true,
            float = {
                focusable = true,
                style = 'minimal',
                border = 'rounded',
                source = 'always',
                header = '',
                prefix = '',
            },
            underline = { severity = vim.diagnostic.severity.ERROR },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = '󰅚 ',
                    [vim.diagnostic.severity.WARN] = '󰀪 ',
                    [vim.diagnostic.severity.INFO] = '󰋽 ',
                    [vim.diagnostic.severity.HINT] = '󰌶 ',
                },
            } or {},
            virtual_text = {
                source = 'always',
                spacing = 2,
                format = function(diagnostic)
                    local diagnostic_message = {
                        [vim.diagnostic.severity.ERROR] = diagnostic.message,
                        [vim.diagnostic.severity.WARN] = diagnostic.message,
                        [vim.diagnostic.severity.INFO] = diagnostic.message,
                        [vim.diagnostic.severity.HINT] = diagnostic.message,
                    }
                    return diagnostic_message[diagnostic.severity]
                end,
            },
        })

        -- LSP servers and clients are able to communicate to each other what features they support.
        --  By default, Neovim doesn't support everything that is in the LSP specification.
        --  When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
        --  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        -- Enable the following language servers
        --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
        --
        --  Add any additional override configuration in the following tables. Available keys are:
        --  - cmd (table): Override the default command used to start the server
        --  - filetypes (table): Override the default list of associated filetypes for the server
        --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
        --  - settings (table): Override the default settings passed when initializing the server.
        --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
        local servers = {
            -- See `:help lspconfig-all` for a list of all the pre-configured LSPs
            bashls = {},
            clangd = {},
            cssls = {},
            -- diagnosticls = {},
            docker_language_server = {},
            eslint = {},
            gopls = {},
            helm_ls = {},
            html = {},
            jsonls = {
                settings = {
                    json = {
                        schemas = require('schemastore').json.schemas(),
                        validate = { enable = true },
                    },
                },
            },
            lua_ls = {
                -- cmd = { ... },
                -- filetypes = { ... },
                -- capabilities = {},
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = 'Replace',
                        },
                        -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                        -- diagnostics = { disable = { 'missing-fields' } },
                    },
                },
            },
            pyright = {},
            stylua = {},
            tailwindcss = {},
            terraformls = {},
            tflint = {},
            -- May want https://github.com/pmizio/typescript-tools.nvim
            -- But for many setups, the LSP (`ts_ls`) will work just fine
            ts_ls = {},
            yamlls = {
                settings = {
                    yaml = {
                        schemaStore = {
                            -- You must disable built-in schemaStore support if you want to use
                            -- this plugin and its advanced options like `ignore`.
                            enable = false,
                            -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                            url = '',
                        },
                        schemas = require('schemastore').yaml.schemas(),
                    },
                },
            },
        }

        -- Ensure the servers and tools above are installed
        --
        -- To check the current status of installed tools and/or manually install
        -- other tools, you can run
        --    :Mason
        --
        -- You can press `g?` for help in this menu.
        --
        -- `mason` had to be setup earlier: to configure its options see the
        -- `dependencies` table for `nvim-lspconfig` above.
        --
        -- You can add other tools here that you want Mason to install
        -- for you, so that they are available from within Neovim.
        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
            'stylua', -- Used to format Lua code
        })
        require('mason-tool-installer').setup({
            ensure_installed = ensure_installed,
        })

        require('mason-lspconfig').setup({
            ensure_installed = {}, -- populates installs via mason-tool-installer
            automatic_installation = false,
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    -- This handles overriding only values explicitly passed
                    -- by the server configuration above. Useful when disabling
                    -- certain features of an LSP (for example, turning off formatting for ts_ls)
                    server.capabilities = vim.tbl_deep_extend(
                        'force',
                        {},
                        capabilities,
                        server.capabilities or {}
                    )
                    require('lspconfig')[server_name].setup(server)
                end,
            },
        })
    end,
}
