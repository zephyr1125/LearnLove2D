io.stdout:setvbuf("no")

function love.load()
	love.graphics.setNewFont(12)
	love.graphics.setColor(0,0,0)
    love.graphics.setBackgroundColor(255,255,255)
end

function love.draw()
	love.graphics.print("Hello World", 400, 300)
end