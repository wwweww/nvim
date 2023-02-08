local db = require("dashboard")

local custom_center = {
     {icon = "    ", desc = 'find files ', action = 'Telescope find_files' ,},
     {icon = "    ", desc = 'oldfiles   ', action = 'Telescope oldfiles'   ,},
     {icon = "    ", desc = 'colorscheme', action = 'Telescope colorscheme',},
}

local custom_header  = {
'',
'',
'',
'          _____                    _____                    _____                    _____                    _____          ',
'         /\\    \\                  /\\    \\                  /\\    \\                  /\\    \\                  /\\    \\         ',
'        /::\\    \\                /::\\    \\                /::\\    \\                /::\\    \\                /::\\    \\        ',
'       /::::\\    \\              /::::\\    \\              /::::\\    \\              /::::\\    \\               \\:::\\    \\       ',
'      /::::::\\    \\            /::::::\\    \\            /::::::\\    \\            /::::::\\    \\               \\:::\\    \\      ',
'     /:::/\\:::\\    \\          /:::/\\:::\\    \\          /:::/\\:::\\    \\          /:::/\\:::\\    \\               \\:::\\    \\     ',
'    /:::/__\\:::\\    \\        /:::/__\\:::\\    \\        /:::/__\\:::\\    \\        /:::/  \\:::\\    \\               \\:::\\    \\    ',
'   /::::\\   \\:::\\    \\       \\:::\\   \\:::\\    \\      /::::\\   \\:::\\    \\      /:::/    \\:::\\    \\               \\:::\\    \\   ',
'  /::::::\\   \\:::\\    \\    ___\\:::\\   \\:::\\    \\    /::::::\\   \\:::\\    \\    /:::/    / \\:::\\    \\               \\:::\\    \\  ',
' /:::/\\:::\\   \\:::\\    \\  /\\   \\:::\\   \\:::\\    \\  /:::/\\:::\\   \\:::\\    \\  /:::/    /   \\:::\\ ___\\               \\:::\\    \\ ',
'/:::/  \\:::\\   \\:::\\____\\/::\\   \\:::\\   \\:::\\____\\/:::/  \\:::\\   \\:::\\____\\/:::/____/     \\:::|    |_______________\\:::\\____\\',
'\\::/    \\:::\\  /:::/    /\\:::\\   \\:::\\   \\::/    /\\::/    \\:::\\  /:::/    /\\:::\\    \\     /:::|____|\\::::::::::::::::::/    /',
' \\/____/ \\:::\\/:::/    /  \\:::\\   \\:::\\   \\/____/  \\/____/ \\:::\\/:::/    /  \\:::\\    \\   /:::/    /  \\::::::::::::::::/____/ ',
'          \\::::::/    /    \\:::\\   \\:::\\    \\               \\::::::/    /    \\:::\\    \\ /:::/    /    \\:::\\~~~~\\~~~~~~       ',
'           \\::::/    /      \\:::\\   \\:::\\____\\               \\::::/    /      \\:::\\    /:::/    /      \\:::\\    \\            ',
'           /:::/    /        \\:::\\  /:::/    /               /:::/    /        \\:::\\  /:::/    /        \\:::\\    \\           ',
'          /:::/    /          \\:::\\/:::/    /               /:::/    /          \\:::\\/:::/    /          \\:::\\    \\          ',
'         /:::/    /            \\::::::/    /               /:::/    /            \\::::::/    /            \\:::\\    \\         ',
'        /:::/    /              \\::::/    /               /:::/    /              \\::::/    /              \\:::\\____\\        ',
'        \\::/    /                \\::/    /                \\::/    /                \\::/____/                \\::/    /        ',
'         \\/____/                  \\/____/                  \\/____/                  ~~                       \\/____/         ',
'',
'',
'',
'',
'',
'',
'',
		-- [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
		-- [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⣠⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
		-- [[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣡⣾⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣟⠻⣿⣿⣿⣿⣿⣿⣿⣿]],
		-- [[⣿⣿⣿⣿⣿⣿⣿⣿⡿⢫⣷⣿⣿⣿⣿⣿⣿⣿⣾⣯⣿⡿⢧⡚⢷⣌⣽⣿⣿⣿⣿⣿⣶⡌⣿⣿⣿⣿⣿⣿]],
		-- [[⣿⣿⣿⣿⣿⣿⣿⣿⠇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣮⣇⣘⠿⢹⣿⣿⣿⣿⣿⣻⢿⣿⣿⣿⣿⣿]],
		-- [[⣿⣿⣿⣿⣿⣿⣿⣿⠀⢸⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⡟⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣻⣿⣿⣿⣿]],
		-- [[⣿⣿⣿⣿⣿⣿⣿⡇⠀⣬⠏⣿⡇⢻⣿⣿⣿⣿⣿⣿⣿⣷⣼⣿⣿⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣿⣿⣿⣿]],
		-- [[⣿⣿⣿⣿⣿⣿⣿⠀⠈⠁⠀⣿⡇⠘⡟⣿⣿⣿⣿⣿⣿⣿⣿⡏⠿⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⣇⣿⣿⣿⣿]],
		-- [[⣿⣿⣿⣿⣿⣿⡏⠀⠀⠐⠀⢻⣇⠀⠀⠹⣿⣿⣿⣿⣿⣿⣩⡶⠼⠟⠻⠞⣿⡈⠻⣟⢻⣿⣿⣿⣿⣿⣿⣿]],
		-- [[⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⢿⠀⡆⠀⠘⢿⢻⡿⣿⣧⣷⢣⣶⡃⢀⣾⡆⡋⣧⠙⢿⣿⣿⣟⣿⣿⣿⣿]],
		-- [[⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⡥⠂⡐⠀⠁⠑⣾⣿⣿⣾⣿⣿⣿⡿⣷⣷⣿⣧⣾⣿⣿⣿⣿⣿⣿⣿]],
		-- [[⣿⣿⡿⣿⣍⡴⠆⠀⠀⠀⠀⠀⠀⠀⠀⣼⣄⣀⣷⡄⣙⢿⣿⣿⣿⣿⣯⣶⣿⣿⢟⣾⣿⣿⢡⣿⣿⣿⣿⣿]],
		-- [[⣿⡏⣾⣿⣿⣿⣷⣦⠀⠀⠀⢀⡀⠀⠀⠠⣭⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⣡⣾⣿⣿⢏⣾⣿⣿⣿⣿⣿]],
		-- [[⣿⣿⣿⣿⣿⣿⣿⣿⡴⠀⠀⠀⠀⠀⠠⠀⠰⣿⣿⣿⣷⣿⠿⠿⣿⣿⣭⡶⣫⠔⢻⢿⢇⣾⣿⣿⣿⣿⣿⣿]],
		-- [[⣿⣿⣿⡿⢫⣽⠟⣋⠀⠀⠀⠀⣶⣦⠀⠀⠀⠈⠻⣿⣿⣿⣾⣿⣿⣿⣿⡿⣣⣿⣿⢸⣾⣿⣿⣿⣿⣿⣿⣿]],
		-- [[⡿⠛⣹⣶⣶⣶⣾⣿⣷⣦⣤⣤⣀⣀⠀⠀⠀⠀⠀⠀⠉⠛⠻⢿⣿⡿⠫⠾⠿⠋⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
		-- [[⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣀⡆⣠⢀⣴⣏⡀⠀⠀⠀⠉⠀⠀⢀⣠⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
		-- [[⠿⠛⠛⠛⠛⠛⠛⠻⢿⣿⣿⣿⣿⣯⣟⠷⢷⣿⡿⠋⠀⠀⠀⠀⣵⡀⢠⡿⠋⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
		-- [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⢿⣿⣿⠂⠀⠀⠀⠀⠀⢀⣽⣿⣿⣿⣿⣿⣿⣿⣍⠛⠿⣿⣿⣿⣿⣿⣿]],
}
db.setup({
     theme = 'doom',
     config = {
          header = custom_header,
          center = custom_center,
     }
})
