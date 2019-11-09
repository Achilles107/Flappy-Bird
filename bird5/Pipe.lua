Pipe = Class{}

local PIPE_IMAGE = love.graphics.newImage('pipe.png')

local PIPE_SCROLL = -60

function Pipe:init()
	self.x = VIR_WIDTH
	self.y = math.random(VIR_HEIGHT / 4, VIR_HEIGHT - 10)

	self.width = PIPE_IMAGE:getWidth()
	self.heigth = PIPE_IMAGE:getHeight()
end

function Pipe:update(dt)
	self.x = self.x + PIPE_SCROLL * dt
end

function Pipe:render()
	love.graphics.draw(PIPE_IMAGE, self.x, self.y)
end