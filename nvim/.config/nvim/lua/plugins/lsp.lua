---@type table<string, vim.lsp.Config>
local servers = {
  stylua = {},

  vtsls = {
    settings = {
      typescript = {
        tsserver = { maxTsServerMemory = 8192 },
      },
      vtsls = {
        autoUseWorkspaceTsdk = true,
        experimental = {
          completion = { enableServerSidePolyfills = true },
        },
      },
    },
  },
  gopls = {},
  rust_analyzer = {},

  intelephense = {
    cmd = { "intelephense", "--stdio" },
    filetypes = { "php" },
    root_markers = { ".git", "composer.json" },
  },

  pyright = {},

  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT' },
        workspace = {
          checkThirdParty = false,
          library = vim.list_extend(vim.api.nvim_get_runtime_file('', true), { '${3rd}/luv/library' }),
        },
      },
    },
  },
}

-- Mason package names (distinct from LSP server names above).
local ensure_installed = {
  'stylua',
  'vtsls',
  'gopls',
  'intelephense',
  'pyright',
  'lua-language-server',
}

vim.pack.add {
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
}

require('mason').setup {}
require('mason-tool-installer').setup { ensure_installed = ensure_installed }

for name, server in pairs(servers) do
  vim.lsp.config(name, server)
  vim.lsp.enable(name)
end
