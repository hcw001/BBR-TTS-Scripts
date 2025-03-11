DP = 0.57

--Only triggers for objects with matching tags
function handle_zone_layout(zone, object)
    local countOccupied = #zone.getObjects() - 1
    local corner = {
        x=zone.position.x-3*DP,
        y=zone.poistion.y,
        z=zone.position.z+4*DP
    }
    local nextSlot = {
        x=corner.x+(countOccupied%6)*DP,
        y=corner.y,
        z=corner.z-math.floor(countOccupied/6)*DP
    }
    object.setPosition(nextSlot)
    --group(objects)
end