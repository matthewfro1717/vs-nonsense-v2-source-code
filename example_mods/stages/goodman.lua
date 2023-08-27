function onCreate()
    luaDebugMode = true

        setProperty('defaultCamZoom', 0.9)
        makeLuaSprite('wall', 'goodman/sensegoodmanbg', -273.15, -273.15)
        setGraphicSize('wall',getProperty('wall.width') * 1)
        --setScrollFactor('wall',0.3,0.3)

        makeLuaSprite('pillar', 'goodman/SenseGoodmanPillar', 373.15, -293.15)
        setGraphicSize('pillar',getProperty('pillar.width') * 1)

        makeLuaSprite('light', 'goodman/lightsensegoodman', -73.1, -605.7)
        setGraphicSize('light',getProperty('light.width') * 1)
       -- setScrollFactor('wall',0.9,0.9)
       setBlendMode('light','screen')

        makeAnimatedLuaSprite('zac', 'goodman/ZacErhmantraut', -21.6, -69.95)
        setGraphicSize('zac',getProperty('zac.width') * 1)
        --setScrollFactor('zac',1,1)

        playAnim('zac','d',true)
        addLuaSprite('wall', false)
        addLuaSprite('pillar', false)
        addLuaSprite('light', true)
        addLuaSprite('zac', false)

        



end

function onCountdownTick(counter) 
    if counter % 2 == 0 then -- 3
        addAnimationByPrefix('zac','idle','zac idle0',24,false)
        playAnim('zac','idle',true)
    end
end


function onCreatePost()
    setObjectOrder('gf',7)
end

function onBeatHit()
    if curBeat % 2 == 0 then
        playAnim('zac','idle')
    end
    
end


