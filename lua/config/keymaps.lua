-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- This file is automatically loaded by lazyvim.config.init

-- DO NOT USE `LazyVim.safe_keymap_set` IN YOUR OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = vim.keymap.set

-- buffers
map("n", "åb", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "äb", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- diagnostic
local diagnostic_goto = function(next, severity)
  ---@diagnostic disable-next-line: deprecated
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
map("n", "äd", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "åd", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "äe", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "åe", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "äw", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "åw", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- tabs
map("n", "<leader><tab>ä", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>å", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
