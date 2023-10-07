local status, lualine = pcall(require, "lualine")
if not status then
    return
end

local lualine_moonfly = require("lualine.themes.moonfly")

local new_colors = {
    violet = "#FF00FA", 
    black = "000000",
    yellow = "#FFDA7B",
}

lualine_moonfly.visual.a.bg = new_colors.violet
lualine_moonfly.command = {
    a = {
        gui = "bold",
        bg = new_colors.yellow,
        fg = new_colors.black,
    },
}

lualine.setup({
    options = {
        theme = lualine_moonfly
    }
})
