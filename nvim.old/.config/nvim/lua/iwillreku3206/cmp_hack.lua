-- Copied from u/MariaSoOs on Reddit (https://www.reddit.com/r/neovim/comments/15ptyvb/nvim_cmp_super_tab_goes_crazy/)

local luasnip = require 'luasnip'
local unlink_group = vim.api.nvim_create_augroup('UnlinkSnippet', {})
vim.api.nvim_create_autocmd('ModeChanged', {
  group = unlink_group,
  -- when going from select mode to normal and when leaving insert mode
  pattern = { 's:n', 'i:*' },
  callback = function(event)
    if
        luasnip.session
        and luasnip.session.current_nodes[event.buf]
        and not luasnip.session.jump_active
    then
      luasnip.unlink_current()
    end
  end,
})
