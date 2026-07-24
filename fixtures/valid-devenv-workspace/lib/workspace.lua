local M = {}

function M.devenv(config)
  config.backend = "devenv"
  return config
end

return M
