local lang_utils = require('treesj.langs.utils')
local utils = require('treesj.utils')

return {
  list = lang_utils.set_preset_for_list(),
  map_content = lang_utils.set_preset_for_list({
    split = {
      last_separator = false,
      non_bracket_node = true,
    }
  }),
  map = { target_nodes = { 'map_content' } },
  arguments = lang_utils.set_preset_for_args(),
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
  }

}
