local lang_utils = require('treesj.langs.utils')
local utils = require('treesj.utils')

local query = require('vim.treesitter.query')
local ts = require('vim.treesitter')

local function is_function_def(tsj)
  local prev = tsj:root():tsnode():prev_sibling()
  if prev == nil then
    return false
  end
  local text = ts.get_node_text(prev, 0)
  return text == "def" or text == "defp"
end

return {
  list = lang_utils.set_preset_for_list(),
  map_content = lang_utils.set_preset_for_list({
    split = {
      last_separator = false,
      non_bracket_node = true,
    }
  }),
  map = { target_nodes = { 'map_content' } },
  arguments = lang_utils.set_preset_for_args({
    format_tree = function(tsj)
      print(vim.inspect(is_function_def(tsj)))
    end
  }),
  quoted_content = lang_utils.set_preset_for_list({
    split = {
      format_tree = function(tsj)
        -- e.g. ~w(one two three)
        tsj:create_child({ text = '' }, 1)
        for t in tsj:text():gmatch("%S*") do
          tsj:create_child({ text = t }, #tsj:children() + 1)
        end
      end,
      enable = function(tsn)
        return tsn:parent():type() == 'sigil'
      end
    }
  }),
  sigil = {
    target_nodes = { 'quoted_content' }
  },
  -- identifier = {
  --   split = {
  --     format_tree = function(tsj)
  --       print(vim.inspect(tsj:text()))
  --       print(vim.inspect("next"))
  --       local next_sib = tsj:tsnode():next_sibling()
  --       print(vim.inspect(utils.get_node_text(next_sib)))
  --       for i, c in pairs(tsj:next():children()) do
  --         print("********************")
  --         print(c:text())
  --       end
  --     end
  --   }
  -- },
  -- keyword = {
  --   split = {
  --     format_tree = function(tsj)
  --       print(vim.inspect(tsj:text()))
  --       for i, c in pairs(tsj:children()) do
  --         print(c:text())
  --       end
  --     end
  --   }
  -- }
  call = {
    -- target_nodes = { 'arguments' }
    split = {
      format_tree = function(tsj)
        print(vim.inspect(is_function_def(tsj)))
      end,
    }
  }

}
