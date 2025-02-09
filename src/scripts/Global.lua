require("src/Positions")
require("src/Units")
require("src/config")

function onLoad()
    print("Loaded")
end

function onChat(message, sender)
    if message == 'setup' then
        print("Initializing...")
        Global.call("setup_units")
        print("Setup Complete.")
    end
end

function setup_units()
    local bag = getObjectFromGUID(UNITS[GERMANY][INF])
    local position = POSITION.Greenland
    bag.takeObject({
        position = position,
        callback_function = function(taken_object)
            print("Place Infantry.")
        end
    })
end