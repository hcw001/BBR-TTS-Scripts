require('./src/Assets/Setup')
require('./src/Assets/Units')
require('./src/Assets/Positions')

function setup_units()
    for territory, units in pairs(SETUP_UNITS_LAND) do
        local position = POSITION[territory]
        for index, unitDesc in ipairs(units) do
            local nation, unitType, unitCount = table.unpack(unitDesc)
            for i =1, unitCount do
                --Place Unit
                local bag = getObjectFromGUID(UNITS[nation][unitType].guid)
                local unitObj = bag.takeObject({
                    position= position
                })
                --Add Tags to Unit
                unitObj.addTag("NATION_" ..nation)
                unitObj.addTag("UNIT")
                unitObj.addTag("UNIT_" ..unitType)
                unitObj.setLock(true)
            end
        end
    end
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