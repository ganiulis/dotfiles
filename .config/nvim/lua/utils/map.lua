---@class Args
---@field desc string
---@field mode "n"|"v"?
---@field key string
---@field action string | function
---@field remap boolean?
---@field noremap boolean?
---@field silent boolean?

local DEFAULT_ARGS = {
  mode = "n",
}

---@param group string
return function(group)
  ---@param args Args
  return function(args)
    vim.keymap.set(args.mode or DEFAULT_ARGS.mode, args.key, args.action, {
      desc = "[" .. group .. "] " .. args.desc,
      remap = args.remap,
      noremap = args.noremap,
      silent = args.silent,
    })
  end
end
