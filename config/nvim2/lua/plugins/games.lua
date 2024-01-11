return {
  {
    'alec-gibson/nvim-tetris',
    cmd = "Tetris",
    lazy = true
  },
  {
    'seandewar/nvimesweeper',
    cmd = "Nvimesweeper",
    lazy = true
  },
  {
    'jim-fx/sudoku.nvim',
    config = function ()
        require('sudoku').setup {}

    end,
    cmd = "Sudoku",
    lazy = true
  },
}
