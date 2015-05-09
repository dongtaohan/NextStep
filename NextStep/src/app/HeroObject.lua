local HeroObject = {}

function HeroObject.init()
    local heroNodeFile = require "res/HeroNode.lua"
    local result = heroNodeFile.create()
    result.root:runAction(result.animation)
    HeroObject.Node = result.root
    HeroObject.Node:setLocalZOrder(100)
    HeroObject.Animation = result.animation
    
end

local ListView_Block

function HeroObject.start()
    ListView_Block = Services.Static_MainScene["ListView_Block"]
    addButton(0)
    addButton(1)
    addButton(2)
end

local imageList = {"res/Image/Block/Block01.png","res/Image/Block/Block02.png","res/Image/Block/Block03.png"}
local number = 1

function addButton(index)
    local button = ccui.Button:create(imageList[number])
    --button:set
    number = number+1
    if number>3 then
        number=1
    end
    
    ListView_Block:insertCustomItem(button , index)
    button:addTouchEventListener(blockButtonCallback)
    
end

function blockButtonCallback(sender)
    --sender:addTouchEventListener(nil)
    local index=ListView_Block:getIndex(sender)
    ListView_Block:removeItem(index)
    addButton(index)
end

-- JoyStick
function HeroObject.JoyStickCallback(luaFileName, node, callbackName)
	if node:getName()== "ButtonTop" then	    
        return ButtonTopCallback
	end
	
    if node:getName()== "ButtonLeft" then
        return ButtonLeftCallback
    end
    
    if node:getName()== "ButtonDown" then
        return ButtonDownCallback
    end
    
    if node:getName()== "ButtonRight" then
        return ButtonRightCallback
    end
end

function ButtonTopCallback()
    print("Up")
    HeroObject.Animation:play("Up",false) 
    Services.Static_MapObject.MoveTo(UP)  
end

function ButtonLeftCallback()
    print("Left") 
    HeroObject.Animation:play("Left",false)  
    Services.Static_MapObject.MoveTo(LEFT)
end

function ButtonDownCallback()
    print("Down") 
    HeroObject.Animation:play("Down",false)
    Services.Static_MapObject.MoveTo(DOWN)  
end

function ButtonRightCallback()
    print("Right") 
    HeroObject.Animation:play("Right",false) 
    Services.Static_MapObject.MoveTo(RIGHT) 
end
-- JoyStick

return HeroObject