function love.conf(t)
    t.window.title = "2D Mining simulator" -- The window title
    t.window.width = 800                   -- Window width
    t.window.height = 800                  -- Window height
    t.window.resizable = true              -- Let the window be resized
    t.window.fullscreen = false            -- Don't start in fullscreen mode

    t.version = "11.4"                     -- The LÖVE version your game is made for

    -- Enable/disable modules
    t.modules.audio = true     -- Enable the audio module (boolean)
    t.modules.event = true     -- Enable the event module (boolean)
    t.modules.graphics = true  -- Enable the graphics module (boolean)
    t.modules.image = true     -- Enable the image module (boolean)
    t.modules.joystick = false -- Disable joystick support (boolean)
    t.modules.keyboard = true  -- Enable keyboard input (boolean)
    t.modules.math = true      -- Enable math functions (boolean)
    t.modules.mouse = true     -- Enable mouse support (boolean)
    t.modules.physics = false  -- Disable physics engine (boolean)
    t.modules.sound = true     -- Enable sound (boolean)
    t.modules.system = true    -- Enable system-related calls (boolean)
    t.modules.timer = true     -- Enable timers (boolean)
    t.modules.window = true    -- Enable the window module (boolean)
end
