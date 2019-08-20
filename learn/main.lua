local sti = require "sti"

io.stdout:setvbuf("no")

function love.load()
	-- Load map file
	map = sti("desert.lua")

	-- Create new dynamic data layer called "Sprites" as the 8th layer
	local layer = map:addCustomLayer("Sprites", 8)

	-- Get player spawn object
	local player
	for k, object in pairs(map.objects) do
		if object.name == "Player" then
			player = object
			print("found player")
			break
		end
	end

	-- Create player object
	local sprite = love.graphics.newImage("player.png")
	layer.player = {
		sprite = sprite,
		x = player.x,
		y = player.y,
		ox = sprite:getWidth() / 2,
		oy = sprite:getHeight() / 1.35
	}
	
	-- Draw player
	layer.draw = function(self)
		love.graphics.draw(
			self.player.sprite,
			math.floor(self.player.x),
			math.floor(self.player.y),
			0,
			1,
			1,
			self.player.ox,
			self.player.oy
		)
		print("drawed")

		-- Temporarily draw a point at our location so we know
		-- that our sprite is offset properly
		love.graphics.setPointSize(5)
		love.graphics.points(math.floor(self.player.x), math.floor(self.player.y))
	end

	-- Remove unneeded object layer
	map:removeLayer("Spawn Point")
end

function love.update(dt)
	map:update(dt)
end

function love.draw()
	map:draw()
end