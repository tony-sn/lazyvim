return {
  {
    "nvim-lualine/lualine.nvim",
    -- event = "VeryLazy",
    opts = function(_, opts)
      local wpm = require("wpm")
      table.insert(opts.sections.lualine_x, {
        wpm.wpm,
        wpm.historic_graph,
      })
    end,
  },
}
