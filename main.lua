require "player"
require "ball"
require "ai"
require "background"

function love.load()
    Background:load()
    Player:load()
    Ball:load()
    AI:load()
    Score = { player = 0, ai = 0}
    font = love.graphics.newFont(30)
end

function love.update(dt)
    Background:update(dt)
    Player:update(dt)
    Ball:update(dt)
    AI:update(dt)
    if love.keyboard.isDown("escape") then
        love.event.quit()
    end
end

function love.draw()
    Background:draw()
    Player:draw()
    Ball:draw()
    AI:draw()
    DrawScore()
end

function checkCollision(a, b)
    if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
        return true
    else 
        return false
    end
end

function DrawScore()
    love.graphics.setFont(font)
    love.graphics.print("Player : "..Score.player, 50, 50)
    love.graphics.print("AI : "..Score.ai, 1230 - AI.width, 50)
end