local truckpassed = 0
function onCreate()
    luaDebugMode = true
    makeLuaSprite('town', 'nonsensica week/back', -500, -450)
    setScrollFactor('town',0.5,0.5)

    makeLuaSprite('garden', 'nonsensica week/front', -700, -500)
    setScrollFactor('garden',1,1) 
    setGraphicSize('garden',getProperty('garden.width') * 1.15)

    makeLuaSprite('truck','nonsensica week/truck', -1500, 0)
    setScrollFactor('truck',0.5, 0.5) 
    --Layer

    addLuaSprite('town', false)
    
    addLuaSprite('truck', false)
    
    addLuaSprite('garden', false)
    
end

function onCreatePost()
    if songName == 'Nonsensica' then
        setProperty('gf.visible',false)
    end

end

function vroommmmm()
    truckpassed = 1
    doTweenX('vrom','truck',getProperty('truck.x') + 4000,10)
end

function onTimerCompleted(tag, loops, loopsLeft)

    if tag == 'ohno' then
        truckpassed = 0
        setProperty('truck.x', getProperty('truck.x') - 4000)
        cancelTween('vrom')
    end

end

function onBeatHit()

    if truckpassed < 1 then
        vroommmmm()
        timer = math.random(20,50)
        runTimer('ohno',timer)
    end

end
