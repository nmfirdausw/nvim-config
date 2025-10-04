return {
  cmd = { "intelephense", "--stdio" },
  filetypes = { "php" },
  root_markers = { ".git", "composer.json" },
  settings = {
    intelephense = {
      files = {
        maxSize = 10000000,
      },
      codeLens = {
        implementations = {
          enabled = true,
        },
        overrides = {
          enabled = true,
        },
        parent = {
          enabled = true,
        },
        references = {
          enabled = true,
        },
        usages = {
          enabled = true,
        },
      },
    },
  },
}
