-- turtle.forward()
-- turtle.back()
-- turtle.turnLeft()
-- turtle.turnRight()

local function commands(turtle)
    local i = 1
    while (i <= 8) do
        turtle:forward()
        i = i + 1
    end
    turtle:turnRight()
    turtle:forward()
    turtle:turnRight()
    i = 1
    while (i <= 8) do
        turtle:forward()
        i = i + 1
    end
end

return commands
