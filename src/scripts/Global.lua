require("./src/scripts/TerritorySetup")
require("./src/scripts/TrackerManagement")
require("./src/scripts/UnitSetup")
require("./src/scripts/ZoneLayout")

function onLoad()
    print("Loaded")
    CONTROL_MARKER_OBJ = getObjectFromGUID("8193c4")
    SETUP_DONE = false
end

function onObjectStateChange(object, old_state_guid)
    if SETUP_DONE then
        handle_tracker_state_change(object, old_state_guid) 
    end
end

function onObjectEnterZone(zone, object)
    handle_zone_layout(zone, object)
end

function onChat(message, sender)
    if message == 'setup' then
        print("Initializing...")
        SETUP_DONE = false
        setup_zones()
        setup_territories(CONTROL_MARKER_OBJ)
        Wait.time(function () setup_trackers() end, 1.5)
        setup_units()
        SETUP_DONE = true
        print("Setup Complete.")
    end
end