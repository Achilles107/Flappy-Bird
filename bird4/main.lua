push = require 'push'
Class = require 'class'

require 'Bird'

WIN_WIDTH = 1280
WIN_HEIGHT = 720

VIR_WIDTH = 512
VIR_HEIGHT = 288

local background = love.graphics.newImage('background.png')
local backgroundScroll = 0
local ground = love.graphics.newImage('ground.png')
local groundScroll = 0

local BACK_SCROLL_SPEED = 30
local GROUND_SCROLL_SPEED = 60

local BACK_LOOP = 413

local bird = Bird()
-- load first
function love.load()
	love.graphics.setDefaultFilter('nearest', 'nearest')
	love.window.setTitle('Flappy Bird')

	push:setupScreen(VIR_WIDTH, VIR_HEIGHT, WIN_WIDTH, WIN_HEIGHT, {
		vsync = true,
		fullscreen = false,
		resizeable = true
		})

	love.keyboard.keyPressed = {}
end

--resize according to width and height
function love.resize(w, h)
	psuh:resize(w, h)
end

-- user input
function love.keypressed(key)
	love.keyboard.keyPressed[key] = true
	if key == 'escape' then
		love.event.quit()
	end
end

--return true or false for key pressed
function love.keyboard.wasKeyPressed(key)
	return love.keyboard.keyPressed[key]
end
function love.update(dt)
	backgroundScroll = (backgroundScroll + BACK_SCROLL_SPEED * dt)
		% BACK_LOOP

	groundScroll = (groundScroll + GROUND_SCROLL_SPEED * dt)
		% VIR_WIDTH

	bird:update(dt)
	love.keyboard.keyPressed = {}
end

--render function
function love.draw()
	push:start()
	love.graphics.draw(background, -backgroundScroll, 0)
	love.graphics.draw(ground, -groundScroll, VIR_HEIGHT-16)
	bird:render()
	push:finish()
end