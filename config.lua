Config = {}

Config.PriceRental   = 50000      -- How much rental of a Motel Room apartment is - 0 = Free.
Config.Tax           = 5000
Config.Locale        = 'en'    -- Only defaultly supports English, feel free to add addtional language support.
Config.MaxSlot       = 2

Config.RoomMarker = {
   Owned = {r = 255, g = 0, b = 0},     -- Owned Motel Color
	x = 0.5, y = 0.5, z = 0.7  -- Standard Size Circle
}

Config.Zones = {
   PinkCage = {
      Name = "Rusun",
      Pos = {x = 324.55, y = -212.44, z = 54.15, color = 3, sprite = 475, size = 0.8},
      Boundries = 28.0, -- The Boundry Radius of the Motel (Will check ownerships etc.. if player is within this radius)
      Rooms = {
         Room1 = {
            number = 1,
            instancename = "pcm1",
            entry = {x = 312.83, y = -218.79, z = 54.22},
            roomExit = {x = 306.28, y = -213.64, z = 46.4 }, -- The Exit marker of the room, usually the only door hehe
            roomLoc = {x = 306.28, y = -213.64, z = 46.4 }, -- Where you will spawn IN the motel room
            BedStash = {x = 303.04, y = -209.2, z = 46.4},  -- The Secret Stash Location of the Bed
            Inventory = {x = 300.36, y = -211.04, z = 46.4},  -- The Inventory of the Room Main Storage
            Menu = {x = 301.84, y = -212.04, z = 46.4}, -- Room Options Menu
         },

         Room2 = {
            number = 2,
            instancename = "pcm2",
            entry = {x = 310.9, y = -217.97, z = 54.22},
            roomExit = {x = 310.44, y = -202.88, z = 46.4 }, -- The Exit marker of the room, usually the only door hehe
            roomLoc = {x = 310.44, y = -202.88, z = 46.4 }, -- Where you will spawn IN the motel room
            BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
            Inventory = {x = 304.36, y = -200.2, z = 46.4},  -- The Inventory of the Room Main Storage
            Menu = {x = 305.72, y = -201.24, z = 46.4}, -- Room Options Menu
         },

            Room3 = {
               number = 3,
               instancename = "pcm3",
               entry = {x = 307.24, y = -216.69, z = 54.22},
               roomExit = {x = 314.08, y = -192.8, z = 46.4 }, -- The Exit marker of the room, usually the only door hehe
            roomLoc = {x = 314.08, y = -192.8, z = 46.4 }, -- Where you will spawn IN the motel room
            BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
            Inventory = {x = 307.96, y = -190.12, z = 46.4},  -- The Inventory of the Room Main Storage
            Menu = {x = 309.4, y = -191.16, z = 46.4}, -- Room Options Menu
         },

            Room4 = {
               number = 4,
               instancename = "pcm4",
               entry = {x = 307.58, y = -213.3, z = 54.22},
               roomExit = {x = 346.12, y = -202.48, z = 46.4 }, -- The Exit marker of the room, usually the only door hehe
            roomLoc = {x = 346.12, y = -202.48, z = 46.4 }, -- Where you will spawn IN the motel room
            BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
            Inventory = {x = 352.28, y = -205.16, z = 46.4},  -- The Inventory of the Room Main Storage
            Menu = {x = 350.8, y = -204.08, z = 46.4}, -- Room Options Menu
         },

            Room5 = {
               number = 5,
               instancename = "pcm5",
               entry = {x = 309.51, y = -207.92, z = 54.22},
               roomExit = {x = 341.24, y = -215.96, z = 46.4 }, -- The Exit marker of the room, usually the only door hehe
            roomLoc = {x = 341.24, y = -215.96, z = 46.4 }, -- Where you will spawn IN the motel room
            BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
            Inventory = {x = 347.36, y = -218.56, z = 46.4},  -- The Inventory of the Room Main Storage
            Menu = {x = 345.88, y = -217.56, z = 46.4}, -- Room Options Menu
         },

            Room5a = {
               number = "5a",
               instancename = "pcm5a",
               entry = {x = 311.27, y = -203.33, z = 54.22},
               roomExit = {x = 335.64, y = -225.56, z = 46.4 }, -- The Exit marker of the room, usually the only door hehe
            roomLoc = {x = 335.64, y = -225.56, z = 46.4 }, -- Where you will spawn IN the motel room
            BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
            Inventory = {x = 341.76, y = -228.16, z = 46.4},  -- The Inventory of the Room Main Storage
            Menu = {x = 340.32, y = -227.08, z = 46.4}, -- Room Options Menu
         },

            Room6 = {
               number = 6,
               instancename = "pcm6",
               entry = {x = 313.36, y = -198.07, z = 54.22},
               roomExit = {x = 335.64, y = -225.52, z = 37.0 }, -- The Exit marker of the room, usually the only door hehe
            roomLoc = {x = 335.64, y = -225.52, z = 37.0 }, -- Where you will spawn IN the motel room
            BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
            Inventory = {x = 341.76, y = -228.12, z = 37.0},  -- The Inventory of the Room Main Storage
            Menu = {x = 340.28, y = -227.12, z = 37.0}, -- Room Options Menu
         },

            Room7 = {
               number = 7,
               instancename = "pcm7",
               entry = {x = 315.77, y = -194.82, z = 54.22},
               roomExit = {x = 339.52, y = -214.76, z = 37.0 }, -- The Exit marker of the room, usually the only door hehe
            roomLoc = {x = 339.52, y = -214.76, z = 37.0 }, -- Where you will spawn IN the motel room
            BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
            Inventory = {x = 345.68, y = -217.44, z = 37.0},  -- The Inventory of the Room Main Storage
            Menu = {x = 344.24, y = -216.36, z = 37.0}, -- Room Options Menu
         },

            Room8 = {
               number = 8,
               instancename = "pcm8",
               entry = {x = 319.4, y = -196.21, z = 54.22},
               roomExit = {x = 344.16, y = -202.32, z = 37.0 }, -- The Exit marker of the room, usually the only door hehe
            roomLoc = {x = 344.16, y = -202.32, z = 37.0 }, -- Where you will spawn IN the motel room
            BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
            Inventory = {x = 350.24, y = -204.84, z = 37.0},  -- The Inventory of the Room Main Storage
            Menu = {x = 348.84, y = -203.84, z = 37.0}, -- Room Options Menu
         },

            Room9 = {
               number = 9,
               instancename = "pcm9",
               entry = {x = 321.44, y = -196.99, z = 54.22},
               roomExit = {x = 306.48, y = -213.68, z = 37.2 }, -- The Exit marker of the room, usually the only door hehe
            roomLoc = {x = 306.48, y = -213.68, z = 37.2 }, -- Where you will spawn IN the motel room
            BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
            Inventory = {x = 300.32, y = -211.04, z = 37.2},  -- The Inventory of the Room Main Storage
            Menu = {x = 301.8, y = -212.04, z = 37.2}, -- Room Options Menu
         },

            Room11 = {
               number = 11,
               instancename = "pcm11",
               entry = {x = 312.83, y = -218.79, z = 58.02},
               roomExit = {x = 310.52, y = -202.64, z = 37.2 }, -- The Exit marker of the room, usually the only door hehe
            roomLoc = {x = 310.52, y = -202.64, z = 37.2 }, -- Where you will spawn IN the motel room
            BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
            Inventory = {x = 304.28, y = -199.92, z = 37.2},  -- The Inventory of the Room Main Storage
            Menu = {x = 305.8, y = -200.96, z = 37.2}, -- Room Options Menu
         },

         Room12 = {
               number = 12,
               instancename = "pcm12",
               entry = {x = 310.9, y = -217.97, z = 58.02},
               roomExit = {x = 314.44, y = -191.76, z = 37.2 }, -- The Exit marker of the room, usually the only door hehe
            roomLoc = {x = 314.44, y = -191.76, z = 37.2 }, -- Where you will spawn IN the motel room
            BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
            Inventory = {x = 308.32, y = -189.08, z = 37.2},  -- The Inventory of the Room Main Storage
            Menu = {x = 309.76, y = -190.16, z = 37.2}, -- Room Options Menu
         },
         --batas mod
            Room13 = {
               number = 13,
               instancename = "pcm13",
               entry = {x = 307.24, y = -216.69, z = 58.02},
               roomExit = {x = 306.28, y = -213.64, z = 46.4 }, -- The Exit marker of the room, usually the only door hehe
               roomLoc = {x = 306.28, y = -213.64, z = 46.4 }, -- Where you will spawn IN the motel room
               BedStash = {x = 303.04, y = -209.2, z = 46.4},  -- The Secret Stash Location of the Bed
               Inventory = {x = 300.36, y = -211.04, z = 46.4},  -- The Inventory of the Room Main Storage
               Menu = {x = 301.84, y = -212.04, z = 46.4}, -- Room Options Menu
            },

            Room14 = {
               number = 14,
               instancename = "pcm14",
               entry = {x = 307.58, y = -213.3, z = 58.02},
               roomExit = {x = 310.44, y = -202.88, z = 46.4 }, -- The Exit marker of the room, usually the only door hehe
            roomLoc = {x = 310.44, y = -202.88, z = 46.4 }, -- Where you will spawn IN the motel room
            BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
            Inventory = {x = 304.36, y = -200.2, z = 46.4},  -- The Inventory of the Room Main Storage
            Menu = {x = 305.72, y = -201.24, z = 46.4}, -- Room Options Menu
         },

            Room15 = {
               number = 15,
               instancename = "pcm15",
               entry = {x = 309.51, y = -207.92, z = 58.02},
               roomExit = {x = 314.08, y = -192.8, z = 46.4 }, -- The Exit marker of the room, usually the only door hehe
               roomLoc = {x = 314.08, y = -192.8, z = 46.4 }, -- Where you will spawn IN the motel room
               BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
               Inventory = {x = 307.96, y = -190.12, z = 46.4},  -- The Inventory of the Room Main Storage
               Menu = {x = 309.4, y = -191.16, z = 46.4}, -- Room Options Menu
            },

            Room16 = {
               number = 16,
               instancename = "pcm16",
               entry = {x = 311.27, y = -203.33, z = 58.02},
               roomExit = {x = 346.12, y = -202.48, z = 46.4 }, -- The Exit marker of the room, usually the only door hehe
               roomLoc = {x = 346.12, y = -202.48, z = 46.4 }, -- Where you will spawn IN the motel room
               BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
               Inventory = {x = 352.28, y = -205.16, z = 46.4},  -- The Inventory of the Room Main Storage
               Menu = {x = 350.8, y = -204.08, z = 46.4}, -- Room Options Menu
            },

            Room17 = {
               number = 17,
               instancename = "pcm17",
               entry = {x = 313.36, y = -198.07, z = 58.02},
               roomExit = {x = 341.24, y = -215.96, z = 46.4 }, -- The Exit marker of the room, usually the only door hehe
               roomLoc = {x = 341.24, y = -215.96, z = 46.4 }, -- Where you will spawn IN the motel room
               BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
               Inventory = {x = 347.36, y = -218.56, z = 46.4},  -- The Inventory of the Room Main Storage
               Menu = {x = 345.88, y = -217.56, z = 46.4}, -- Room Options Menu
            },

            Room18 = {
               number = 18,
               instancename = "pcm18",
               entry = {x = 315.77, y = -194.82, z = 58.02},
               roomExit = {x = 335.64, y = -225.56, z = 46.4 }, -- The Exit marker of the room, usually the only door hehe
            roomLoc = {x = 335.64, y = -225.56, z = 46.4 }, -- Where you will spawn IN the motel room
            BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
            Inventory = {x = 341.76, y = -228.16, z = 46.4},  -- The Inventory of the Room Main Storage
            Menu = {x = 340.32, y = -227.08, z = 46.4}, -- Room Options Menu
         },

            Room19 = {
               number = 19,
               instancename = "pcm19",
               entry = {x = 319.4, y = -196.21, z = 58.02},
               roomExit = {x = 335.64, y = -225.52, z = 37.0 }, -- The Exit marker of the room, usually the only door hehe
            roomLoc = {x = 335.64, y = -225.52, z = 37.0 }, -- Where you will spawn IN the motel room
            BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
            Inventory = {x = 341.76, y = -228.12, z = 37.0},  -- The Inventory of the Room Main Storage
            Menu = {x = 340.28, y = -227.12, z = 37.0}, -- Room Options Menu
         },

            Room20 = {
               number = 20,
               instancename = "pcm20",
               entry = {x = 321.44, y = -196.99, z = 58.02},
               roomExit = {x = 339.52, y = -214.76, z = 37.0 }, -- The Exit marker of the room, usually the only door hehe
            roomLoc = {x = 339.52, y = -214.76, z = 37.0 }, -- Where you will spawn IN the motel room
            BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
            Inventory = {x = 345.68, y = -217.44, z = 37.0},  -- The Inventory of the Room Main Storage
            Menu = {x = 344.24, y = -216.36, z = 37.0}, -- Room Options Menu
         },

            -- Left Side

            Room21 = {
               number = 21,
               instancename = "pcm21",
               entry = {x = 329.43, y = -225.02, z = 54.22},
               roomExit = {x = 344.16, y = -202.32, z = 37.0 }, -- The Exit marker of the room, usually the only door hehe
            roomLoc = {x = 344.16, y = -202.32, z = 37.0 }, -- Where you will spawn IN the motel room
            BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
            Inventory = {x = 350.24, y = -204.84, z = 37.0},  -- The Inventory of the Room Main Storage
            Menu = {x = 348.84, y = -203.84, z = 37.0}, -- Room Options Menu
         },
            Room22 = {
               number = 22,
               instancename = "pcm22",
               entry = {x = 331.44, y = -225.97, z = 54.22},
               roomExit = {x = 306.48, y = -213.68, z = 37.2 }, -- The Exit marker of the room, usually the only door hehe
               roomLoc = {x = 306.48, y = -213.68, z = 37.2 }, -- Where you will spawn IN the motel room
               BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
               Inventory = {x = 300.32, y = -211.04, z = 37.2},  -- The Inventory of the Room Main Storage
               Menu = {x = 301.8, y = -212.04, z = 37.2}, -- Room Options Menu
            },
            Room23 = {
               number = 23,
               instancename = "pcm23",
               entry = {x = 334.97, y = -227.36, z = 54.22},
               roomExit = {x = 310.52, y = -202.64, z = 37.2 }, -- The Exit marker of the room, usually the only door hehe
            roomLoc = {x = 310.52, y = -202.64, z = 37.2 }, -- Where you will spawn IN the motel room
            BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
            Inventory = {x = 304.28, y = -199.92, z = 37.2},  -- The Inventory of the Room Main Storage
            Menu = {x = 305.8, y = -200.96, z = 37.2}, -- Room Options Menu
         },
            Room24 = {
               number = 24,
               instancename = "pcm24",
               entry = {x = 337.09, y = -224.81, z = 54.22},
               roomExit = {x = 314.44, y = -191.76, z = 37.2 }, -- The Exit marker of the room, usually the only door hehe
            roomLoc = {x = 314.44, y = -191.76, z = 37.2 }, -- Where you will spawn IN the motel room
            BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
            Inventory = {x = 308.32, y = -189.08, z = 37.2},  -- The Inventory of the Room Main Storage
            Menu = {x = 309.76, y = -190.16, z = 37.2}, -- Room Options Menu
         },
            Room25 = {
               number = 25,
               instancename = "pcm25",
               entry = {x = 339.21, y = -219.45, z = 54.22},
               roomExit = {x = 306.28, y = -213.64, z = 46.4 }, -- The Exit marker of the room, usually the only door hehe
               roomLoc = {x = 306.28, y = -213.64, z = 46.4 }, -- Where you will spawn IN the motel room
               BedStash = {x = 303.04, y = -209.2, z = 46.4},  -- The Secret Stash Location of the Bed
               Inventory = {x = 300.36, y = -211.04, z = 46.4},  -- The Inventory of the Room Main Storage
               Menu = {x = 301.84, y = -212.04, z = 46.4}, -- Room Options Menu
            },
            Room26 = {
               number = 26,
               instancename = "pcm26",
               entry = {x = 340.8, y = -214.89, z = 54.22},
               roomExit = {x = 310.44, y = -202.88, z = 46.4 }, -- The Exit marker of the room, usually the only door hehe
               roomLoc = {x = 310.44, y = -202.88, z = 46.4 }, -- Where you will spawn IN the motel room
               BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
               Inventory = {x = 304.36, y = -200.2, z = 46.4},  -- The Inventory of the Room Main Storage
               Menu = {x = 305.72, y = -201.24, z = 46.4}, -- Room Options Menu
            },
            Room27 = {
               number = 27,
               instancename = "pcm27",
               entry = {x = 342.88, y = -209.6, z = 54.22},
               roomExit = {x = 314.08, y = -192.8, z = 46.4 }, -- The Exit marker of the room, usually the only door hehe
            roomLoc = {x = 314.08, y = -192.8, z = 46.4 }, -- Where you will spawn IN the motel room
            BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
            Inventory = {x = 307.96, y = -190.12, z = 46.4},  -- The Inventory of the Room Main Storage
            Menu = {x = 309.4, y = -191.16, z = 46.4}, -- Room Options Menu
         },
            Room28 = {
               number = 28,
               instancename = "pcm28",
               entry = {x = 344.59, y = -205.01, z = 54.22},
               roomExit = {x = 346.12, y = -202.48, z = 46.4 }, -- The Exit marker of the room, usually the only door hehe
            roomLoc = {x = 346.12, y = -202.48, z = 46.4 }, -- Where you will spawn IN the motel room
            BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
            Inventory = {x = 352.28, y = -205.16, z = 46.4},  -- The Inventory of the Room Main Storage
            Menu = {x = 350.8, y = -204.08, z = 46.4}, -- Room Options Menu
         },
            Room29 = {
               number = 29,
               instancename = "pcm29",
               entry = {x = 346.81, y = -199.73, z = 54.22},
               roomExit = {x = 341.24, y = -215.96, z = 46.4 }, -- The Exit marker of the room, usually the only door hehe
            roomLoc = {x = 341.24, y = -215.96, z = 46.4 }, -- Where you will spawn IN the motel room
            BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
            Inventory = {x = 347.36, y = -218.56, z = 46.4},  -- The Inventory of the Room Main Storage
            Menu = {x = 345.88, y = -217.56, z = 46.4}, -- Room Options Menu
         },

            --

            Room30 = {
               number = 30,
               instancename = "pcm30",
               entry = {x = 329.43, y = -225.02, z = 58.02},
               roomExit = {x = 335.64, y = -225.56, z = 46.4 }, -- The Exit marker of the room, usually the only door hehe
               roomLoc = {x = 335.64, y = -225.56, z = 46.4 }, -- Where you will spawn IN the motel room
               BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
               Inventory = {x = 341.76, y = -228.16, z = 46.4},  -- The Inventory of the Room Main Storage
               Menu = {x = 340.32, y = -227.08, z = 46.4}, -- Room Options Menu
            },
            Room31 = {
               number = 31,
               instancename = "pcm31",
               entry = {x = 331.44, y = -225.97, z = 58.02},
               roomExit = {x = 335.64, y = -225.52, z = 37.0 }, -- The Exit marker of the room, usually the only door hehe
               roomLoc = {x = 335.64, y = -225.52, z = 37.0 }, -- Where you will spawn IN the motel room
               BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
               Inventory = {x = 341.76, y = -228.12, z = 37.0},  -- The Inventory of the Room Main Storage
               Menu = {x = 340.28, y = -227.12, z = 37.0}, -- Room Options Menu
            },
            Room32 = {
               number = 32,
               instancename = "pcm32",
               entry = {x = 334.97, y = -227.36, z = 58.02},
               roomExit = {x = 339.52, y = -214.76, z = 37.0 }, -- The Exit marker of the room, usually the only door hehe
               roomLoc = {x = 339.52, y = -214.76, z = 37.0 }, -- Where you will spawn IN the motel room
               BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
               Inventory = {x = 345.68, y = -217.44, z = 37.0},  -- The Inventory of the Room Main Storage
               Menu = {x = 344.24, y = -216.36, z = 37.0}, -- Room Options Menu
            },
            Room33 = {
               number = 33,
               instancename = "pcm33",
               entry = {x = 337.09, y = -224.81, z = 58.02},
               roomExit = {x = 344.16, y = -202.32, z = 37.0 }, -- The Exit marker of the room, usually the only door hehe
               roomLoc = {x = 344.16, y = -202.32, z = 37.0 }, -- Where you will spawn IN the motel room
               BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
               Inventory = {x = 350.24, y = -204.84, z = 37.0},  -- The Inventory of the Room Main Storage
               Menu = {x = 348.84, y = -203.84, z = 37.0}, -- Room Options Menu
            },
            Room34 = {
               number = 34,
               instancename = "pcm34",
               entry = {x = 339.21, y = -219.45, z = 58.02},
               roomExit = {x = 306.48, y = -213.68, z = 37.2 }, -- The Exit marker of the room, usually the only door hehe
            roomLoc = {x = 306.48, y = -213.68, z = 37.2 }, -- Where you will spawn IN the motel room
            BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
            Inventory = {x = 300.32, y = -211.04, z = 37.2},  -- The Inventory of the Room Main Storage
            Menu = {x = 301.8, y = -212.04, z = 37.2}, -- Room Options Menu
         },
            Room35 = {
               number = 35,
               instancename = "pcm35",
               entry = {x = 340.8, y = -214.89, z = 58.02},
               roomExit = {x = 310.52, y = -202.64, z = 37.2 }, -- The Exit marker of the room, usually the only door hehe
               roomLoc = {x = 310.52, y = -202.64, z = 37.2 }, -- Where you will spawn IN the motel room
               BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
               Inventory = {x = 304.28, y = -199.92, z = 37.2},  -- The Inventory of the Room Main Storage
               Menu = {x = 305.8, y = -200.96, z = 37.2}, -- Room Options Menu
            },
            Room36 = {
               number = 36,
               instancename = "pcm36",
               entry = {x = 342.88, y = -209.6, z = 58.02},
               roomExit = {x = 314.44, y = -191.76, z = 37.2 }, -- The Exit marker of the room, usually the only door hehe
               roomLoc = {x = 314.44, y = -191.76, z = 37.2 }, -- Where you will spawn IN the motel room
               BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
               Inventory = {x = 308.32, y = -189.08, z = 37.2},  -- The Inventory of the Room Main Storage
               Menu = {x = 309.76, y = -190.16, z = 37.2}, -- Room Options Menu
            },
            Room37 = {
               number = 37,
               instancename = "pcm37",
               entry = {x = 344.59, y = -205.01, z = 58.02},
               roomExit = {x = 306.28, y = -213.64, z = 46.4 }, -- The Exit marker of the room, usually the only door hehe
               roomLoc = {x = 306.28, y = -213.64, z = 46.4 }, -- Where you will spawn IN the motel room
               BedStash = {x = 303.04, y = -209.2, z = 46.4},  -- The Secret Stash Location of the Bed
               Inventory = {x = 300.36, y = -211.04, z = 46.4},  -- The Inventory of the Room Main Storage
               Menu = {x = 301.84, y = -212.04, z = 46.4}, -- Room Options Menu
            },
            Room38 = {
               number = 38,
               instancename = "pcm38",
               entry = {x = 346.81, y = -199.73, z = 58.02},
               roomExit = {x = 310.44, y = -202.88, z = 46.4 }, -- The Exit marker of the room, usually the only door hehe
            roomLoc = {x = 310.44, y = -202.88, z = 46.4 }, -- Where you will spawn IN the motel room
            BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
            Inventory = {x = 304.36, y = -200.2, z = 46.4},  -- The Inventory of the Room Main Storage
            Menu = {x = 305.72, y = -201.24, z = 46.4}, -- Room Options Menu
         },
      }
   },

   TheMotor = {
      Name = "Losmen",
      Pos = {x = 1123.96, y = 2650.92, z = 38.0, color = 3, sprite = 475, size = 0.8},
      Boundries = 20.0, -- The Boundry Radius of the Motel (Will check ownerships etc.. if player is within this radius)
      Rooms = {
            Room1 = {
               number = 1,
               instancename = "tm1",
               entry = {x = 1142.4, y = 2654.6, z = 38.16},
               roomExit = {x = 1141.4, y = 2659.12, z = 31.56}, -- The Exit marker of the room, usually the only door hehe
               roomLoc = {x = 1141.4, y = 2659.12, z = 31.56}, -- Where you will spawn IN the motel room
               BedStash = {x = 303.04, y = -209.2, z = 46.4},  -- The Secret Stash Location of the Bed
               Inventory = {x = 1147.96, y = 2658.76, z = 31.56},  -- The Inventory of the Room Main Storage
               Menu = {x = 1146.4, y = 2659.24, z = 31.56}, -- Room Options Menu
            },

            Room2 = {
               number = 2,
               instancename = "tm2",
               entry = {x = 1142.36, y = 2651.08, z = 38.16},
               roomExit = {x = 1141.4, y = 2647.6, z = 31.56}, -- The Exit marker of the room, usually the only door hehe
               roomLoc = {x = 1141.4, y = 2647.6, z = 31.56}, -- Where you will spawn IN the motel room
               BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
               Inventory = {x = 1148.04, y = 2647.2, z = 31.56},  -- The Inventory of the Room Main Storage
               Menu = {x = 1146.36, y = 2647.68, z = 31.56}, -- Room Options Menu
            },

            Room3 = {
               number = 3,
               instancename = "tm3",
               entry = {x = 1142.4, y = 2643.48, z = 38.16},
               roomExit = {x = 1141.4, y = 2647.6, z = 31.56}, -- The Exit marker of the room, usually the only door hehe
               roomLoc = {x = 1141.4, y = 2647.6, z = 31.56}, -- Where you will spawn IN the motel room
               BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
               Inventory = {x = 1148.04, y = 2647.2, z = 31.56},  -- The Inventory of the Room Main Storage
               Menu = {x = 1146.36, y = 2647.68, z = 31.56}, -- Room Options Menu
            },

            Room4 = {
               number = 4,
               instancename = "tm4",
               entry = {x = 1141.12, y = 2641.68, z = 38.16},
               roomExit = {x = 1141.88, y = 2639.0, z = 31.56}, -- The Exit marker of the room, usually the only door hehe
               roomLoc = {x = 1141.88, y = 2639.0, z = 31.56}, -- Where you will spawn IN the motel room
               BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
               Inventory = {x = 1141.48, y = 2632.32, z = 31.56},  -- The Inventory of the Room Main Storage
               Menu = {x = 1141.92, y = 2634.04, z = 31.56}, -- Room Options Menu
            },

            Room5 = {
               number = 5,
               instancename = "tm5",
               entry = {x = 1136.28, y = 2641.68, z = 38.16},
               roomExit = {x = 1141.84, y = 2639.0, z = 31.56}, -- The Exit marker of the room, usually the only door hehe
               roomLoc = {x = 1141.84, y = 2639.0, z = 31.56}, -- Where you will spawn IN the motel room
               BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
               Inventory = {x = 1141.48, y = 2632.44, z = 31.56},  -- The Inventory of the Room Main Storage
               Menu = {x = 1141.92, y = 2634.04, z = 31.56}, -- Room Options Menu
            },

            Room6 = {
               number = 6,
               instancename = "tm6",
               entry = {x = 1132.76, y = 2641.64, z = 38.16},
               roomExit = {x = 1141.84, y = 2639.0, z = 31.56}, -- The Exit marker of the room, usually the only door hehe
               roomLoc = {x = 1141.84, y = 2639.0, z = 31.56}, -- Where you will spawn IN the motel room
               BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
               Inventory = {x = 1141.48, y = 2632.44, z = 31.56},  -- The Inventory of the Room Main Storage
               Menu = {x = 1141.92, y = 2634.04, z = 31.56}, -- Room Options Menu
            },

            Room7 = {
               number = 7,
               instancename = "tm7",
               entry = {x = 1125.16, y = 2641.64, z = 38.16},
               roomExit = {x = 1120.92, y = 2639.8, z = 31.56}, -- The Exit marker of the room, usually the only door hehe
               roomLoc = {x = 1120.92, y = 2639.8, z = 31.56}, -- Where you will spawn IN the motel room
               BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
               Inventory = {x = 1120.56, y = 2633.08, z = 31.56},  -- The Inventory of the Room Main Storage
               Menu = {x = 1121.04, y = 2634.8, z = 31.56}, -- Room Options Menu
            },

            Room8 = {
               number = 8,
               instancename = "tm8",
               entry = {x = 1121.44, y = 2641.64, z = 38.16},
               roomExit = {x = 1120.92, y = 2639.8, z = 31.56}, -- The Exit marker of the room, usually the only door hehe
               roomLoc = {x = 1120.92, y = 2639.8, z = 31.56}, -- Where you will spawn IN the motel room
               BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
               Inventory = {x = 1120.56, y = 2633.08, z = 31.56},  -- The Inventory of the Room Main Storage
               Menu = {x = 1121.04, y = 2634.8, z = 31.56}, -- Room Options Menu
            },

            Room9 = {
               number = 9,
               instancename = "tm9",
               entry = {x = 1114.68, y = 2641.68, z = 38.16},
               roomExit = {x = 1111.24, y = 2639.8, z = 31.56}, -- The Exit marker of the room, usually the only door hehe
               roomLoc = {x = 1111.24, y = 2639.8, z = 31.56}, -- Where you will spawn IN the motel room
               BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
               Inventory = {x = 1110.88, y = 2633.12, z = 31.56},  -- The Inventory of the Room Main Storage
               Menu = {x = 1111.32, y = 2634.84, z = 31.56}, -- Room Options Menu
            },

            Room10 = {
               number = 10,
               instancename = "tm10",
               entry = {x = 1107.12, y = 2641.68, z = 38.16},
               roomExit = {x = 1111.24, y = 2639.8, z = 31.56}, -- The Exit marker of the room, usually the only door hehe
               roomLoc = {x = 1111.24, y = 2639.8, z = 31.56}, -- Where you will spawn IN the motel room
               BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
               Inventory = {x = 1110.88, y = 2633.12, z = 31.56},  -- The Inventory of the Room Main Storage
               Menu = {x = 1111.32, y = 2634.84, z = 31.56}, -- Room Options Menu
            },

            Room11 = {
               number = 11,
               instancename = "tm11",
               entry = {x = 1106.04, y = 2649.12, z = 38.16},
               roomExit = {x = 1105.08, y = 2643.96, z = 31.56}, -- The Exit marker of the room, usually the only door hehe
               roomLoc = {x = 1105.08, y = 2643.96, z = 31.56}, -- Where you will spawn IN the motel room
               BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
               Inventory = {x = 1098.44, y = 2644.36, z = 31.56},  -- The Inventory of the Room Main Storage
               Menu = {x = 1100.04, y = 2643.84, z = 31.56}, -- Room Options Menu
            },

            Room12 = {
               number = 12,
               instancename = "tm12",
               entry = {x = 1106.04, y = 2652.88, z = 38.16},
               roomExit = {x = 1105.08, y = 2653.16, z = 31.56}, -- The Exit marker of the room, usually the only door hehe
               roomLoc = {x = 1105.08, y = 2653.16, z = 31.56}, -- Where you will spawn IN the motel room
               BedStash = {x = 154.47, y = -1005.92, z = -99.0},  -- The Secret Stash Location of the Bed
               Inventory = {x = 1098.32, y = 2653.56, z = 31.56},  -- The Inventory of the Room Main Storage
               Menu = {x = 1100.08, y = 2653.12, z = 31.56}, -- Room Options Menu
            }
         }
      }
}