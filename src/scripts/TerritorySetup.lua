require('./src/Assets/Territories')
require('./src/Assets/Positions')

function setup_zones()
    for name, dict in pairs(TERRITORY) do
        local position = POSITION[name]
        --Create Scripting Zone
        local zone = spawnObject({
            type="ScriptingTrigger",
            position=position,
            scale={4,2,4}  -- Doubled width and length while keeping height
        })
        zone.addTag("UNIT")
        zone.addTag("TERRITORY_" .. name)  -- Add territory name tag for identification
        TERRITORY[name].guid = zone.guid
    end
end

function setup_territories(CONTROL_MARKER_OBJ)
    for name, dict in pairs(TERRITORY) do
        local position = POSITION[name]
        --Create Clone of Control Marker
        local markerObj = CONTROL_MARKER_OBJ.clone({position=position})
        --Change State
        if markerObj.getStateId() ~= dict.nation then 
            markerObj = markerObj.setState(dict.nation) 
        end
        --Add Tags
        markerObj.addTag("CONTROL")
        local ipcValue = 0
        if dict.ipc ~= nil then ipcValue = dict.ipc end
        markerObj.addTag("IPC_" ..ipcValue)
        --Unlock
        markerObj.setLock(false)
    end
end