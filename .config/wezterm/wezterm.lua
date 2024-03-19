local core = require("config.core")
local ui = require("config.ui")
local tab = require("config.tab")
local key = require("config.key")

local config = {}

core.setup(config)
ui.setup(config)
tab.setup(config)
key.setup(config)

return config
