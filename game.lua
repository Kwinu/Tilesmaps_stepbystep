local Game = {}

local MAP_WIDTH = 10
local MAP_HEIGHT = 10
local TILE_WIDTH = 70
local TILE_HEIGHT = 70

Game.map = {}

Game.map = {
    {2, 0, 0, 2, 2, 2, 2, 2, 2, 2},
    {2, 1, 2, 5, 5, 5, 5, 2, 1, 2},
    {2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
    {2, 2, 4, 4, 4, 4, 4, 4, 2, 2},
    {2, 2, 2, 2, 3, 3, 2, 2, 2, 2},
    {2, 2, 2, 2, 3, 3, 2, 2, 2, 2},
    {2, 2, 4, 4, 4, 4, 4, 4, 2, 2},
    {2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
    {2, 1, 2, 5, 5, 5, 5, 5, 1, 2},
    {2, 2, 2, 2, 2, 2, 2, 2, 2, 2}
}

Game.TileTextures = {}

function Game.Load()
    print("Game : chargement des textures...")
    Game.TileTextures[0] = nil
    Game.TileTextures[1] = love.graphics.newImage("images/grassCenter.png")
    Game.TileTextures[2] = love.graphics.newImage("images/liquidLava.png")
    Game.TileTextures[3] = love.graphics.newImage("images/liquidWater.png")
    Game.TileTextures[4] = love.graphics.newImage("images/snowCenter.png")
    Game.TileTextures[5] = love.graphics.newImage("images/stoneCenter.png")
    print("Game : chargement des textures terminées...")
end

function Game.draw()
    local c, l
    for l = 1, MAP_HEIGHT do
        for c = 1, MAP_WIDTH do
            local id = Game.map[l][c]
            local textures = Game.TileTextures[id]
            if textures ~= nil then
                love.graphics.draw(textures, (c - 1) * TILE_WIDTH, (l - 1) * TILE_HEIGHT)
            end
        end
    end

    local x = love.mouse.getX()
    local y = love.mouse.getY()
    local col = math.floor(x / TILE_WIDTH) + 1
    local line = math.floor(y / TILE_HEIGHT) + 1
    if col > 0 and col <= MAP_WIDTH and line > 0 and line <= MAP_HEIGHT then
        local id = Game.map[line][col]
        love.graphics.print("ID TILE : " .. tostring(id), 20, screenHeight - 20)
    else
        love.graphics.print("Hors du tableau", 20, screenHeight - 20)
    end
end

return Game
