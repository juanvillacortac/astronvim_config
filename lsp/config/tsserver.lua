return function(opts)
  opts.root_dir = require("lspconfig.util").root_pattern("package.json", "node_modules")
  opts.single_file_support = false
  return opts
end
