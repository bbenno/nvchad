require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

lspconfig.html.setup({})
lspconfig.cssls.setup({})

lspconfig.nixd.setup({
  settings = {
    nixd = {
      nixpkgs = {
        expr = "import <nixpkgs> {}",
      },
      formatting = {
        command = { "nixfmt" }, -- optional; formatting still via conform
      },
      options = {
        nixos = {
          expr = '(builtins.getFlake "/etc/nixos").nixosConfigurations."' .. vim.fn.hostname() .. '".options',
        },
        -- home_manager = {
        --   expr = '(builtins.getFlake "/etc/nixos").homeConfigurations."<user>".options',
        -- },
      },
    },
  },
})

-- vim.lsp.config("nixd", {
--   settings = {
--     nixd = {
--       nixpkgs = {
--         expr = "import <nixpkgs> {}",
--       },
--       formatting = {
--         command = { "nixfmt" }, -- optional; formatting still via conform
--       },
--       options = {
--         nixos = {
--           expr = '(builtins.getFlake "/etc/nixos").nixosConfigurations."<hostname>".options',
--         },
--         home_manager = {
--           expr = '(builtins.getFlake "/etc/nixos").homeConfigurations."<user>".options',
--         },
--       },
--     },
--   },
-- })

local servers = {
  "html",
  "cssls",
  "nixd",
}
-- vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
