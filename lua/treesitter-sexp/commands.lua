local actions = require "treesitter-sexp.actions"
local utils = require "treesitter-sexp.utils"

---@type table<string, TSSexp.Command>
local M = {
  swap_prev_elem = {
    desc = "Swap previous element",
    action = actions.swap_prev,
    get_form = utils.get_elem,
  },
  swap_next_elem = {
    desc = "Swap next element",
    action = actions.swap_next,
    get_form = utils.get_elem,
  },
  swap_prev_form = {
    desc = "Swap previous form",
    action = actions.swap_prev,
    get_form = utils.get_form,
  },
  swap_next_form = {
    desc = "Swap next form",
    action = actions.swap_next,
    get_form = utils.get_form,
  },
  promote_elem = {
    desc = "Promote element",
    action = actions.promote,
    get_form = utils.get_elem,
  },
  promote_form = {
    desc = "Promote form",
    action = actions.promote,
    get_form = utils.get_form,
  },
  splice = {
    desc = "Splice element",
    action = actions.splice,
    get_form = utils.get_elem,
  },
  slurp_left = {
    desc = "Slurp left",
    action = actions.slurp_left,
    get_form = utils.get_elem,
  },
  slurp_right = {
    desc = "Slurp right",
    action = actions.slurp_right,
    get_form = utils.get_elem,
  },
  barf_left = {
    desc = "Barf left",
    action = actions.barf_left,
    get_form = utils.get_elem,
  },
  barf_right = {
    desc = "Barf right",
    action = actions.barf_right,
    get_form = utils.get_elem,
  },
}

local metatable = {
  ---@param self TSSexp.Command
  __call = function(self)
    local node = self.get_form()
    if node == nil then
      vim.notify "Node not found"
      return
    end
    self.action(node)
  end,
}

for _, command in pairs(M) do
  setmetatable(command, metatable)
end

return M
