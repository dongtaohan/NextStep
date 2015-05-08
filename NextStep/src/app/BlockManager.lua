
LEFT  = 2
UP    = 3
RIGHT = 5
DOWN  = 7

BLOCKTYPE_NORMAL = 100
BLOCKTYPE_EXIT = 101
BLOCKTYPE_TREASURE = 101

BlockMask={
Block01 = LEFT,
Block02 = UP,
Block03 = RIGHT,
Block04 = DOWN,
Block05 = LEFT * UP,
Block06 = UP * RIGHT,
Block07 = RIGHT * DOWN,
Block08 = DOWN * LEFT,
Block09 = UP * DOWN,
Block10 = LEFT * RIGHT,
Block11 = LEFT * UP * RIGHT,
Block12 = UP * RIGHT * DOWN,
Block13 = LEFT * RIGHT * DOWN,
Block14 = LEFT * UP * DOWN,
Block15 = LEFT * UP * RIGHT * DOWN,
}

local blockManager = {}

function blockManager.IsMatch(direction, blockMask)
    local remainder = math.fmod(blockMask, direction)
    return remainder == 0
end

local function CreatBlock(blockMask, blockType, node)
    local block = {}
    block.Mask = blockMask
    block.Type = blockType
    block.Node = node
    return block
end

function blockManager.CreateNormalBlock()
    local blockMask = math.random(1, 15)
    local key = 'Block' .. string.format("%02d.png", blockMask)
    local node = cc.Sprite:create('Image/Block/' .. key)
    return CreatBlock(blockMask, BLOCKTYPE_NORMAL, node)
end

function blockManager.CreateExitBlock()
    return CreatBlock(0, BLOCKTYPE_EXIT, cc.Sprite:create('Image/Block/ExitBlock.png'))
end

function blockManager.CreateTreasureBlock()
    return CreatBlock(0, BLOCKTYPE_TREASURE, cc.Sprite:create('Image/Other/Treasure.png'))
end

return blockManager

--[[
-- some test codes

function blockManager.CreateTestNode()
    return cc.Sprite:create('Image/Block/Block01.png')
end

]]