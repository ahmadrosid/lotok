Ball = {}

function Ball:load()
    self.img = love.graphics.newImage("assets/ball.png")
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.speed = 200
    self.xVel = -self.speed
    self.yVel = 0
end

function Ball:update(dt)
    self:move(dt)
    self:checkCollision()
end

function Ball:draw()
    love.graphics.draw(self.img, self.x, self.y)
end

function Ball:move(dt)
    self.x = self.x + self.xVel * dt
    self.y = self.y + self.yVel * dt
end

function Ball:checkCollision()
    self:collisionPlayer()
    self:collisionAI()
    self:collisionWall()
    self:resetPosition()
end

function Ball:collisionPlayer()
    if checkCollision(self, Player) then
        self.xVel = self.speed
        local middleBall = self.y + self.height / 2
        local middlePlayer = Player.y + Player.height / 2
        local collidePosition = middleBall - middlePlayer
        self.yVel = collidePosition * 5
    end
end

function Ball:collisionAI()
    if checkCollision(self, AI) then
        self.xVel = -self.speed
        local middleBall = self.y + self.height / 2
        local middleAI = AI.y + AI.height / 2
        local collidePosition = middleBall - middleAI
        self.yVel = collidePosition * 5
    end
end

function Ball:collisionWall()
    if self.y < 0 then
        self.y = 0
        self.yVel = -self.yVel
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
        self.yVel = -self.yVel
    end
end

function Ball:resetPosition()
    if self.x < 0 then
        self.x = love.graphics.getWidth() / 2 - self.width / 2
        self.y = love.graphics.getHeight() / 2 - self.height / 2
        self.xVel = 0
        self.xVel = self.speed
        Score.ai = Score.ai + 1
    end

    if self.x + self.width > love.graphics.getWidth() then
        self.x = love.graphics.getWidth() / 2 - self.width / 2
        self.y = love.graphics.getHeight() / 2 - self.height / 2
        self.xVel = 0
        self.xVel = -self.speed
        Score.player = Score.player + 1
    end
end