return {
  {
    "nvim-telescope/telescope.nvim",

    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        event = "VeryLazy",
        config = function(_, _)
          require("lazyvim.util").on_load("telescope.nvim", function()
            require("telescope").load_extension("live_grep_args")
          end)
        end,
        keys = {
          { "<leader>/", ":Telescope live_grep_args<CR>", desc = "Live Grep"},
        }
      }
    },
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      -- {
      --   "<leader>/",
      --   function() require("telescope.builtin").extensions.live_grep_args.live_grep_args() end,
      --   desc = "live grep with args",
      -- },
    },
    -- change some options
    opts = {
      defaults = {
        -- layout_strategy = "vertical",
        -- layout_config = { prompt_position = "top" },
        -- layout_config = { prompt_position = "top", preview_cutoff = 120 },
        sorting_strategy = "ascending",
        winblend = 0,
        -- path_display = { truncate = true, shorten = 3, tail = true },
        path_display = function(opts, path)
          local tail = require("telescope.utils").path_tail(path)
          return string.format("%s (%s)", tail, path)
        end,
      },
    },
  },
}
