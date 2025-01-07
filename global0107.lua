CONTROL_MARKER_GUID = "8f87c0"
TABLE_CORNER = {-97.75, 0.21, 49.25}

function onLoad()
    CONTROL_MARKER_OBJECT = getObjectFromGUID(CONTROL_MARKER_GUID)
    print("Loaded")
end

function onInitialize()
    --Aggregate Snap Points
    local snapPoints={}
    --Dispense Control Markers
    for territory, props in pairs(TERRITORY) do
        --Get Position
        local position = POSITION[territory]
        --Get IPC Value
        local ipc = 0
        if props.ipc ~= nil then ipc=props.ipc end
        --Create New Marker
        local marker = CONTROL_MARKER_OBJECT.clone({
            position=TABLE_CORNER,
            snap_to_grid=false
        })
        --Place and Lock @ State (CONTROL Tag, IPC Tag)
        marker.setPositionSmooth(position)
        marker.setTags({"CONTROL", "IPC_" ..ipc})
        if marker.getStateId() ~= props.nation then marker = marker.setState(props.nation) end
        marker.setLock(true)
        --Create Scripting Zone (UNIT Tag)
        local zone = spawnObject({
            type="ScriptingTrigger",
            position=position,
            scale={3,1,3},
            sound=false
        })
        zone.addTag("UNIT")
        --Store Scripting Zone
        TERRITORY[territory].guid = zone.getGUID()
        --Append Grab Point (UNIT Tag)
        table.insert(snapPoints, {
            position=position,
            tags={"UNIT"}
        })
    end
    --Create Snap Points
    Global.setSnapPoints(snapPoints)
    return 1
end

function onChat(message, sender)
    if message == "setup" then
        print("Initializing...")
        startLuaCoroutine(Global, 'onInitialize')
        print("Setup Complete.")
    end
    return true
end

--config
--territories
--positions

--https://github.com/Quinnsicle/arcs_tts/issues/20
--https://github.com/Quinnsicle/arcs_tts/blob/main/src/Control.lua#L131