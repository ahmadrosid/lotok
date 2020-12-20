Background = {}

function Background:load()
    self.universe = love.graphics.newImage("assets/universe.png")
    self.planet = love.graphics.newImage("assets/planets.png")
    self.width = self.planet:getWidth()
    self.height = self.planet:getHeight()
    self.rotation = 0
end

function Background:update(dt)
    self.rotation = self.rotation + 0.05 * dt
end

function Background:draw()
    love.graphics.draw(self.universe,0,0)
    love.graphics.draw(self.planet, self.width / 2, self.height / 2, self.rotation, 1, 1, self.width / 2, self.height / 2)
end