local actions = require "treesitter-sexp.actions"
local utils = require "treesitter-sexp.utils"

---@type table<string, TSSexp.Command>
local M = {
  swap_prev_elem = {
    desc = "Swap previous element",
    action = actions.swap_prev,
    get_node = utils.get_elem_node,
  },
  swap_next_elem = {
    desc = "Swap next element",
    action = actions.swap_next,
    get_node = utils.get_elem_node,
  },
  swap_prev_form = {
    desc = "Swap previous form",
    action = actions.swap_prev,
    get_node = utils.get_form_node,
  },
  swap_next_form = {
    desc = "Swap next form",
    action = actions.swap_next,
    get_node = utils.get_form_node,
  },
  promote_elem = {
    desc = "Promote element",
    action = actions.promote,
    get_node = utils.get_elem_node,
  },
  promote_form = {
    desc = "Promote form",
    action = actions.promote,
    get_node = utils.get_form_node,
  },
  splice = {
    desc = "Splice element",
    action = actions.splice,
    get_node = utils.get_elem_node,
  },
  slurp_left = {
    desc = "Slurp left",
    action = actions.slurp_left,
    get_node = utils.get_elem_node,
  },
  slurp_right = {
    desc = "Slurp right",
    action = actions.slurp_right,
    get_node = utils.get_elem_node,
  },
  barf_left = {
    desc = "Barf left",
    action = actions.barf_left,
    get_node = utils.get_elem_node,
  },
  barf_right = {
    desc = "Barf right",
    action = actions.barf_right,
    get_node = utils.get_elem_node,
  },
}

for key, command in pairs(M) do
  setmetatable(M[key], {
    __call = function()
      local node = command.get_node()
      if node == nil then
        vim.notify "Node not found"
        return
      end
      command.action(node)
    end,
  })
end

return M