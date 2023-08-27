function onCreate()
    luaDebugMode = true
    makeLuaSprite('town', 'NewNonsense Assets/nonsensica week/back', -2200, -450)
    setScrollFactor('town',0.5,0.5)

    makeLuaSprite('garden', 'NewNonsense Assets/nonsensica week/front', -2700, -680)
    setGraphicSize('garden',getProperty('garden.width') * 1.15)
    setScrollFactor('garden',1,1)

    makeLuaSprite('roomoutside', 'NewNonsense Assets/new_background_outside', -200, -350)
    setGraphicSize('roomoutside',getProperty('roomoutside.width') * 0.8)
    setScrollFactor('roomoutside',0.9,0.9)
    --setProperty('roomoutside.flipX',true)

    makeLuaSprite('roominside', 'NewNonsense Assets/nonsensica week/BACKGROUND-twosense', -950, -400)
    setGraphicSize('roominside',getProperty('roominside.width') * 0.9)
    setScrollFactor('roominside',0.9,0.9)

    makeLuaSprite('crack', 'NewNonsense Assets/nonsensica week/crack', -950, -400)
    setGraphicSize('crack',getProperty('crack.width') * 0.9)



    --Layer
    addLuaSprite('roomoutside', false)
    addLuaSprite('town', false)
    addLuaSprite('garden', false)
    addLuaSprite('roominside', false)
    addLuaSprite('crack', true)
    
end

function onTimerCompleted(tag)
    if tag == 'intro' then
        runHaxeCode('game.iconP2.changeIcon("twosense");')
    end

end

function onSongStart()
    runTimer('intro',0.3)
    doTweenAngle('intro','iconP2',360,0.5, 'quadInOut')
end