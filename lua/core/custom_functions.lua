-- Define the Lua function to wrap selected text in backticks
function _G.wrap_in_backticks()
  -- Use vim.api.nvim_exec to execute Vimscript
  vim.api.nvim_exec([[
    '<,'>s/\%V.\{-}\%V/\`\0\`/g
  ]], false)
end

-- Create a command named CodeWrap that calls the Lua function
vim.api.nvim_create_user_command(
  'CodeWrap',
  wrap_in_backticks,
  {range = true}
)

-- Map the command to a keybinding in visual mode
vim.api.nvim_set_keymap('v', '<Leader>cr', ':CodeWrap<CR>', {noremap = true, silent = true})

