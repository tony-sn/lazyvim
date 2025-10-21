return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    strategies = {
      chat = {
        adapter = "anthropic",
        model = "claude-haiku-4.5",
      },
    },
    -- NOTE: The log_level is in `opts.opts`
    opts = {
      log_level = "DEBUG", -- or "TRACE"
    },
  },
}
