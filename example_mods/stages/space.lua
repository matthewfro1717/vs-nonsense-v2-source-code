local floatwall = 0
function onCreate()
    luaDebugMode = true

    if songName == 'Nonsense'  then
        setProperty('defaultCamZoom', 1)
        makeLuaSprite('outside2', 'Nonsense/Outside_Space', -600, -200)
        setGraphicSize('outside2',getProperty('outside2.width') * 0.8)
        setScrollFactor('outside2',0.8,0.8)
    

        makeAnimatedLuaSprite('inside2', 'Nonsense/BACKGROUND_space', -800, -370)
        setGraphicSize('inside2',getProperty('inside2.width') * 0.9)
        playAnim('inside2','idle',true)
        addAnimationByPrefix('inside2','idle','Wall Broken anim',24,true)
    
        addLuaSprite('outside2', false)
        addLuaSprite('inside2', false)
    else
        makeLuaSprite('outside', 'NewNonsense Assets/space', -500, -500)
        scaleObject('outside', 1, 0.8)
        setScrollFactor('outside',0.5,0.5)
    
        makeLuaSprite('inside', 'NewNonsense Assets/SpaceWallDown', -600, 100)
        scaleObject('inside', 1, 0.9)
        setScrollFactor('inside',0.95,0.95)
    
        makeLuaSprite('wallUP', 'NewNonsense Assets/SpaceWallUp', -600, -500)
        scaleObject('wallUP', 1, 0.9)
        setScrollFactor('wallUP',0.95,0.95)
        
        addLuaSprite('outside', false)
        addLuaSprite('inside', false)
        addLuaSprite('wallUP', false)
    end



end

function onUpdate(elapsed)    
songPos = getSongPosition()


local currentBeat = (songPos/1000)*(curBpm/60)
floatwall = floatwall + 0.02

doTweenY('flying', 'dad', -100 - 150* math.sin((songPos/1000)*(curBpm/60)*2.0), 1)

if songName ~= 'Nonsense' then
    doTweenY('fly2','wallUP',-540 - 150*math.cos((songPos/1000)*(curBpm/60)*2.0),1)
end


end