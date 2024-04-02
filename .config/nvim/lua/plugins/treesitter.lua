-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.auto_install = true
    opts.ignore_install = {
      "git_rebase",
      "gitcommit",
    }
  end,
}
