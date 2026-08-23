hl.window_rule({
    match = {
        class = ".*",
    },
    suppress_event = "maximize",
})

hl.window_rule({
    match = {
        class = "^$",
        title = "^$",
        xwayland = 1,
        float = 1,
        fullscreen = 0,
        pin = 0,
    },
    suppress_event = "activate activatefocus",
    no_initial_focus = true,
})

hl.window_rule({
    match = {
        initial_class = "^(spotify)$",
    },
    workspace = "special:music",
})

hl.window_rule({
    match = {
        class = "clipse",
    },
    float = true,
    size = "622 652",
})
