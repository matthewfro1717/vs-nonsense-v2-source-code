function onCreate()
    luaDebugMode = true
    makeLuaSprite('outside', 'NewNonsense Assets/new_background_outside', -700, -350)
    scaleObject('outside', 1, 0.8)
    setScrollFactor('outside',0.9,0.9)

    makeLuaSprite('inside', 'NewNonsense Assets/new_background', -650, -400)
    scaleObject('inside', 1, 0.9)

    addLuaSprite('outside', false)
    
    addLuaSprite('inside', false)

    if songName == 'Logical'  then
        setProperty('defaultCamZoom', 1)
        makeLuaSprite('outside2', 'NewNonsense Assets/Logical/pirateback', -1000, -260)
        scaleObject('outside2', 1, 0.8)
        setScrollFactor('outside2',0.9,0.9)
    
        makeLuaSprite('inside2', 'NewNonsense Assets/Logical/piratefront', -920, -250)
        scaleObject('inside2', 1, 0.75)
    
        addLuaSprite('outside2', false)
        addLuaSprite('inside2', false)

        setProperty('outside2.alpha',0)
        setProperty('inside2.alpha',0)
    elseif songName == 'Rethink' then
        --BACKGROUND
        makeLuaSprite('clockfloat', 'NewNonsense Assets/rethink/clockwall', -1267, -362.3)

    
        makeLuaSprite('debrissmall', 'NewNonsense Assets/rethink/nuts', -600.15, -227.6)
        setScrollFactor('debrissmall',0.95,0.95)

        makeLuaSprite('debrissmall2', 'NewNonsense Assets/rethink/shar2', -150.15, -200.5)

        makeLuaSprite('plaque', 'NewNonsense Assets/rethink/plaque', 1746.65, -265.75)
        setProperty('plaque.angle',20)

        makeLuaSprite('normaltrashcan', 'NewNonsense Assets/rethink/trashfloat', 1000.65, 0)
        setScrollFactor('normaltrashcan',0.9,0.9)

        makeLuaSprite('joeyDoll', 'NewNonsense Assets/rethink/joey', 2300, 700)

        setScrollFactor('joeyDoll',1.2,1.2)

        makeLuaSprite('debrisbf', 'NewNonsense Assets/rethink/debrisbf', 0.8, -200)

        makeLuaSprite('debrisdad', 'NewNonsense Assets/rethink/debrisnh', -1376.8, 518.75)

        makeLuaSprite('debrisgf', 'NewNonsense Assets/rethink/floorgf', -137.35, 234.45)
        setScrollFactor('debrisgf',0.8,0.8)

        makeAnimatedLuaSprite('staticbg', 'NewNonsense Assets/rethink/static', -1000, -600)

        setScrollFactor('staticbg',0.5,0.5)
        addAnimationByPrefix('staticbg','static','static0',24,true) 
        playAnim('staticbg','static')

        --ADD OBJECT AND ORDER
        addLuaSprite('staticbg', false)
        addLuaSprite('plaque', false)
        addLuaSprite('debrisgf', false)
        addLuaSprite('debrissmall2', false)
        addLuaSprite('debrissmall', false)
        addLuaSprite('debrisbf', false)
        addLuaSprite('debrisdad', false)

        addLuaSprite('joeyDoll', true)


        setProperty('staticbg.alpha',0)
        setProperty('plaque.alpha',0)
        setProperty('debrisgf.alpha',0)
        setProperty('debrissmall2.alpha',0)
        setProperty('debrissmall.alpha',0)
        setProperty('debrisbf.alpha',0)
        setProperty('debrisdad.alpha',0)
        setProperty('joeyDoll.alpha',0)

        --HUD EFFECT
        makeAnimatedLuaSprite('ostatic', 'NewNonsense Assets/rethink/ostatic', 0, 0)
        scaleObject('ostatic', 2, 2)
        setScrollFactor('ostatic',0.5,0.5)
        addAnimationByPrefix('ostatic','static','stat0',24,true) 
        playAnim('ostatic','static')
        addLuaSprite('ostatic',true)
        setProperty('ostatic.alpha',0)
        setObjectCamera('ostatic','hud')

    end
end