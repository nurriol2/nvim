-- Surrounding characters like ""
-- `ys iw "` to add surrounding " to the whole word
-- `ds "` to delete the surrounding "
-- `cs " '` to replace surrounding " with '
-- all of the above work with `t` for tag: `ys motion t`

return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile" }, 
  version = "*",
  config = true,
}
