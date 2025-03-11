require('./src/Assets/Setup')
require('./src/Assets/Units')
require('./src/Assets/Positions')

-- Constants for unit layout
local LAYOUT_CONFIG = {
    DEFAULT_SPACING = 1.5,      -- Base spacing between units
    MAX_UNITS_PER_ROW = 5,      -- Maximum units in a single row
    PLACEMENT_DELAY = 0.05,     -- Delay between placements
    PLACEMENT_HEIGHT = 2,       -- Height to place units at before lowering
    DROP_DELAY = 0.1,          -- Delay for dropping
    -- Unit type specific spacing multipliers
    SPACING_MULTIPLIERS = {
        [INF] = 0.7,  -- Infantry units packed closer together
        [FTR] = 1.5,  -- Fighter needs 50% more space
        [TAC] = 1.5,  -- Tactical bomber needs 50% more space
        [SBR] = 1.8   -- Strategic bomber needs 80% more space
    },
    UNIT_TYPES_ORDER = {        -- Order of unit placement (ground units first, then support, then air)
        INF, MECH, TANK, CAV,   -- Ground units
        ART, AAA,               -- Support units
        FTR, TAC, SBR          -- Air units
    }
}

-- Helper function to sort units by type priority
local function get_unit_type_priority(unitType)
    for i, type in ipairs(LAYOUT_CONFIG.UNIT_TYPES_ORDER) do
        if type == unitType then
            return i
        end
    end
    return #LAYOUT_CONFIG.UNIT_TYPES_ORDER + 1
end

-- Helper function to organize units by type
local function organize_units_by_type(units)
    local organized = {}
    local total_count = 0
    
    for _, unitDesc in ipairs(units) do
        local nation, unitType, count = table.unpack(unitDesc)
        if not organized[unitType] then
            organized[unitType] = {}
        end
        table.insert(organized[unitType], {nation=nation, count=count})
        total_count = total_count + count
    end
    
    return organized, total_count
end

-- Calculate position for a unit in the formation
local function calculate_unit_position(base_position, unit_index, row_size, unitType, total_rows)
    local row = math.floor(unit_index / row_size)
    local col = unit_index % row_size
    
    -- Get unit-specific spacing multiplier
    local spacing_multiplier = LAYOUT_CONFIG.SPACING_MULTIPLIERS[unitType] or 1.0
    
    -- Center the formation with unit-specific spacing
    local x_offset = (col - (row_size-1)/2) * LAYOUT_CONFIG.DEFAULT_SPACING * spacing_multiplier
    local z_offset = (row - (total_rows-1)/2) * LAYOUT_CONFIG.DEFAULT_SPACING * spacing_multiplier
    
    return {
        x = base_position[1] + x_offset,
        y = base_position[2],
        z = base_position[3] + z_offset
    }
end

-- Place a single unit and return success status
local function place_unit(nation, unitType, position)
    local bag = getObjectFromGUID(UNITS[nation][unitType].guid)
    if not bag then
        return false
    end
    
    -- First place the unit high above the target position
    local initial_pos = {
        x = position.x,
        y = position.y + LAYOUT_CONFIG.PLACEMENT_HEIGHT,
        z = position.z
    }
    
    local unitObj = bag.takeObject({
        position = initial_pos,
        rotation = {0, 90, 0},
        smooth = true,
        callback_function = function(obj)
            -- Add tags immediately
            obj.addTag("NATION_" .. nation)
            obj.addTag("UNIT")
            obj.addTag("UNIT_" .. unitType)
            
            -- Wait briefly, then lower to final position
            Wait.time(function()
                obj.setPositionSmooth(position)
            end, LAYOUT_CONFIG.DROP_DELAY)
        end
    })
    
    return true
end

-- Setup units for a single territory with delayed placement
local function setup_territory_units(territory, units, position, callback)
    local errors = {}
    
    -- Organize units by type and get total count
    local organized_units, total_units = organize_units_by_type(units)
    
    -- Calculate formation dimensions
    local row_size = math.min(LAYOUT_CONFIG.MAX_UNITS_PER_ROW, math.ceil(math.sqrt(total_units)))
    local total_rows = math.ceil(total_units / row_size)
    
    -- Prepare unit placement queue
    local placement_queue = {}
    local current_index = 0
    
    -- Build placement queue
    for _, unitType in ipairs(LAYOUT_CONFIG.UNIT_TYPES_ORDER) do
        if organized_units[unitType] then
            for _, unit_info in ipairs(organized_units[unitType]) do
                for i = 1, unit_info.count do
                    local unit_position = calculate_unit_position(position, current_index, row_size, unitType, total_rows)
                    table.insert(placement_queue, {
                        nation = unit_info.nation,
                        unitType = unitType,
                        position = unit_position
                    })
                    current_index = current_index + 1
                end
            end
        end
    end
    
    -- Process placement queue with delays
    local function process_queue(index)
        if index > #placement_queue then
            -- Wait additional time for all units to settle before calling callback
            Wait.time(function()
                if callback then callback(errors) end
            end, LAYOUT_CONFIG.DROP_DELAY * 2)
            return
        end
        
        local unit_info = placement_queue[index]
        if not place_unit(unit_info.nation, unit_info.unitType, unit_info.position) then
            table.insert(errors, string.format("Missing unit bag for nation %d, type %d",
                unit_info.nation, unit_info.unitType))
        end
        
        Wait.time(function() process_queue(index + 1) end, LAYOUT_CONFIG.PLACEMENT_DELAY)
    end
    
    -- Start processing queue
    process_queue(1)
end

function setup_units()
    print("Starting unit setup...")
    local setup_errors = {}
    local territories_to_process = {}
    
    -- Build territory processing queue
    for territory, units in pairs(SETUP_UNITS_LAND) do
        local position = POSITION[territory]
        if not position then
            table.insert(setup_errors, "Missing position for territory: " .. territory)
        else
            table.insert(territories_to_process, {
                territory = territory,
                units = units,
                position = position
            })
        end
    end
    
    -- Process territories sequentially
    local function process_territories(index)
        if index > #territories_to_process then
            -- Report final results
            if #setup_errors > 0 then
                print("Unit setup completed with the following errors:")
                for _, error in ipairs(setup_errors) do
                    print("- " .. error)
                end
            else
                print("Unit setup completed successfully")
            end
            return
        end
        
        local territory_info = territories_to_process[index]
        setup_territory_units(
            territory_info.territory,
            territory_info.units,
            territory_info.position,
            function(territory_errors)
                -- Process territory errors
                for _, err in ipairs(territory_errors) do
                    table.insert(setup_errors, 
                        string.format("%s in %s", err, territory_info.territory))
                end
                -- Process next territory
                Wait.time(function()
                    process_territories(index + 1)
                end, LAYOUT_CONFIG.PLACEMENT_DELAY * 2) -- Slightly longer delay between territories
            end
        )
    end
    
    -- Start processing territories
    process_territories(1)
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
-- end