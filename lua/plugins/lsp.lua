return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      jdtls = function(opts)
        vim.list_extend(opts.cmd, {
          -- "-Dsun.zip.disableMemoryMapping=true",
          -- "-XX:+UseParallelGC",
          -- "-XX:+UseStringDeduplication",
          -- "-XX:AdaptiveSizePolicyWeight=90",
          -- "-XX:GCTimeRatio=4",
          "-Xms2G",
          "-Xmx12G",
        })

        -- https://github.com/eclipse-jdtls/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
        opts.settings.java = vim.tbl_deep_extend("force", opts.settings.java, {
          configuration = {
            runtimes = {
              {
                name = "JavaSE-1.8",
                path = "/usr/lib/jvm/java-8-openjdk-amd64/",
              },
              {
                name = "JavaSE-11",
                path = "/usr/lib/jvm/java-11-openjdk-amd64/",
              },
              {
                name = "JavaSE-17",
                path = "/usr/lib/jvm/java-17-openjdk-amd64/",
              },
            },
          },
          completion = {
            favoriteStaticMembers = {
              "java.util.Objects.requireNonNull",
              "java.util.Objects.requireNonNullElse",
              "org.junit.jupiter.api.Assertions.*",
              "org.mockito.Mockito.*",
            },
            importOrder = {
              "",
              "java",
              "javax",
              "#",
            },
          },
          format = {
            enabled = true,
            tabSize = 4,
            settings = {
              url = vim.fn.expand("/home/c414972/git-repos/opc/sgpc-java-code-style-eclipse.xml"),
              profile = "SGPC Java Code Style",
            },
          },
          sources = {
            organizeImports = {
              starThreshold = 4,
              staticStarThreshold = 4,
            },
          },
        })
      end,
    },
  },
}
