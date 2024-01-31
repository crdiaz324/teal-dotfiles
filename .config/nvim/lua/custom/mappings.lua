local M = {}

M.general = {
  v = {
    ["J"] = {
      ":m '>+1<CR>gv=gv",
      "Move visual selection down", 
      opts = {nowait = true}},
    ["K"] = {":m '<-2<CR>gv=gv",
      "Move visual selection up",
      opts = {nowait = true}},
    ["gc"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
    ["<leader>d"] = {
      "\"_d",
    },
  },
  n = {
    ["gc"] = {
      function ()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
    ["<c-i>"] = {
      function ()
        require("nvterm.terminal").toggle "float"
      end,
      "Toggle floating term",
    },
  },
}

M.dap = {
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Toggle Breakpoint"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "Update crates"
    }
  }
}
return M
