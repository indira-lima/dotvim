if !has('nvim')
  finish
endif

PackAdd andweeb/presence.nvim

lua << EOF
-- Check if IPC is available and accessible
local function check_ipc()
  local socket_path = "/var/run/discord-ipc-0"
  local handle = io.open(socket_path, "r")
  
  if not handle then
    -- Check if socket exists but we can't access it
    local stat = vim.loop.fs_stat(socket_path)
    if stat then
      return false, "Discord IPC socket exists but cannot be accessed"
    else
      return false, "Discord IPC socket not found. Make sure Discord is running in Windows."
    end
  end
  
  handle:close()
  return true, nil
end

local ipc_ok, err_msg = check_ipc()
if not ipc_ok then
  vim.notify(err_msg, vim.log.levels.WARN)
end

local ok, presence = pcall(require, "presence")
if not ok then
  vim.notify("Failed to load presence.nvim: " .. tostring(presence), vim.log.levels.ERROR)
  return
end

-- Enable debug logging
vim.g.presence_debug = false

-- The setup config table shows all available config options with their default values:
require("presence").setup({
    -- General options
    client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
    log_level           = "debug",                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout    = 10,                         -- Number of seconds to debounce events 
    enable_line_number  = false,                      -- Displays the current line number instead of the current project
    blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    buttons             = false,                       -- Configure Rich Presence button(s) 
    file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions 
    show_time           = true,                       -- Show the timer
    main_image          = "neovim",                   -- Main image display (either "neovim" or "file")

    -- Rich Presence text options
    neovim_image_text   = "O melhor editor de texto que existe. Ponto.", -- Text displayed when hovered over the Neovim image
    editing_text        = "Editando na velocidade da luz: %s",               -- Format string rendered when an editable file is loaded in the buffer 
    file_explorer_text  = "Procurando arquivos...",              -- Format string rendered when browsing a file explorer 
    git_commit_text     = "GIT GIT GIT",       -- Format string rendered when committing changes in git 
    plugin_manager_text = "Tunando meu neovim",         -- Format string rendered when managing plugins 
    reading_text        = "Lendo %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer 
    workspace_text      = "Trabalhando em: %s",            -- Format string rendered when in a git repository 
    line_number_text    = "Linha %s de %s",        -- Format string rendered when `enable_line_number` is set to true 
})
