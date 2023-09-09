local M = {}

-- Be sure to explicitly define these LuaSnip node abbreviations!
local ls = require("luasnip")
local sn = ls.snippet_node
local i = ls.insert_node

-- Summary: When `LS_SELECT_RAW` is populated with a visual selection, the function
-- returns an insert node whose initial text is set to the visual selection.
-- When `LS_SELECT_RAW` is empty, the function simply returns an empty insert node.
-- You only need to write the get_visual function once per snippet file—you can then
-- use it in all snippets in the file.
function M.get_visual(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    -- if there is no active visual selection, the dynamic node simply acts
    -- as a regular insert node.
    return sn(nil, i(1, ""))
  end
end

return M
