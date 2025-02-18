require("./src/Assets/Tracker")
require("./src/Utils/List")

function setup_trackers()
    local markerObjs = getObjectsWithTag("CONTROL")
    for index, obj in ipairs(markerObjs) do
        local tags = obj.getTags()
        for key, tag in pairs(tags) do
            if string.match(tag, "^IPC_(%d+)") then
                ipc = string.match(tag, "IPC_(%d+)")
            end
        end
        if ipc == nil then ipc = 0 end
        --Index Territory Marker
        MARKER_STATE[obj.getGUID()] = {state=obj.getStateId(), ipc=ipc, tags=tags}
        --Update Tracker Value
        if TRACKER_STATE[obj.getStateId()] ~= nil then
            TRACKER_STATE[obj.getStateId()].pos = TRACKER_STATE[obj.getStateId()].pos + ipc
        end
        --Lock Control Marker
        obj.setLock(true)
    end
    position_trackers()
end

function handle_tracker_state_change(object, old_state_guid)
    local store = MARKER_STATE[old_state_guid]
    --Update Store
    if store ~= nil then
        local oldState = store.state
        local newState = object.getStateId()
        local ipcValue = store.ipc
        local oldTags = store.tags
        MARKER_STATE[object.getGUID()] = {
            state=newState,
            ipc=ipcValue,
            tags=oldTags
        }
        --Transfer Tags
        object.setTags(oldTags)
        --Clean Up
        MARKER_STATE[old_state_guid] = nil
        adjust_tracker(newState, ipcValue)
        adjust_tracker(oldState, -1 * ipcValue)
    end
end

function adjust_tracker(state, shift)
    --Change Value of IPC Tracker
    local tracker = TRACKER_STATE[state]
    if tracker ~= nil then
        tracker.pos = tracker.pos + shift
    end
    position_trackers()
end

function position_trackers()
    --Refresh XZ Positions of IPC Trackers
    unlock_all_trackers()
    for key, params in pairs(TRACKER_STATE) do
        --Position IPC Trackers
        local trackerObj = getObjectFromGUID(params.guid)
        local dz = nil
        local dx = nil
        if params.pos > 0 then
            dz = math.floor((params.pos - 1)/14) %5
            dx = (params.pos-1) %14
        else
            dz = 0
            dx = -1
        end
        local trackerVector= {
            x= CORNER.x + dx*BOX_SIZE,
            y= CORNER.y,
            z= CORNER.z - dz*BOX_SIZE
        }
        trackerObj.setPosition(trackerVector)
    end
    lock_all_trackers()
    fix_tracker_elevations()
end

function fix_tracker_elevations()
    --Set Y Position of IPC Trackers
    unlock_all_trackers()
    local dy = 1
    local positions = {}
    for key, params in pairs(TRACKER_STATE) do
        --Handle 0 vs. 70
        local placement = nil
        if params.pos > 0 then
            placement = params.pos % 70
        else
            placement = -1
        end
        --Adjust Heights
        if #positions > 0 then
            local count = get_count_list(positions, placement)
            local trackerObj = getObjectFromGUID(params.guid)
            local trackerVector = trackerObj.getPosition()
            trackerVector.y = CORNER.y + dy * count
            trackerObj.setPosition(trackerVector)
        end
        table.insert(positions, placement)
    end
    lock_all_trackers()
end

function unlock_all_trackers()
    for key, params in pairs(TRACKER_STATE) do
        local trackerObj = getObjectFromGUID(params.guid)
        trackerObj.setLock(true)
    end
end

function lock_all_trackers()
    for key, params in pairs(TRACKER_STATE) do
        local trackerObj = getObjectFromGUID(params.guid)
        trackerObj.setLock(true)
    end
end
