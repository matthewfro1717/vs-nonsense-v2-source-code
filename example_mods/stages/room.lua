function onCreate()
    luaDebugMode = true
    makeLuaSprite('outside', 'Nonsense/Outside', -500, 40)
    setGraphicSize('outside',getProperty('outside.width') * 0.8)
    setScrollFactor('outside',0.9,0.9)

    makeLuaSprite('inside', 'Nonsense/BACKGROUND', -700, -370)
    setGraphicSize('inside',getProperty('inside.width') * 0.9)

    addLuaSprite('outside', false)
    addLuaSprite('inside', false)
end