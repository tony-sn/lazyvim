-- stylua: ignore
-- if true then return {} end -- NOTE: uncomment to ignore this file
-- return {
--   {
--     "NvChad/nvim-colorizer.lua",
--     config = function()
--       require("colorizer").setup({
--         filetypes = { "css", "scss", "html", "javascript", "typescript", "typescriptreact", "javascriptreact" },
--         user_default_options = {
--           RGB = true, -- #RGB hex codes
--           RRGGBB = true, -- #RRGGBB hex codes
--           RRGGBBAA = true, -- #RRGGBBAA hex codes
--           rgb_fn = true, -- CSS rgb() and rgba() functions
--           hsl_fn = true, -- CSS hsl() and hsla() functions
--           css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
--           css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
--           tailwind = true, -- Enable tailwind colors
--           sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
--           mode = "background", -- Set the display mode.
--           virtualtext = "■",
--           always_update = true, -- update color values even if buffer is not focused,
--         },
--       })
--     end,
--   },
-- }


local cmp = require("cmp")

return {
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      filetypes = { "css", "scss", "html", "javascript", "typescript", "typescriptreact", "javascriptreact" },
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        tailwind = true,
        sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
        mode = "background", -- Set the display mode.
        always_update = true, -- update color values even if buffer is not focused,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    cmp.setup({
      window = {
        completion = cmp.config.window.bordered({ border = "rounded" }),
      },
    }),
    opts = function(_, opts)
      -- original LazyVim kind icon formatter
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
}
