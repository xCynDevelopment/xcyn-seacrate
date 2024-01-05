This is my first written script. It is very simple I will continue to try and improve this.

You need to add this to qb-target/init.lua

Config.TargetModels = {
    ['stealcontainer'] = {
        models = -328261803,
        options = {
            {
                type = "client",
                event = "xcyn:client:cuttercheck",
                icon = "fa-solid fa-scissors",
                label = "Cut Open",
            },
        },
        distance = 2.5
    }
}

You also need to make sure you either have the items I used or edit to add items you use in your server.

	

