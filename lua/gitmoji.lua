local picker = require("gitmoji.gitmoji-picker").open_gitmoji_picker
local floating_input = require("gitmoji.floating-input")

local M = {}

function M.setup()
  local config = require("gitmoji.commands-and-keymaps")
  config.set_commands()
  config.set_keymaps()
end

function M.open_floating(callback)
   picker(function(value)
    floating_input.create_floating_buffer({
      title = "Enter the commit title: [gitmoji " .. value.emoji .. "]",
      on_confirmation_callback = function(message)
        callback(value.emoji .. " " .. message)
      end
    })
  end)
end

return M
