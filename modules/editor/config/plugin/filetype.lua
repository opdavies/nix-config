vim.filetype.add {
  extension = {
    inc = "php",
    install = "php",
    module = "php",
    neon = "yaml",
    pcss = "scss",
    theme = "php",
  },

  filename = {
    ["composer.lock"] = "json",
    ["phpstan.neon.dist"] = "yaml",
  },
}
