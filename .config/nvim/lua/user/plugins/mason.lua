return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "ansiblels",
        "lua_ls",
        "pyright",
        "rust_analyzer",
      }
    }
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        "black",
        "isort",
        "shellcheck",
      }
    }
  }
}
