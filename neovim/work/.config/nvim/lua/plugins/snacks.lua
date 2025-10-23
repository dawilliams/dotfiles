return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      input = {
        enabled = true,
      },
      picker = {
        -- https://github.com/folke/snacks.nvim/blob/main/docs/picker.md#general
        enabled = true,
      },
    },
  },
}
