return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  opts = {
    left = {
      {
        ft = "neo-tree",
        title = "Explorer",
        size = {
          width = 40,
        },
      },
    },

    bottom = {
      {
        ft = "toggleterm",
        title = "Terminal",
        size = {
          height = 0.30,
        },
      },
    },
  },
}
