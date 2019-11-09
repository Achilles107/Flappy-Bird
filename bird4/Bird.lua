Bird = Class{}
local Gravity = 20
local ANTI_GRAVITY = -5
function Bird:init()
	self.image =  love.graphics.newImage('bird.png')
	self.width = self.image:getWidth()
	self.height = self.image:getHeight()

	self.x = VIR_WIDTH / 2 - (self.width / 2)
	self.y = VIR_HEIGHT /2 - (self.height /2)
	self.dy = 0
end

--render the bird image
function Bird:render()
	love.graphics.draw(self.image, self.x, self.y)
end

-- defines the motion of a bird
function Bird:update(dt)
	self.dy = self.dy + Gravity *dt

	-- if space is pressed then bird should go up
	if love.keyboard.wasKeyPressed('space') then
		self.dy = ANTI_GRAVITY
	end
	self.y = self.y + self.dy
end