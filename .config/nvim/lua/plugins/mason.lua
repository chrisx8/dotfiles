---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        "ansible-language-server",
        "basedpyright",
        "bash-language-server",
        "lua-language-server",
        "markdownlint",
        "prettier",
        "rust-analyzer",
        "ruff",
        "shellcheck",
        "shfmt",
        "stylua",
        "yamllint",
      },
    },
  },
}
