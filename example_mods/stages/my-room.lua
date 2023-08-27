function onCreate()
    -- for intro --
    setProperty('defaultCamZoom',1.4)

    -- Object --
    luaDebugMode = true
    makeLuaSprite('roomin', 'dontlookhere/bagroud', -700, -370)
    setGraphicSize('roomin',getProperty('roomin.width') * 0.9)

    makeLuaSprite('des', 'dontlookhere/des', -100, 280)
    setGraphicSize('des',getProperty('des.width') * 0.8)

    makeLuaSprite('green', 'dontlookhere/gredreen', -500, -50)
    setGraphicSize('green',getProperty('green.width') * 0.75)

    makeLuaSprite('cam', 'dontlookhere/camra', 900, 200)
    setGraphicSize('cam',getProperty('cam.width') * 0.6)
    setScrollFactor('cam',0.9,0.9)

    makeLuaSprite('bulb', 'dontlookhere/lite', 600, -120)
    setGraphicSize('bulb',getProperty('bulb.width') * 0.7)
    setScrollFactor('bulb',1.1,1.1)

    makeLuaSprite('lightshadings', 'dontlookhere/shadr', -440, -110)
    setGraphicSize('lightshadings',getProperty('lightshadings.width') * 0.7)
    setScrollFactor('lightshadings',1.1,1.1)
    setProperty('lightshadings.alpha',0.5)
    setProperty('lightshadings.blend','BlendMode.ADD')

    makeLuaSprite('chair', 'dontlookhere/gamr char', 900, 300)
    setGraphicSize('chair',getProperty('chair.width') * 0.9)
    setScrollFactor('chair',1.2,1.2)

    makeLuaSprite('ring', 'dontlookhere/ring', -1000, 200)
    setGraphicSize('ring',getProperty('ring.width') * 0.9)
    setScrollFactor('ring',1.2,1.2)



    --Layer
    addLuaSprite('roomin', false)
    addLuaSprite('des', false)
    addLuaSprite('green', false)
    addLuaSprite('cam', false)
    addLuaSprite('bulb', false)

    addLuaSprite('lightshadings', true)
    addLuaSprite('ring', false)
    addLuaSprite('chair', false)

    
end