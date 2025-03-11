DP = 0.57

-- Constants for zone layout
local LAYOUT_CONFIG = {
    DEFAULT_SPACING = 2.0,      -- Increased base spacing between units
    MAX_UNITS_PER_ROW = 4,      -- Reduced max units per row for better spacing
    PLACEMENT_HEIGHT = 0.5,     -- Height for lifting units
    MOVEMENT_DELAY = 0.15,     -- Increased delay for more stable movement
    GROUP_SPACING = 1.0,       -- Extra spacing between different unit types
    -- Unit type specific spacing multipliers
    SPACING_MULTIPLIERS = {
        [INF] = 0.7,  -- Infantry units packed closer together
        [MECH] = 0.8, -- Mechanized slightly more spaced
        [TANK] = 1.2, -- Tanks need more space
        [CAV] = 1.0,  -- Cavalry standard spacing
        [ART] = 1.2,  -- Artillery needs more space
        [AAA] = 1.2,  -- Anti-air needs more space
        [FTR] = 1.5,  -- Fighter needs more space
        [TAC] = 1.5,  -- Tactical bomber needs more space
        [SBR] = 1.8   -- Strategic bomber needs most space
    },
    -- Group units by type category
    UNIT_GROUPS = {
        GROUND = {INF, MECH, TANK, CAV},
        SUPPORT = {ART, AAA},
        AIR = {FTR, TAC, SBR}
    }
}

-- Get unit type from object tags
local function get_unit_type(object)
    local tags = object.getTags()
    for _, tag in ipairs(tags) do
        if string.match(tag, "^UNIT_(%d+)$") then
            return tonumber(string.match(tag, "UNIT_(%d+)"))
        end
    end
    return nil
end

-- Get unit group (GROUND, SUPPORT, or AIR)
local function get_unit_group(unitType)
    for group, types in pairs(LAYOUT_CONFIG.UNIT_GROUPS) do
        for _, type in ipairs(types) do
            if type == unitType then
                return group
            end
        end
    end
    return "GROUND" -- Default to ground group
end

-- Check if position is clear of other units
local function is_position_clear(position, unit_size)
    -- Create a slightly larger bounds check
    local bounds = 1.2 * unit_size
    local hits = Physics.cast({
        origin = position,
        direction = {0, -1, 0},
        type = 3, -- Box cast
        size = {bounds, bounds, bounds},
        max_distance = 0.1,
        debug = false
    })
    
    -- Check if any hits are units
    for _, hit in ipairs(hits) do
        if hit.hit_object and hit.hit_object.hasTag("UNIT") then
            return false
        end
    end
    return true
end

-- Find clear position near target
local function find_clear_position(target_pos, unit_size, max_attempts)
    if is_position_clear(target_pos, unit_size) then
        return target_pos
    end
    
    -- Try positions in an expanding spiral
    local offsets = {{0.5,0}, {0,0.5}, {-0.5,0}, {0,-0.5}}
    for attempt = 1, (max_attempts or 4) do
        for _, offset in ipairs(offsets) do
            local test_pos = {
                x = target_pos.x + (offset[1] * attempt * unit_size),
                y = target_pos.y,
                z = target_pos.z + (offset[2] * attempt * unit_size)
            }
            if is_position_clear(test_pos, unit_size) then
                return test_pos
            end
        end
    end
    return target_pos -- Return original if no clear position found
end

-- Calculate position for a unit in the formation
local function calculate_unit_position(base_position, unit_index, row_size, unitType, total_rows, group_offset)
    local row = math.floor(unit_index / row_size)
    local col = unit_index % row_size
    
    -- Get unit-specific spacing multiplier
    local spacing_multiplier = LAYOUT_CONFIG.SPACING_MULTIPLIERS[unitType] or 1.0
    
    -- Calculate base spacing
    local x_offset = (col - (row_size-1)/2) * LAYOUT_CONFIG.DEFAULT_SPACING * spacing_multiplier
    local z_offset = (row - (total_rows-1)/2) * LAYOUT_CONFIG.DEFAULT_SPACING * spacing_multiplier
    
    -- Add group offset to separate different unit types
    z_offset = z_offset + (group_offset * LAYOUT_CONFIG.GROUP_SPACING)
    
    local position = {
        x = base_position.x + x_offset,
        y = base_position.y,
        z = base_position.z + z_offset
    }
    
    -- Find a clear position near the calculated position
    return find_clear_position(position, spacing_multiplier)
end

-- Sort and group units by type
local function organize_units_by_groups(units)
    local groups = {GROUND = {}, SUPPORT = {}, AIR = {}}
    
    for _, obj in ipairs(units) do
        local unitType = get_unit_type(obj)
        if unitType then
            local group = get_unit_group(unitType)
            if not groups[group][unitType] then
                groups[group][unitType] = {}
            end
            table.insert(groups[group][unitType], obj)
        end
    end
    
    return groups
end

-- Move a single unit to its new position
local function move_unit_safely(unit, final_position)
    -- Get current position
    local current_pos = unit.getPosition()
    
    -- First move up directly (no smooth movement)
    unit.setPosition({
        x = current_pos.x,
        y = current_pos.y + LAYOUT_CONFIG.PLACEMENT_HEIGHT,
        z = current_pos.z
    })
    
    -- Lock rotation and position during movement
    unit.setLock(true)
    
    -- Move to final position smoothly
    unit.setPositionSmooth(final_position)
    unit.setRotation({0, 90, 0})
    
    -- Unlock after a delay
    Wait.time(function()
        unit.setLock(false)
    end, LAYOUT_CONFIG.MOVEMENT_DELAY * 2)
end

-- Reorganize all units in a zone
local function reorganize_zone(zone)
    local units = {}
    -- Get all units in zone
    for _, obj in ipairs(zone.getObjects()) do
        if obj.hasTag("UNIT") and obj ~= zone then
            table.insert(units, obj)
        end
    end
    
    if #units == 0 then return end
    
    -- Organize units by groups
    local grouped_units = organize_units_by_groups(units)
    
    -- Process each group separately
    local group_order = {"GROUND", "SUPPORT", "AIR"}
    local current_index = 0
    local group_offset = 0
    
    for _, group_name in ipairs(group_order) do
        local group = grouped_units[group_name]
        local group_units = {}
        
        -- Flatten group units while maintaining type order
        for _, unitType in ipairs(LAYOUT_CONFIG.UNIT_GROUPS[group_name]) do
            if group[unitType] then
                for _, unit in ipairs(group[unitType]) do
                    table.insert(group_units, unit)
                end
            end
        end
        
        if #group_units > 0 then
            -- Calculate formation dimensions for this group
            local row_size = math.min(LAYOUT_CONFIG.MAX_UNITS_PER_ROW, math.ceil(math.sqrt(#group_units)))
            local total_rows = math.ceil(#group_units / row_size)
            
            -- Position units in this group
            for i, unit in ipairs(group_units) do
                local unitType = get_unit_type(unit)
                local new_pos = calculate_unit_position(
                    zone.getPosition(),
                    current_index,
                    row_size,
                    unitType,
                    total_rows,
                    group_offset
                )
                
                -- Stagger movement
                Wait.time(function()
                    move_unit_safely(unit, new_pos)
                end, LAYOUT_CONFIG.MOVEMENT_DELAY * current_index)
                
                current_index = current_index + 1
            end
            
            group_offset = group_offset + total_rows
        end
    end
end

-- Check if an object is in a zone
local function get_containing_zone(object)
    local hits = Physics.cast({
        origin = object.getPosition(),
        direction = {0, -1, 0},
        type = 2, -- Sphere cast
        size = {0.1, 0.1, 0.1},
        max_distance = 0.1
    })
    
    for _, hit in ipairs(hits) do
        if hit.hit_object and hit.hit_object.hasTag("ZONE") then
            return hit.hit_object
        end
    end
    return nil
end

-- Handle zone events with debouncing
local reorganizing = false
local function debounced_reorganize(zone)
    if reorganizing then return end
    reorganizing = true
    
    Wait.time(function()
        reorganize_zone(zone)
        -- Reset flag after all movements should be complete
        Wait.time(function()
            reorganizing = false
        end, LAYOUT_CONFIG.MOVEMENT_DELAY * 10)
    end, LAYOUT_CONFIG.MOVEMENT_DELAY)
end

-- Handle unit drops
function onObjectDrop(player_color, dropped_object)
    if not dropped_object.hasTag("UNIT") then return end
    
    -- Check if the dropped object is in a zone
    local zone = get_containing_zone(dropped_object)
    if zone then
        debounced_reorganize(zone)
    end
end

function onObjectLeaveZone(zone, object)
    if not object.hasTag("UNIT") then return end
    debounced_reorganize(zone)
end