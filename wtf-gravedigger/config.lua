Config = {}

-- Cooldown time for digging in milliseconds
Config.DigCooldown = (60 * 1000) * 3 -- 10 minutes- the wait time before the same hole can be dug again adjust to your wants i.e. search the same hole 3 times per shuffle or match to not search again.
Config.NumberOfLocations = 3 -- Number of sites available per location i.e. 3 graves per name/area 
Config.tickInterval = 1000  -- Time multiplier (1000 = x1, 2000 = x2, etc.) (dont touch unless you know what your doing)
Config.resettime = (60 * 1000) * 3 -- set at 30 minutes -- needs to be the same as config.shuffleInterval
Config.shuffleInterval = (60 * 1000) * 3 -- set at 30 minutes -- Shuffle needs to be the same as config.resettime
Config.SendResetMessage = false  -- Set to true to send the message to the player that the locations have been reset, false to disable
Config.ResetMessage = "Digging locations have been shuffled!" -- what you want the player to read if above set true
Config.WaitDurationMin = 10000  -- Minimum time digging
Config.WaitDurationMax = 25000  -- Maximum time digging
Config.UseProgressBar = true -- Set to false if you don't want the progress bar
Config.RewardType = "50_50"  -- Options: "cash", "item", or "50_50" for rewards at the bottom



-- Define digging locations-- name = area that can be searched to add more just continue with this config and change the name to whatever you want for the next section.
Config.DiggingLocations = {
    -- Valentine Section
    [1] = {coord = vector3(-230.71, 829.16, 124.41), name = 'Valentine', searched = false, time = 0},
    [2] = {coord = vector3(-229.36, 826.98, 124.46), name = 'Valentine', searched = false, time = 0},
    [3] = {coord = vector3(-228.68, 824.52, 124.45), name = 'Valentine', searched = false, time = 0},
    [4] = {coord = vector3(-239.33, 829.36, 123.53), name = 'Valentine', searched = false, time = 0},
    [5] = {coord = vector3(-227.76, 835.78, 124.25), name = 'Valentine', searched = false, time = 0},
    [6] = {coord = vector3(-246.96, 812.08, 122.45), name = 'Valentine', searched = false, time = 0},
    [7] = {coord = vector3(-240.67, 809.66, 122.99), name = 'Valentine', searched = false, time = 0},
    [8] = {coord = vector3(-242.93, 810.30, 122.67), name = 'Valentine', searched = false, time = 0},
    [9] = {coord = vector3(-246.99, 816.56, 122.67), name = 'Valentine', searched = false, time = 0},
    [10] = {coord = vector3(-248.19, 818.23, 122.45), name = 'Valentine', searched = false, time = 0},
    [11] = {coord = vector3(-248.91, 819.92, 122.28), name = 'Valentine', searched = false, time = 0},
    [12] = {coord = vector3(-247.13, 823.95, 122.47), name = 'Valentine', searched = false, time = 0},
    [13] = {coord = vector3(-245.63, 819.95, 122.79), name = 'Valentine', searched = false, time = 0},
    [14] = {coord = vector3(-244.62, 817.64, 123.00), name = 'Valentine', searched = false, time = 0},
    [15] = {coord = vector3(-243.53, 815.88, 123.16), name = 'Valentine', searched = false, time = 0},
    [16] = {coord = vector3(-241.48, 812.88, 123.24), name = 'Valentine', searched = false, time = 0},
    [17] = {coord = vector3(-238.30, 813.43, 123.77), name = 'Valentine', searched = false, time = 0},
    [18] = {coord = vector3(-239.15, 814.79, 123.77), name = 'Valentine', searched = false, time = 0},
    [19] = {coord = vector3(-240.75, 816.37, 123.61), name = 'Valentine', searched = false, time = 0},
    [20] = {coord = vector3(-241.17, 818.84, 123.53), name = 'Valentine', searched = false, time = 0},
    [21] = {coord = vector3(-241.65, 820.41, 123.42), name = 'Valentine', searched = false, time = 0},
    [22] = {coord = vector3(-243.33, 824.08, 123.08), name = 'Valentine', searched = false, time = 0},
    [23] = {coord = vector3(-244.12, 826.32, 122.89), name = 'Valentine', searched = false, time = 0},
    [24] = {coord = vector3(-245.15, 828.93, 122.61), name = 'Valentine', searched = false, time = 0},
    [25] = {coord = vector3(-242.36, 830.60, 122.98), name = 'Valentine', searched = false, time = 0},
    [26] = {coord = vector3(-241.05, 827.47, 123.32), name = 'Valentine', searched = false, time = 0},
    [27] = {coord = vector3(-239.69, 822.15, 123.67), name = 'Valentine', searched = false, time = 0},
    [28] = {coord = vector3(-238.80, 820.05, 123.83), name = 'Valentine', searched = false, time = 0},
    [29] = {coord = vector3(-237.64, 817.86, 123.99), name = 'Valentine', searched = false, time = 0},
    [30] = {coord = vector3(-236.30, 815.84, 124.11), name = 'Valentine', searched = false, time = 0},
    [31] = {coord = vector3(-235.10, 813.33, 124.14), name = 'Valentine', searched = false, time = 0},
    [32] = {coord = vector3(-231.49, 814.57, 124.32), name = 'Valentine', searched = false, time = 0},
    [33] = {coord = vector3(-232.91, 816.73, 124.31), name = 'Valentine', searched = false, time = 0},
    [34] = {coord = vector3(-234.00, 818.53, 124.29), name = 'Valentine', searched = false, time = 0},
    [35] = {coord = vector3(-235.06, 821.67, 124.19), name = 'Valentine', searched = false, time = 0},
    [36] = {coord = vector3(-236.45, 824.26, 124.05), name = 'Valentine', searched = false, time = 0},
    [37] = {coord = vector3(-237.16, 826.29, 123.87), name = 'Valentine', searched = false, time = 0},
    [38] = {coord = vector3(-237.12, 835.45, 123.32), name = 'Valentine', searched = false, time = 0},
    [39] = {coord = vector3(-235.31, 833.65, 123.60), name = 'Valentine', searched = false, time = 0},
    [40] = {coord = vector3(-226.23, 819.63, 124.43), name = 'Valentine', searched = false, time = 0},
    [41] = {coord = vector3(-222.95, 825.88, 124.25), name = 'Valentine', searched = false, time = 0},
    [42] = {coord = vector3(-224.45, 828.49, 124.33), name = 'Valentine', searched = false, time = 0},
    [43] = {coord = vector3(-225.04, 830.22, 124.37), name = 'Valentine', searched = false, time = 0},
    [44] = {coord = vector3(-225.86, 832.16, 124.38), name = 'Valentine', searched = false, time = 0},
    [45] = {coord = vector3(-226.85, 833.46, 124.34), name = 'Valentine', searched = false, time = 0},

    -- BlackWater Section
    [46] = {coord = vector3(-966.83, -1206.36, 57.14), name = 'BlackWater', searched = false, time = 0},
    [47] = {coord = vector3(-962.98, -1205.99, 55.79), name = 'BlackWater', searched = false, time = 0},
    [48] = {coord = vector3(-960.28, -1206.23, 55.53), name = 'BlackWater', searched = false, time = 0},
    [49] = {coord = vector3(-956.92, -1205.81, 55.46), name = 'BlackWater', searched = false, time = 0},
    [50] = {coord = vector3(-954.69, -1202.95, 54.55), name = 'BlackWater', searched = false, time = 0},
    [51] = {coord = vector3(-960.93, -1199.84, 56.25), name = 'BlackWater', searched = false, time = 0},
    [52] = {coord = vector3(-956.10, -1194.11, 56.19), name = 'BlackWater', searched = false, time = 0},
    [53] = {coord = vector3(-959.85, -1194.21, 56.87), name = 'BlackWater', searched = false, time = 0},
    [54] = {coord = vector3(-963.06, -1194.51, 57.61), name = 'BlackWater', searched = false, time = 0},
    [55] = {coord = vector3(-966.55, -1194.83, 58.21), name = 'BlackWater', searched = false, time = 0},
    [56] = {coord = vector3(-963.83, -1189.52, 58.04), name = 'BlackWater', searched = false, time = 0},
    [57] = {coord = vector3(-960.51, -1189.11, 57.62), name = 'BlackWater', searched = false, time = 0},
    [58] = {coord = vector3(-957.69, -1189.44, 57.00), name = 'BlackWater', searched = false, time = 0},
    [59] = {coord = vector3(-954.90, -1189.32, 56.54), name = 'BlackWater', searched = false, time = 0},
    [60] = {coord = vector3(-989.74, -1199.67, 58.37), name = 'BlackWater', searched = false, time = 0},
    [61] = {coord = vector3(-993.94, -1199.21, 58.41), name = 'BlackWater', searched = false, time = 0},
    [62] = {coord = vector3(-996.62, -1199.36, 58.94), name = 'BlackWater', searched = false, time = 0},
    [63] = {coord = vector3(-1000.69, -1200.31, 59.24), name = 'BlackWater', searched = false, time = 0},
    [64] = {coord = vector3(-1010.30, -1200.16, 59.63), name = 'BlackWater', searched = false, time = 0},
    [65] = {coord = vector3(-1014.25, -1200.89, 59.87), name = 'BlackWater', searched = false, time = 0},
    [66] = {coord = vector3(-1017.92, -1200.44, 60.21), name = 'BlackWater', searched = false, time = 0},
    [67] = {coord = vector3(-1020.88, -1201.24, 60.44), name = 'BlackWater', searched = false, time = 0},
    [68] = {coord = vector3(-1020.68, -1196.46, 60.25), name = 'BlackWater', searched = false, time = 0},
    [69] = {coord = vector3(-1018.03, -1196.56, 60.08), name = 'BlackWater', searched = false, time = 0},
    [70] = {coord = vector3(-1014.91, -1196.65, 59.74), name = 'BlackWater', searched = false, time = 0},
    [71] = {coord = vector3(-1011.82, -1196.51, 59.39), name = 'BlackWater', searched = false, time = 0},
    [72] = {coord = vector3(-1009.38, -1196.18, 59.46), name = 'BlackWater', searched = false, time = 0},
    [73] = {coord = vector3(-1004.37, -1197.52, 59.43), name = 'BlackWater', searched = false, time = 0},
    [74] = {coord = vector3(-998.53, -1195.54, 59.29), name = 'BlackWater', searched = false, time = 0},
    [75] = {coord = vector3(-995.07, -1195.50, 58.96), name = 'BlackWater', searched = false, time = 0},
    [76] = {coord = vector3(-988.54, -1195.37, 58.52), name = 'BlackWater', searched = false, time = 0},
    [77] = {coord = vector3(-989.40, -1189.97, 58.88), name = 'BlackWater', searched = false, time = 0},
    [78] = {coord = vector3(-993.82, -1190.27, 58.95), name = 'BlackWater', searched = false, time = 0},
    [79] = {coord = vector3(-997.31, -1190.16, 58.70), name = 'BlackWater', searched = false, time = 0},
    [80] = {coord = vector3(-1000.10, -1190.46, 58.78), name = 'BlackWater', searched = false, time = 0},
    [81] = {coord = vector3(-1003.39, -1191.10, 58.92), name = 'BlackWater', searched = false, time = 0},
    [82] = {coord = vector3(-1008.72, -1190.38, 58.95), name = 'BlackWater', searched = false, time = 0},
    [83] = {coord = vector3(-1011.36, -1189.95, 58.78), name = 'BlackWater', searched = false, time = 0},
    [84] = {coord = vector3(-1015.01, -1185.18, 58.62), name = 'BlackWater', searched = false, time = 0},
    [85] = {coord = vector3(-1012.35, -1184.99, 58.41), name = 'BlackWater', searched = false, time = 0},
    [86] = {coord = vector3(-1009.51, -1185.10, 58.20), name = 'BlackWater', searched = false, time = 0},
    [87] = {coord = vector3(-1002.84, -1184.83, 58.02), name = 'BlackWater', searched = false, time = 0},
    [88] = {coord = vector3(-999.85, -1184.75, 58.05), name = 'BlackWater', searched = false, time = 0},
    [89] = {coord = vector3(-997.55, -1184.60, 58.06), name = 'BlackWater', searched = false, time = 0},
    [90] = {coord = vector3(-994.39, -1184.69, 58.17), name = 'BlackWater', searched = false, time = 0},
    [91] = {coord = vector3(-991.46, -1185.27, 58.55), name = 'BlackWater', searched = false, time = 0},
    [92] = {coord = vector3(-988.50, -1184.77, 58.63), name = 'BlackWater', searched = false, time = 0},
    
    -- Tumbleweed
    [93] = {coord = vector3(-5448.92, -2926.09, 1.01), name = 'Tumbleweed', searched = false, time = 0},
    [94] = {coord = vector3(-5451.55, -2924.77, 0.76), name = 'Tumbleweed', searched = false, time = 0},
    [95] = {coord = vector3(-5453.44, -2922.86, 0.87), name = 'Tumbleweed', searched = false, time = 0},
    [96] = {coord = vector3(-5455.53, -2919.91, 0.88), name = 'Tumbleweed', searched = false, time = 0},
    [97] = {coord = vector3(-5458.03, -2917.54, 0.88), name = 'Tumbleweed', searched = false, time = 0},
    [98] = {coord = vector3(-5460.32, -2914.31, 0.88), name = 'Tumbleweed', searched = false, time = 0},
    [99] = {coord = vector3(-5461.16, -2911.60, 0.76), name = 'Tumbleweed', searched = false, time = 0},
    [100] = {coord = vector3(-5461.93, -2908.19, 0.87), name = 'Tumbleweed', searched = false, time = 0},
    [101] = {coord = vector3(-5461.31, -2904.77, 0.85), name = 'Tumbleweed', searched = false, time = 0},
    [102] = {coord = vector3(-5457.43, -2902.83, 0.93), name = 'Tumbleweed', searched = false, time = 0},
    [103] = {coord = vector3(-5457.48, -2906.59, 0.88), name = 'Tumbleweed', searched = false, time = 0},
    [104] = {coord = vector3(-5456.46, -2909.79, 0.87), name = 'Tumbleweed', searched = false, time = 0},
    [105] = {coord = vector3(-5455.47, -2913.72, 0.91), name = 'Tumbleweed', searched = false, time = 0},
    [106] = {coord = vector3(-5453.30, -2916.36, 0.84), name = 'Tumbleweed', searched = false, time = 0},
    [107] = {coord = vector3(-5450.99, -2917.99, 0.74), name = 'Tumbleweed', searched = false, time = 0},
    [108] = {coord = vector3(-5448.27, -2920.77, 0.88), name = 'Tumbleweed', searched = false, time = 0},
    [109] = {coord = vector3(-5440.44, -2908.07, 0.87), name = 'Tumbleweed', searched = false, time = 0},
    [110] = {coord = vector3(-5443.11, -2905.11, 0.93), name = 'Tumbleweed', searched = false, time = 0},
    [111] = {coord = vector3(-5445.58, -2902.68, 1.05), name = 'Tumbleweed', searched = false, time = 0},
    [112] = {coord = vector3(-5449.43, -2900.57, 1.03), name = 'Tumbleweed', searched = false, time = 0},
    [113] = {coord = vector3(-5454.69, -2896.32, 0.93), name = 'Tumbleweed', searched = false, time = 0},
    
}

-- Reward probabilities
Config.RewardChances = {
    good = 70,
    better = 25,
    best = 5
}
-- Cash rewards based on level
Config.CashRewards = {
    good = { min = 0.1, max = 0.10 }, 
    better = { min = 0.11, max = 0.20 }, 
    best = { min = 0.21, max = 0.30 } 
}

-- Reward items
Config.RewardItems = {
    good = {"water", "carrot", "bread"}, -- change to whatever you want for possible rewards and add more or less as wanted or needed
    better = {"beer", "rum", "whiskey"}, 
    best = {"gold_ore", "silver_ore", "copper_ore"}
}
