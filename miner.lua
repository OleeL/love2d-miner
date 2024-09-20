local constants = require("constants")

local cellSize = constants.game.cellSize

local miner = {}

local direction = {
    right = 0,
    down = 1,
    left = 2,
    up = 3,
}

function miner:load()
    self.position = { x = 8, y = 8 }
    self.direction = direction.up
    self.commandQueue = {}
    self.timer = 0
    self.commandInterval = 0.2
end

function miner:draw()
    local x = self.position.x * cellSize
    local y = self.position.y * cellSize
    love.graphics.setColor(255, 0, 0, 255)
    love.graphics.rectangle("fill", x, y, cellSize, cellSize)

    love.graphics.push()

    love.graphics.translate(x + cellSize / 2, y + cellSize / 2)

    love.graphics.rotate(math.rad(self.direction * 90 - 270))

    love.graphics.translate(-cellSize / 2, -cellSize / 2)

    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.rectangle("fill", cellSize * 0.3, cellSize * 0.2, cellSize / 10, cellSize / 10)
    love.graphics.rectangle("fill", cellSize * 0.6, cellSize * 0.2, cellSize / 10, cellSize / 10)

    love.graphics.pop()
end

function miner:forward()
    table.insert(self.commandQueue, function()
        if self.direction == direction.right then
            self.position.x = self.position.x + 1
        elseif self.direction == direction.down then
            self.position.y = self.position.y + 1
        elseif self.direction == direction.left then
            self.position.x = self.position.x - 1
        elseif self.direction == direction.up then
            self.position.y = self.position.y - 1
        end
    end)
end

function miner:back()
    table.insert(self.commandQueue, function()
        if self.direction == direction.right then
            self.position.x = self.position.x - 1
        elseif self.direction == direction.down then
            self.position.y = self.position.y - 1
        elseif self.direction == direction.left then
            self.position.x = self.position.x + 1
        elseif self.direction == direction.up then
            self.position.y = self.position.y + 1
        end
    end)
end

function miner:turnLeft()
    table.insert(self.commandQueue, function()
        self.direction = (self.direction - 1) % 4
        if self.direction < 0 then
            self.direction = direction.up
        end
    end)
end

function miner:turnRight()
    table.insert(self.commandQueue, function()
        self.direction = (self.direction + 1) % 4
    end)
end

function miner:update(dt)
    self.timer = self.timer + dt


    if self.timer >= self.commandInterval then
        self.timer = self.timer - self.commandInterval

        if #self.commandQueue > 0 then
            local command = table.remove(self.commandQueue, 1)
            command()
        end
    end
end

return miner
