return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
  config = function()
    local lualine = require("lualine")
    local icons = LazyVim.config.icons
    local colors = {
      bg = "#00FFFFFF",
      -- bg       = '#2e3440',
      fg = "#eceff4",
      yellow = "#ebcb8b",
      cyan = "#79dac8",
      darkblue = "#5e81ac",
      green = "#a3be8c",
      orange = "#d08770",
      violet = "#b48ead",
      magenta = "#b48ead",
      blue = "#81a1c1",
      red = "#bf616a",
    }

    -- harpoon
    local function harpoon()
      local current_file_harpoon_index = "-"
      local total_marks = require("harpoon"):list():length()
      local current_file_path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":.")

      if total_marks == 0 then
        return ""
      end

      for index = 1, total_marks do
        local harpoon_file_path = require("harpoon"):list():get(index).value

        if current_file_path == harpoon_file_path then
          current_file_harpoon_index = tostring(index)
        end
      end

      return string.format("%s/%d", current_file_harpoon_index, total_marks)
      -- return string.format("󱡅 %s/%d", current_file_harpoon_index, total_marks)
    end

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    local config = {
      options = {
        component_separators = "",
        section_separators = "",
        theme = {
          normal = { c = { fg = colors.fg, bg = colors.bg } },
          inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
        -- theme = "nord"
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
      extensions = { "neo-tree" },
    }

    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    ins_left({
      "mode",
      color = function()
        local mode_color = {
          n = colors.blue,
          i = colors.red,
          v = colors.yellow,
          [""] = colors.blue,
          V = colors.blue,
          c = colors.orange,
          no = colors.red,
          s = colors.orange,
          S = colors.orange,
          [""] = colors.orange,
          ic = colors.yellow,
          R = colors.violet,
          Rv = colors.violet,
          cv = colors.red,
          ce = colors.red,
          r = colors.cyan,
          rm = colors.cyan,
          ["r?"] = colors.cyan,
          ["!"] = colors.red,
          t = colors.red,
        }
        return { fg = mode_color[vim.fn.mode()] }
      end,
      padding = { right = 1 },
    })

    ins_left({
      harpoon,
    })

    ins_left({
      "filename",
      cond = conditions.buffer_not_empty,
      color = { fg = colors.fg, gui = "bold" },
    })

    ins_left({
      "diagnostics",
      symbols = {
        error = icons.diagnostics.Error,
        warn = icons.diagnostics.Warn,
        hint = icons.diagnostics.Hint,
        info = icons.diagnostics.Info,
      },
    })

    -- Insert mid section. You can make any number of sections in neovim :)
    -- for lualine it's any number greater then 2
    ins_left({
      function()
        return "%="
      end,
    })

    -- Add components to right sections
    ins_right({
      "branch",
      icon = "",
      color = { fg = colors.fg, gui = "bold" },
    })

    -- ins_right({
    --   "diff",
    --   symbols = { added = "+", modified = "~", removed = "-" },
    --   diff_color = {
    --     added = { fg = colors.green },
    --     modified = { fg = colors.orange },
    --     removed = { fg = colors.red },
    --   },
    --   cond = conditions.hide_in_width,
    -- })

    ins_right({
      "diff",
      symbols = {
        added = icons.git.added,
        modified = icons.git.modified,
        removed = icons.git.removed,
      },
      source = function()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
          return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
          }
        end
      end,
    })

    ins_right({
      "filetype",
      cond = conditions.buffer_not_empty,
    })

    ins_right({ "location" })

    ins_right({ "progress", color = { fg = colors.fg, gui = "bold" } })

    lualine.setup(config)
  end,
}
