--[[ Lua code. See documentation: https://api.tabletopsimulator.com/ --]]
markerState = {}
trackerState = {
    [1] = {guid="64f090", pos= 0}, --Germany
    [2] = {guid="27f5b3", pos= 0}, --Japan
    [3] = {guid="e7c5d9", pos= 0}, --USA
    [4] = {guid="9df847", pos= 0}, --UK,
    [5] = {guid="fba6da", pos= 0}, --China
    [6] = {guid="9720b1", pos= 0}, --Italy
    [7] = {guid="46a832", pos= 0}, --CW
    [8] = {guid="4b2f45", pos= 0}, --France
    [9] = {guid="95986a", pos= 0} --USSR
}

CORNER = {x=-17.24, y=2.50, z=-118.69}

--[[ The onLoad event is called after the game save finishes loading. --]]
function onLoad()
    --Territory Markers
    print("Indexing Control Markers.")
    local markers = getObjectsWithTag("CONTROL")
    for index, obj in ipairs(markers) do
        local tags = obj.getTags()
        local ipc = nil
        for key, tag in pairs(tags) do
            if string.match(tag, "^IPC_%d+$") then
                ipc = string.match(tag, "IPC_(%d+)")
            end
        end
        if ipc == nil then ipc = 0 end
        --Index Territory Marker
        markerState[obj.getGUID()] = {state=obj.getStateId(), ipc=ipc, tags=tags}
        --Update Tracker
        if trackerState[obj.getStateId()] ~= nil then
            trackerState[obj.getStateId()].pos = trackerState[obj.getStateId()].pos + ipc
        end
    end
    print("Done.")
    --IPC Trackers
    print("Adjusting IPC trackers.")
    positionTrackers()
    print("Done.")
end

function onObjectStateChange(object, old_state_guid)
    local store = markerState[old_state_guid]
    --update store
    if store ~= nil then
        local oldState = store["state"]
        local newState = object.getStateId()
        local ipcValue = store["ipc"]
        local oldTags = store["tags"]
        markerState[object.getGUID()] = {state=newState, ipc=ipcValue, tags=oldTags}
        --Transfer tags
        object.setTags(oldTags)

        --Check for VP Tag
        --TODO

        --clean up
        markerState[old_state_guid] = nil
        adjustTracker(newState, ipcValue)
        adjustTracker(oldState, -1 * ipcValue)
    end
end

-- IPC Tracker : Utility Functions
function adjustTracker(state, shift)
    --Change value of IPC tracker
    local tracker = trackerState[state] 
    if tracker ~= nil then
        tracker.pos = tracker.pos + shift
    end
    positionTrackers()
end

function positionTrackers()
    --Set XZ positions of IPC Trackers based on values
    unlockAllTrackers()
    for key, value in pairs(trackerState) do
        --Position IPC Trackers
        local trackerObj = getObjectFromGUID(value.guid)
        if value.pos > 0 then
            dz = math.floor((value.pos-1)/14) % 5
            dx = (value.pos-1) % 14
        else
            dz = 0
            dx = -1
        end
        local trackerXYZ = {x=CORNER.x + dx*2.4, y=CORNER.y, z=CORNER.z - dz*2.4}
        trackerObj.setPosition(trackerXYZ)
    end
    lockAllTrackers()
    fixElevations()
    --Wait.time(function () lockAllTrackers() end, 1)
end

function fixElevations()
    --Set Y positions of IPC Trackers
    unlockAllTrackers()
    local dy = 1
    local positions = {}
    for key, value in pairs(trackerState) do
        --Handle 0 vs. 70
        if value.pos > 0 then
            placement = value.pos % 70
        else
            placement = -1
        end
        --Adjust Heights
        if #positions > 0 then
            local count = getCountList(positions, placement)
            local trackerObj = getObjectFromGUID(value.guid)
            local trackerXYZ = trackerObj.getPosition()
            trackerXYZ.y = CORNER.y + dy * count
            trackerObj.setPosition(trackerXYZ)
        end
        table.insert(positions, placement)
    end
    lockAllTrackers()
end

function lockAllTrackers()
    for key, value in pairs(trackerState) do
        local tracker = getObjectFromGUID(value.guid)
        tracker.setLock(true)
    end
end

function unlockAllTrackers()
    for key, value in pairs(trackerState) do
        local tracker = getObjectFromGUID(value.guid)
        tracker.setLock(false)
    end
end

-- helper functions : debug
function printTableKeys(table)
    for key, value in pairs(table) do
        print(key.. " : " ..value)
    end
end

--array functions
function getCountList(lst, target)
    --Count instances of 'target' in 'lst'
    local count = 0
    for index, value in ipairs(lst) do
        if value == target then
            count = count + 1
        end
    end
    return count
end