return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
    settings = {
      save_on_toggle = true,
    },
  },
  keys = function()
    local harpoon = require("harpoon")
    local keys = {
      {
        "<leader>h",
        function()
          harpoon:list():add()
        end,
        desc = "Harpoon File",
      },
      {
        "<C-e>",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon Quick Menu",
      },
      {
        "<C-h>",
        function ()
          harpoon:list():select(1)
        end,
        desc = "Harpoon to File 1"
      },
      {
        "<C-j>",
        function ()
          harpoon:list():select(2)
        end,
        desc = "Harpoon to File 2"
      },
      {
        "<C-k>",
        function ()
          harpoon:list():select(3)
        end,
        desc = "Harpoon to File 3"
      },
      {
        "<C-l>",
        function ()
          harpoon:list():select(4)
        end,
        desc = "Harpoon to File 4"
      }
    }

    return keys
  end,
}
