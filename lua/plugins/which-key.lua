local avante_complete_code = "Complete the following codes written in " .. vim.bo.filetype

require("which-key").add({
  {
    "<leader>a",
    group = "Avante",
  },
  {
    mode = { "n", "v" },
  },
  {
    "<leader>ac",
    function()
      require("avante.api").ask({ question = avante_complete_code })
    end,
    desc = "Complete Code(ask)",
  },
})

return {
  "folke/which-key.nvim",
  opts = {
    icons = {
      mappings = vim.g.have_nerd_font or true,
      keys = vim.g.have_nerd_font and {} or {
        r = "󰓡 ",
      },
      rules = {
        { plugin = "telescope-hierarchy.nvim", icon = "", color = "blue" },
      },
    },
  },
}
