require("nvchad.configs.lspconfig").defaults()

vim.lsp.config("nixd", {
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
          expr = '(builtins.getFlake "/etc/nixos").nixosConfigurations."<hostname>".options',
        },
        home_manager = {
          expr = '(builtins.getFlake "/etc/nixos").homeConfigurations."<user>".options',
        },
      },
    },
  },
})

local servers = {
  "html",
  "cssls",
  "nixd",
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
