-- TODO: investigate on_attach use case
-- local on_attach = function(client)
-- end

require('lspconfig').bashls.setup({})
require('lspconfig').cssls.setup({})

require('lspconfig').diagnosticls.setup({
  -- on_attach=on_attach_vim,
  filetypes = { "sh", "coffee" },
  init_options = {
    filetypes = {
      coffee = "coffeelint",
      ["javascript.jsx"] = "eslint",
      javascript = "eslint",
      javascriptreact = "eslint",
      typescriptreact = "eslint",
      sh = "shellcheck"
    },
    linters = {
      coffeelint = {
        sourceName = "coffeelint",
        command = "coffeelint",
        debounce = 100,
        args = { "--color=never", "--reporter=csv", "--stdin" },
        offsetLine = 0,
        offsetColumn = 0,
        formatLines = 1,
        formatPattern = {
          -- column output is inconsistent :-/
          "^\\S+,(\\d+),\\S+,(.*)$",
          {
            line = 1,
            message = 2
          };
        },
        securities = {
          error = "error",
          warning = "warning",
          note = "info"
        };
      },
      eslint = {
        sourceName = "eslint",
        command = "./node_modules/.bin/eslint",
        rootPatterns = { ".eslintrc", ".eslintrc.json", ".eslintrc.cjs", ".eslintrc.js", ".eslintrc.yml", ".eslintrc.yaml", "package.json" },
        debounce = 100,
        args = {
          "--stdin",
          "--stdin-filename",
          "%filepath",
          "--format",
          "json",
        },
        parseJson = {
          errorsRoot = "[0].messages",
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "${message} [${ruleId}]",
          security = "severity",
        },
        securities = {
          [2] = "error",
          [1] = "warning"
        }
      },
      shellcheck = {
        sourceName = "shellcheck",
        command = "shellcheck",
        debounce = 100,
        args = { "--format=gcc", "-" },
        offsetLine = 0,
        offsetColumn = 0,
        formatLines = 1,
        formatPattern = {
          "^[^:]+:(\\d+):(\\d+):\\s+([^:]+):\\s+(.*)$",
          {
            line = 1,
            column = 2,
            message = 4,
            security = 3
          };
        },
        securities = {
          error = "error",
          warning = "warning",
          note = "info"
        };
      }
    },
    formatFiletypes = {
      sh = "shfmt",
    },
    formatters = {
      shfmt = {
        command = "shfmt",
        args = {
          "-i",
          "2",
          "-bn",
          "-ci",
          "-sr",
        },
      }
    }
  }
})

require'lspconfig'.dockerls.setup{}
require('lspconfig').gopls.setup({})

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require('lspconfig').html.setup({
  capabilities = capabilities
})

require('lspconfig').jsonls.setup({
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
    }
  }
})

-- require('lspconfig').pyright.setup({})
require('lspconfig').rust_analyzer.setup({})

require('lspconfig').sqlls.setup({
    cmd = { '/bin/sql-language-server', 'up', '--method', 'stdio' },
})

local user = vim.fn.expand('$USER')
local sumneko_root_path = '/home/' .. user .. '/src/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/Linux/lua-language-server'

require('lspconfig').sumneko_lua.setup({
  cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

require('lspconfig').terraformls.setup({})
require('lspconfig').tsserver.setup({})
require('lspconfig').yamlls.setup({})
