require'nvim-treesitter.configs'.setup {
  -- a list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust", "ruby", "vim", "awk", "clojure","commonlisp", "cpp", "fortran","go","graphql", "haskell",  "java", "javascript", "json", "julia", "kotlin", "make", "proto", "racket", "scheme", "scala", "scss", "sparql", "svelte", "toml", "yaml" },

  -- install parsers synchronously (only applied to 'ensured_installed')
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
