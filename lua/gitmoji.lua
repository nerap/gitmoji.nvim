local picker = require("gitmoji.gitmoji-picker").open_gitmoji_picker
local floating_input = require("gitmoji.floating-input")

local M = {}

function M.setup()
  local config = require("gitmoji.commands-and-keymaps")
  config.set_commands()
  config.set_keymaps()
end

-- callback is the function that will be called when the user selects a gitmoji
-- verify is a boolean that indicates if the user wants to verify the commit message
-- TODO: Refacto this to make the call back in fugitiv, not here... that's rly bad code
function M.open_floating(callback, verify)
  picker(function(value)
    floating_input.create_floating_buffer({
      title = "Enter the commit title: [gitmoji " .. value.emoji .. "]",
      on_confirmation_callback = function(message)
        callback(value.emoji .. " " .. message, verify)
      end
    })
  end)
end

return M
