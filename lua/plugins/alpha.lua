return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    local logo = [[
   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
                     [ karlnyren ]
    ]]

    opts.section.header.val = vim.split(logo, "\n")
    opts.section.buttons.val = {
      opts.button("f", " " .. " Find file", "<cmd> lua LazyVim.pick()() <cr>"),
      opts.button("n", " " .. " New file", [[<cmd> ene <BAR> startinsert <cr>]]),
      opts.button("r", " " .. " Recent files", [[<cmd> lua LazyVim.pick("oldfiles")() <cr>]]),
      opts.button("g", " " .. " Find text", [[<cmd> lua LazyVim.pick("live_grep")() <cr>]]),
      opts.button("c", " " .. " Config", "<cmd> lua LazyVim.pick.config_files()() <cr>"),
      opts.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
      opts.button("x", " " .. " Lazy Extras", "<cmd> LazyExtras <cr>"),
      opts.button("l", "󰒲 " .. " Lazy", "<cmd> Lazy <cr>"),
      opts.button("q", " " .. " Quit", "<cmd> qa <cr>"),
    }
    for _, button in ipairs(opts.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end
    opts.section.header.opts.hl = "AlphaHeader"
    opts.section.buttons.opts.hl = "AlphaButtons"
    opts.section.footer.opts.hl = "AlphaFooter"
    opts.opts.layout[1].val = 8
    return opts
  end,
}
