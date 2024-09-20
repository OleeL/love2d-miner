local keyboard = {}

function keyboard:load()
    self.pressedKeys = {}
end

local function isKeyInPressedKeys(key, pressedKeys)
    for _, v in ipairs(pressedKeys) do
        if v == key then
            return true
        end
    end
    return false
end

local function removeKeyFromPressedKeys(key, pressedKeys)
    for i, v in ipairs(pressedKeys) do
        if v == key then
            table.remove(pressedKeys, i)
            return
        end
    end
end

function keyboard:isDown(keys, action)
    for _, key in ipairs(keys) do
        if not isKeyInPressedKeys(key, self.pressedKeys) and love.keyboard.isDown(key) then
            table.insert(self.pressedKeys, key)
            action()
            return
        end
    end
end

function keyboard:isUp(keys, action)
    for _, key in ipairs(keys) do
        if isKeyInPressedKeys(key, self.pressedKeys) and not love.keyboard.isDown(key) then
            removeKeyFromPressedKeys(key, self.pressedKeys)
            action()
            return
        end
    end
end

function keyboard:isPressed(keys, action)
    for _, key in ipairs(keys) do
        if not isKeyInPressedKeys(key, self.pressedKeys) and love.keyboard.isDown(key) then
            table.insert(self.pressedKeys, key)
            action()
            return
        elseif isKeyInPressedKeys(key, self.pressedKeys) and not love.keyboard.isDown(key) then
            removeKeyFromPressedKeys(key, self.pressedKeys)
        end
    end
end

return keyboard
