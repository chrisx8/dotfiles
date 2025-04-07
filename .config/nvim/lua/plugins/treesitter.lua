---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    auto_install = true,
    ignore_install = {
      "git_rebase",
      "gitcommit",
    },
  },
}
