---@diagnostic disable-next-line: unused-function
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      default_component_configs = {
        file_size = { enabled = false },
        type = { enabled = false },
        last_modified = { enabled = false },
        created = { enabled = false },
        symlink_target = { enabled = false },
      },
      window = { position = "left", mappings = { ["/"] = "none" } },
      filesystem = {
        filtered_items = { visible = true },
        bind_to_cwd = true,
        cwd_target = { sidebar = "global", current = "global" },
        follow_current_file = { enabled = false },
        group_empty_dirs = true,
      },
    },
  },
}
