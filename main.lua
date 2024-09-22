local grid = require("grid")
local turtle = require("turtle")
local keyboard = require("keyboard")
local turtle_commands = require("turtle_commands")

function love.load()
    -- Enable debugger
    DebugMode = false
    if arg[2] == "debug" then
        require("lldebugger").start()
        DebugMode = true
    end
    keyboard:load()
    grid:load()
    turtle:load()
    love.graphics.setBackgroundColor(0.1, 0.1, 0.1)
    turtle_commands(turtle)
end

function love.draw()
    grid:draw()
    turtle:draw()
end

function love.update(dt)
    turtle:update(dt)
    keyboard:isPressed({ "w", "up" }, function()
        turtle:forward()
    end)
    keyboard:isPressed({ "s", "down" }, function()
        turtle:back()
    end)
    keyboard:isPressed({ "a", "left" }, function()
        turtle:turnLeft()
    end)
    keyboard:isPressed({ "d", "right" }, function()
        turtle:turnRight()
    end)
end


local loveErrorhandler = love.errorhandler or love.errhand
function love.errorhandler(msg)
    if DebugMode then
        error(msg, 2)
    else
        return loveErrorhandler(msg)
    end
end