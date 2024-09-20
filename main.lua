local grid = require("grid")
local miner = require("miner")
local keyboard = require("keyboard")
local miner_commands = require("miner_commands")

function love.load()
    keyboard:load()
    grid:load()
    miner:load()
    love.graphics.setBackgroundColor(0.1, 0.1, 0.1)
    miner_commands(miner)
end

function love.draw()
    grid:draw()
    miner:draw()
end

function love.update(dt)
    miner:update(dt)
    keyboard:isPressed({ "w", "up" }, function()
        miner:forward()
    end)
    keyboard:isPressed({ "s", "down" }, function()
        miner:back()
    end)
    keyboard:isPressed({ "a", "left" }, function()
        miner:turnLeft()
    end)
    keyboard:isPressed({ "d", "right" }, function()
        miner:turnRight()
    end)
end
