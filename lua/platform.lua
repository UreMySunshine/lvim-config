local is_windows = require("utils.environment").is_windows()

if is_windows then
  require("system.windows")
end
