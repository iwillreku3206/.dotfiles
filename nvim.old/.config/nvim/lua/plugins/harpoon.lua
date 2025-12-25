return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim" -- for telescope extension
  },
  config = function()
    vim.keymap.set('n', 'mf', function()
      require('harpoon.mark').add_file()
    end)

    vim.keymap.set('n', 'mm', function()
      require('harpoon.ui').toggle_quick_menu()
    end)

    vim.keymap.set('n', 'm1', function()
      require('harpoon.ui').nav_file(1)
    end)

    vim.keymap.set('n', 'm2', function()
      require('harpoon.ui').nav_file(2)
    end)

    vim.keymap.set('n', 'm3', function()
      require('harpoon.ui').nav_file(3)
    end)

    vim.keymap.set('n', 'm4', function()
      require('harpoon.ui').nav_file(4)
    end)

    vim.keymap.set('n', 'm5', function()
      require('harpoon.ui').nav_file(5)
    end)

    vim.keymap.set('n', 'm6', function()
      require('harpoon.ui').nav_file(6)
    end)

    vim.keymap.set('n', 'm7', function()
      require('harpoon.ui').nav_file(7)
    end)

    vim.keymap.set('n', 'm8', function()
      require('harpoon.ui').nav_file(8)
    end)

    vim.keymap.set('n', 'm9', function()
      require('harpoon.ui').nav_file(9)
    end)

    vim.keymap.set('n', 'm0', function()
      require('harpoon.ui').nav_file(10)
    end)

    vim.keymap.set('n', 'mh', function()
      require('harpoon.ui').nav_prev()
    end)

    vim.keymap.set('n', 'ml', function()
      require('harpoon.ui').nav_next()
    end)

    require('telescope').load_extension('harpoon')
  end
}
