local constants = require('constants')
local cellSize = constants.game.cellSize

local grid = {
    gridLines = {}
}

function grid:load()
    local w, h = love.graphics.getDimensions()
    for x = 0, w, cellSize do
        local line = { x, 0, x, h }
        table.insert(self.gridLines, line)
    end
    for y = 0, h, cellSize do
        local line = { 0, y, w, y }
        table.insert(self.gridLines, line)
    end
end

function grid:draw()
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.setLineWidth(1)

    for _, line in ipairs(self.gridLines) do
        love.graphics.line(line)
    end
end

return grid
