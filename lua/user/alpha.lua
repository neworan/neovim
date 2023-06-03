local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
[[      ___                       ___           ___           ___           ___           ___     ]],
[[     /\__\          ___        /\__\         /\  \         |\__\         /\  \         /\__\    ]],
[[    /::|  |        /\  \      /::|  |       /::\  \        |:|  |       /::\  \       /::|  |   ]],
[[   /:|:|  |        \:\  \    /:|:|  |      /:/\:\  \       |:|  |      /:/\:\  \     /:|:|  |   ]],
[[  /:/|:|__|__      /::\__\  /:/|:|  |__   /:/  \:\  \      |:|__|__   /::\~\:\  \   /:/|:|  |__ ]],
[[ /:/ |::::\__\  __/:/\/__/ /:/ |:| /\__\ /:/__/_\:\__\     /::::\__\ /:/\:\ \:\__\ /:/ |:| /\__\]],
[[ \/__/~~/:/  / /\/:/  /    \/__|:|/:/  / \:\  /\ \/__/    /:/~~/~    \/__\:\/:/  / \/__|:|/:/  /]],
[[       /:/  /  \::/__/         |:/:/  /   \:\ \:\__\     /:/  /           \::/  /      |:/:/  / ]],
[[      /:/  /    \:\__\         |::/  /     \:\/:/  /     \/__/            /:/  /       |::/  /  ]],
[[     /:/  /      \/__/         /:/  /       \::/  /                      /:/  /        /:/  /   ]],
[[     \/__/                     \/__/         \/__/                       \/__/         \/__/    ]],
}
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
-- NOTE: requires the fortune-mod package to work
	-- local handle = io.popen("fortune")
	-- local fortune = handle:read("*a")
	-- handle:close()
	-- return fortune
	return "iMac"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)

--           .         .                                                                                                        
--          ,8.       ,8.           8 8888 b.             8     ,o888888o.  `8.`8888.      ,8'    .8.          b.             8 
--         ,888.     ,888.          8 8888 888o.          8    8888     `88. `8.`8888.    ,8'    .888.         888o.          8 
--        .`8888.   .`8888.         8 8888 Y88888o.       8 ,8 8888       `8. `8.`8888.  ,8'    :88888.        Y88888o.       8 
--       ,8.`8888. ,8.`8888.        8 8888 .`Y888888o.    8 88 8888            `8.`8888.,8'    . `88888.       .`Y888888o.    8 
--      ,8'8.`8888,8^8.`8888.       8 8888 8o. `Y888888o. 8 88 8888             `8.`88888'    .8. `88888.      8o. `Y888888o. 8 
--     ,8' `8.`8888' `8.`8888.      8 8888 8`Y8o. `Y88888o8 88 8888              `8. 8888    .8`8. `88888.     8`Y8o. `Y88888o8 
--    ,8'   `8.`88'   `8.`8888.     8 8888 8   `Y8o. `Y8888 88 8888   8888888     `8 8888   .8' `8. `88888.    8   `Y8o. `Y8888 
--   ,8'     `8.`'     `8.`8888.    8 8888 8      `Y8o. `Y8 `8 8888       .8'      8 8888  .8'   `8. `88888.   8      `Y8o. `Y8 
--  ,8'       `8        `8.`8888.   8 8888 8         `Y8o.`    8888     ,88'       8 8888 .888888888. `88888.  8         `Y8o.` 
-- ,8'         `         `8.`8888.  8 8888 8            `Yo     `8888888P'         8 8888.8'       `8. `88888. 8            `Yo

--  ▄▄       ▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄        ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄         ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄        ▄ 
-- ▐░░▌     ▐░░▌▐░░░░░░░░░░░▌▐░░▌      ▐░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░░▌      ▐░▌
-- ▐░▌░▌   ▐░▐░▌ ▀▀▀▀█░█▀▀▀▀ ▐░▌░▌     ▐░▌▐░█▀▀▀▀▀▀▀▀▀ ▐░▌       ▐░▌▐░█▀▀▀▀▀▀▀█░▌▐░▌░▌     ▐░▌
-- ▐░▌▐░▌ ▐░▌▐░▌     ▐░▌     ▐░▌▐░▌    ▐░▌▐░▌          ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌▐░▌    ▐░▌
-- ▐░▌ ▐░▐░▌ ▐░▌     ▐░▌     ▐░▌ ▐░▌   ▐░▌▐░▌ ▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄█░▌▐░▌ ▐░▌   ▐░▌
-- ▐░▌  ▐░▌  ▐░▌     ▐░▌     ▐░▌  ▐░▌  ▐░▌▐░▌▐░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌  ▐░▌  ▐░▌
-- ▐░▌   ▀   ▐░▌     ▐░▌     ▐░▌   ▐░▌ ▐░▌▐░▌ ▀▀▀▀▀▀█░▌ ▀▀▀▀█░█▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌▐░▌   ▐░▌ ▐░▌
-- ▐░▌       ▐░▌     ▐░▌     ▐░▌    ▐░▌▐░▌▐░▌       ▐░▌     ▐░▌     ▐░▌       ▐░▌▐░▌    ▐░▌▐░▌
-- ▐░▌       ▐░▌ ▄▄▄▄█░█▄▄▄▄ ▐░▌     ▐░▐░▌▐░█▄▄▄▄▄▄▄█░▌     ▐░▌     ▐░▌       ▐░▌▐░▌     ▐░▐░▌
-- ▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░▌      ▐░░▌▐░░░░░░░░░░░▌     ▐░▌     ▐░▌       ▐░▌▐░▌      ▐░░▌
--  ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀        ▀▀  ▀▀▀▀▀▀▀▀▀▀▀       ▀       ▀         ▀  ▀        ▀▀ 

-- [[           _____                    _____                    _____                    _____                _____                    _____                    _____         ]], 
-- [[         /\    \                  /\    \                  /\    \                  /\    \              |\    \                  /\    \                  /\    \         ]],
-- [[        /::\____\                /::\    \                /::\____\                /::\    \             |:\____\                /::\    \                /::\____\        ]],
-- [[       /::::|   |                \:::\    \              /::::|   |               /::::\    \            |::|   |               /::::\    \              /::::|   |        ]],
-- [[      /:::::|   |                 \:::\    \            /:::::|   |              /::::::\    \           |::|   |              /::::::\    \            /:::::|   |        ]],
-- [[     /::::::|   |                  \:::\    \          /::::::|   |             /:::/\:::\    \          |::|   |             /:::/\:::\    \          /::::::|   |        ]],
-- [[    /:::/|::|   |                   \:::\    \        /:::/|::|   |            /:::/  \:::\    \         |::|   |            /:::/__\:::\    \        /:::/|::|   |        ]],
-- [[   /:::/ |::|   |                   /::::\    \      /:::/ |::|   |           /:::/    \:::\    \        |::|   |           /::::\   \:::\    \      /:::/ |::|   |        ]],
-- [[  /:::/  |::|___|______    ____    /::::::\    \    /:::/  |::|   | _____    /:::/    / \:::\    \       |::|___|______    /::::::\   \:::\    \    /:::/  |::|   | _____  ]],
-- [[ /:::/   |::::::::\    \  /\   \  /:::/\:::\    \  /:::/   |::|   |/\    \  /:::/    /   \:::\ ___\      /::::::::\    \  /:::/\:::\   \:::\    \  /:::/   |::|   |/\    \ ]],
-- [[/:::/    |:::::::::\____\/::\   \/:::/  \:::\____\/:: /    |::|   /::\____\/:::/____/  ___\:::|    |    /::::::::::\____\/:::/  \:::\   \:::\____\/:: /    |::|   /::\____\]],
-- [[\::/    / ~~~~~/:::/    /\:::\  /:::/    \::/    /\::/    /|::|  /:::/    /\:::\    \ /\  /:::|____|   /:::/~~~~/~~      \::/    \:::\  /:::/    /\::/    /|::|  /:::/    /]],
-- [[ \/____/      /:::/    /  \:::\/:::/    / \/____/  \/____/ |::| /:::/    /  \:::\    /::\ \::/    /   /:::/    /          \/____/ \:::\/:::/    /  \/____/ |::| /:::/    / ]],
-- [[             /:::/    /    \::::::/    /                   |::|/:::/    /    \:::\   \:::\ \/____/   /:::/    /                    \::::::/    /           |::|/:::/    /  ]],
-- [[            /:::/    /      \::::/____/                    |::::::/    /      \:::\   \:::\____\    /:::/    /                      \::::/    /            |::::::/    /   ]],
-- [[           /:::/    /        \:::\    \                    |:::::/    /        \:::\  /:::/    /    \::/    /                       /:::/    /             |:::::/    /    ]],
-- [[          /:::/    /          \:::\    \                   |::::/    /          \:::\/:::/    /      \/____/                       /:::/    /              |::::/    /     ]],
-- [[         /:::/    /            \:::\    \                  /:::/    /            \::::::/    /                                    /:::/    /               /:::/    /      ]],
-- [[        /:::/    /              \:::\____\                /:::/    /              \::::/    /                                    /:::/    /               /:::/    /       ]],
-- [[        \::/    /                \::/    /                \::/    /                \::/____/                                     \::/    /                \::/    /        ]],
-- [[         \/____/                  \/____/                  \/____/                                                                \/____/                  \/____/         ]],
-- }
  --
        --                                                                                  
        --        .-=====-:                         :--::....       .-====--:                
        -- :::. -#%##+:*%###+.                   :+%%#*-.-+=---:  -*%%%*-#%##*-              
        -- -=--=#%%*:  +%#####=                :#%%#:++:  **======%@%#:  +*+####-            
        --  :+=-=+*+.  +#=.+###*.             =#%#*  ==:  +=. =+==+##*.  +=:.*#%#=           
        --  =%#+==+=.  +*=  =%%%#:          .*####+  ==:  **..#%*+==+=   ==.  *#%%*.         
        -- =%%%--+++=  =*=  :*#%%%=        :***=+#+  ==.  #*-%%%%==+++:  ==.  +#%%%#:        
        -- +%#:  .+***.=+-  :+=+%%%*.     =*%#- +#+  +*-  ##%%%#:  =***= ++:  =++*%%%-       
        -- +#:     =*****-  :=- -#%%#:  .+**#=  =*+  +*-  ##%%+     :***+**:  ==- *%%%=      
        -- =.       =####=  :*+  .#%%%+-+++*#=  =+-  +*- +%%#=       .*##**:  +*+  -%%%*.    
        --           -###*. :#*   +#%%%%*+=:+-  =+-  +#=*%%#:          +###+. +#+   +#%%%.   
        --            :#%%#-:#*   +#*#%%%#:.+-  =+=  *##%%*.            -##%#:+#*   ==*%%-   
        --              +%%%*##   +#+=+%@@%#*-  =*= :#%##-               .*%%%*#*   +=+*#-   
        --               :*%%#*..-+*+-. -#@@@#=:+#+*##*:                   -#%%#*..:+++=:    
        --                 .=+**=-::.      -+*##***+-.                       :+*#*+=-:.      
        --                                                                                  