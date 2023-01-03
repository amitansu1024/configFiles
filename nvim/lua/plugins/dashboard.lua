local api = vim.api
local keymap = vim.keymap
local dashboard = require("dashboard")

-- dashboard.custom_header = {
--   "                                                       ",
--   "                                                       ",
--   "                                                       ",
--   " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
--   " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
--   " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
--   " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
--   " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
--   " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
--   "                                                       ",
--   "                                                       ",
--   "                                                       ",
--   "                                                       ",
-- }
local db = require('dashboard')

db.custom_header = {
    '',
    '                                                            ',
    '                     /********&@@@@@@@@/*                   ',
    '                                     .*%##%%%#              ',
    '               *                        *@@@@@@@#           ',
    '             (#%#%#                        .#%##%###        ',
    '            @@@@@@@@@@/                      @@@@@@@@       ',
    '            ,##%##%##%##%#                     #%##%##%/    ',
    '             &@@@@@@@@@@@@@&/////*              @@@@@@@@&   ',
    '              *%##%##%##%##%#(   %##&##          ##%##%###  ',
    '  .            @@@@@@@@@@@@@@@@&/*@@@@@@@/,      @@@@@@@@@. ',
    ' .       %%#%((%##%##%##%##%##%##%%#%##%##%#*/(#, #%##%##%# ',
    ' @       */@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#,   @@@@@@@@@ ',
    ' #             ###%##%##%##%##%##%##%##%##*   *#%#(   ,*(%# ',
    ' @             &@@@@@@@@@@@@@@@@@@@@@@@@@@&  *//&@@%  */&@@ ',
    '  #               ###%##%##%##%##%##%##%##*          .%##%# ',
    '  &#              @@@@@@@@@@@@@@@@@@@@@@@@@@/@@@&/.   %@@@# ',
    '   #%              ##%##%##%##%##%##%##%##%##%##%###  /##/  ',
    '    @@(            @&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   ',
    '      %%#            %##%##%##%##%##%##%##%##%##%##%##(     ',
    '      *@@@&*         @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      ',
    '         *##%%#*       *%##%##%##%##%##%##%##%##%##,        ',
    '           *@@@@@@@&/**  @@@@@@@@@@@@@@@@@@@@@@@%           ',
    '                *#%###/ (##%##%##%##%##%##%#*               ',
    '                   */@@@@@@@@@@@@@@@@@@@**.        ',
    '',
}

dashboard.custom_center = {
  {
    icon = "  ",
    desc = "Recent Session                          ",
    action = "SessionManager load_last_session",
    shortcut = "<Leader> s l",
  },
  {
    icon = "  ",
    desc = "Find  File                              ",
    action = "Telescope find_files",
    shortcut = "<Leader> f f",
  },
  {
    icon = "  ",
    desc = "Recently opened files                   ",
    action = "Telescope oldfiles",
    shortcut = "<Leader> f r",
  },
  {
    icon = "  ",
    desc = "Open Nvim config                        ",
    action = "tabnew $MYVIMRC | tcd %:p:h",
    shortcut = "<Leader> e v",
  },
  {
    icon = "  ",
    desc = "New file                                ",
    action = "enew",
    shortcut = "e          ",
  },
  {
    icon = "  ",
    desc = "Quit Nvim                               ",
    action = ":wqa!",
    shortcut = "<Leader> n q",
  },
}

api.nvim_create_autocmd("FileType", {
  pattern = "dashboard",
  group = api.nvim_create_augroup("dashboard_enter", { clear = true }),
  callback = function ()
    keymap.set("n", "q", ":qa<CR>", { buffer = true, silent = true })
    keymap.set("n", "e", ":enew<CR>", { buffer = true, silent = true })
  end
})
