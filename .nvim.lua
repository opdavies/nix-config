vim.keymap.set("n", "<leader>fn", function()
  require("telescope.builtin").find_files({
    cwd = "modules/home-manager/coding/neovim/config"
  })
end)

require("conform").setup {
  formatters_by_ft = {
    lua = { "stylua" },
    nix = { "nixfmt" },
  },
}

require("lint").linters_by_ft = {
  lua = { "luacheck" },
  nix = { "nix" },
}

local lspconfig = require "lspconfig"

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.lua_ls.setup {
  capabilities = capabilities,

  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },

      diagnostics = {
        globals = { "vim" },
      },

      runtime = {
        version = "LuaJIT",
      },

      telemetry = {
        enabled = false,
      },

      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
}

lspconfig.nixd.setup {
  capabilities = capabilities,

  cmd = { "nixd" },

  settings = {
    nixd = {
      nixpkgs = {
        expr = "import <nixpkgs> { }",
      },

      formatting = {
        command = "nix fmt",
      },
    },
  },
}
