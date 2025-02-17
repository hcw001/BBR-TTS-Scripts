require("./src/Positions")
require("./src/Units")

function onLoad()
    print("Loaded")
end

function onChat(message, sender)
    if message == 'setup' then
        print("Initializing...")
        Global.call("setup_units") --setup_units()
        print("Setup Complete.")
    end
end

function setup_units()
    local bag = getObjectFromGUID(UNITS[GERMANY][INF].guid)
    local position = POSITION.Greenland
    local takenObj = bag.takeObject({
        position = position,
        callback_function = function(taken_object)
            print("Place Infantry.")
        end
    })
    -- takenObj.highlightOn('Blue')
end

-- function staggeredLoad(objects, index)
--     index = index or 1
--     if index > #objects then return end
    
--     local obj = objects[index]
--     obj.setPositionSmooth({0,5,0})
    
--     Wait.time(function()
--         staggeredLoad(objects, index+1)
--     end, 0.2)
-- end