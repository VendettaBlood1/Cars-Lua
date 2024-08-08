local tank = peripheral.wrap("front")
local controller = peripheral.wrap("back")

-- chain gearshift toggle system
redstone.setOutput("front", false)

local function gearshift_logic()
    if controller.getButton(1) then
        redstone.setOutput("front", true)
        sleep(0.05)
    elseif controller.getButton(3) then
        redstone.setOutput("front", false)
        sleep(0.05)
    end

end

-- control loop
while true do
    gearshift_logic()

    if controller.getAxis(6) > 0 and controller.hasUser() then
        tank.pushFluid("right")
        tank.pullFluid("left")
    elseif controller.getAxis(5) > 0 and controller.hasUser() then
        tank.pushFluid("left")
        tank.pullFluid("right")
    else
        tank.pullFluid("right")
        tank.pullFluid("left")
        sleep(0.05)
    end
end
