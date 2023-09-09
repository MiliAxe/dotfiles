local dashboard = require("alpha.themes.dashboard")
local logo = [[

███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

    ]]

local function getGreeting(name)
    local tableTime = os.date("*t")
    local datetime = os.date(" %Y-%m-%d   %H:%M:%S")
    local hour = tableTime.hour
    local greetingsTable = {
        [1] = "  Sleep well",
        [2] = "  Good morning",
        [3] = "  Good afternoon",
        [4] = "  Good evening",
        [5] = "󰖔  Good night",
    }
    local greetingIndex = 0
    if hour == 23 or hour < 7 then
        greetingIndex = 1
    elseif hour < 12 then
        greetingIndex = 2
    elseif hour >= 12 and hour < 18 then
        greetingIndex = 3
    elseif hour >= 18 and hour < 21 then
        greetingIndex = 4
    elseif hour >= 21 then
        greetingIndex = 5
    end
    return " " .. datetime .. "\t" .. greetingsTable[greetingIndex] .. ", " .. name
end

local userName = "Mili"
local greeting = getGreeting(userName)
dashboard.section.header.val = vim.split(logo .. "\n" .. greeting, "\n")
dashboard.section.buttons.val = {
    dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
    dashboard.button("g", "󰷾 " .. " Find text", ":Telescope live_grep <CR>"),
    dashboard.button("b", " " .. " File browser", ":Joshuto <CR>"),
    dashboard.button("r", "󰄉 " .. " Recent files", ":Telescope oldfiles <CR>"),
    dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
    dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
    dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}

-- set highlight
for _, button in ipairs(dashboard.section.buttons.val) do
    button.opts.hl = "AlphaButtons"
    button.opts.hl_shortcut = "AlphaShortcut"
end
dashboard.opts.layout[1].val = 8

require("alpha").setup(dashboard.opts)
