push = require 'push'

WIN_WIDTH = 1280
WIN_HEIGHT = 720

VIR_WIDTH = 512
VIR_HEIGHT = 288

local background = love.graphics.newImage('background.png')
local ground = love.graphics.newImage('ground.png')

-- load first
function love.load()
	love.graphics.setDefaultFilter('nearest', 'nearest')
	love.window.setTitle('Flappy Bird')

	push:setupScreen(VIR_WIDTH, VIR_HEIGHT, WIN_WIDTH, WIN_HEIGHT, {
		vsync = true,
		fullscreen = false,
		resizeable = true
		})
end

--resize according to width and height
function love.resize(w, h)
	psuh:resize(w, h)
end

-- user input
function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
end

--render function
function love.draw()
	push:start()
	love.graphics.draw(background, 0, 0)
	love.graphics.draw(ground,0, VIR_HEIGHT-16)
	push:finish()
end