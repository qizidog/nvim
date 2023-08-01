return {
  -- move around between tmux pane and vim window
  -- resize window in a more smart and intuitive way

  {
    "mrjones2014/smart-splits.nvim",
    -- make sure to be loaded at the first time
    lazy = false,
    opts = {
      at_edge = "stop",
    },
    config = function(_, opts)
        -- TODO: the move focus keybinds are buggy with different window size
    
        -- change focus window
        vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left, { desc = "Move to left window" })
        vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down, { desc = "Move to down window" })
        vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up, { desc = "Move to up window" })
        vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right, { desc = "Move to right window" })
    
        -- resize window
        vim.keymap.set("n", "<C-Left>", require("smart-splits").resize_left, { desc = "smart resize left" })
        vim.keymap.set("n", "<C-Down>", require("smart-splits").resize_down, { desc = "smart resize down" })
        vim.keymap.set("n", "<C-Up>", require("smart-splits").resize_up, { desc = "smart resize up" })
        vim.keymap.set("n", "<C-Right>", require("smart-splits").resize_right, { desc = "smart resize right" })

	require('smart-splits').setup(opts)
    end,
    --[[
    keys = {
      {
        "<C-h>",
        function()
          require("smart-splits").move_cursor_left()
        end,
        desc = "Move to left window",
      },
      {
        "<C-j>",
        function()
          require("smart-splits").move_cursor_down()
        end,
        desc = "Move to down window",
      },
      {
        "<C-k>",
        function()
          require("smart-splits").move_cursor_up()
        end,
        desc = "Move to up window",
      },
      {
        "<C-l>",
        function()
          require("smart-splits").move_cursor_right()
        end,
        desc = "Move to right window",
      },
    },
    --]]
  },
}
