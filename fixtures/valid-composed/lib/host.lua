local M = {}

function M.system(hostname)
  return {
    hostname = hostname,
    timezone = "UTC",
    locale = "en_US.UTF-8",
    keymap = "us",
  }
end

return M
