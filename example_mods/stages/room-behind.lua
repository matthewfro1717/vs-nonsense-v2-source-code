function onCreate()
    luaDebugMode = true
    makeLuaSprite('outside', 'NewNonsense Assets/BACKGROUND_behind', -650, -270)
    setGraphicSize('outside',getProperty('outside.width') * 0.55)
    setScrollFactor('outside',0.9,0.9)

    makeLuaSprite('inside', 'NewNonsense Assets/stopsign', -350, -330)
    setGraphicSize('inside',getProperty('inside.width') * 0.6)
    setScrollFactor('inside',1.2,1.2)

    addLuaSprite('outside', false)
    
    addLuaSprite('inside', true)
end