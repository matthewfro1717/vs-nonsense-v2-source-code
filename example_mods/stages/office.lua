local natedie = false
function onCreate()
    luaDebugMode = true

        setProperty('defaultCamZoom', 0.9)
        makeLuaSprite('sky', 'office/SUN', -450, -200)
        setScrollFactor('sky',0.3,0.3)

        makeLuaSprite('wall', 'office/WALL', -425, -200)
        setScrollFactor('wall',0.9,0.9)

        makeLuaSprite('table', 'office/TABLE', -460, 520)
        setScrollFactor('table',1,1)

        makeLuaSprite('floor', 'office/floor', -375, 700)
        setScrollFactor('floor',1,1)

        makeLuaSprite('chair', 'office/CHAIR', -500, 515)
        setScrollFactor('chair',1,1)

        makeLuaSprite('laptop', 'office/m', -275, 400)
        setScrollFactor('laptop',1,1)

        makeLuaSprite('nate', 'office/NaeFall', 300, -1000)
        setScrollFactor('nate',0.9,0.9)
    

        makeAnimatedLuaSprite('water', 'office/water', 915, 200)
        setScrollFactor('water',1,1)
        addAnimationByPrefix('water','idle','BUTTSEX instance 1',24,true)
    
        makeAnimatedLuaSprite('city', 'office/NONSENSEBG3', -600, -200)
        setScrollFactor('city',0.6,0.6)
        addAnimationByPrefix('city','idle','BUILDING',24,true)

        addLuaSprite('sky', false)
        addLuaSprite('city', false)
        addLuaSprite('nate', false)
        addLuaSprite('wall', false)
        addLuaSprite('floor', false)
        addLuaSprite('water', false)
        addLuaSprite('table', false)
        addLuaSprite('laptop', false)
        addLuaSprite('chair', false)



end

function onBeatHit()
    playAnim('water','idle',true)
end

function onStepHit()
    
    if curStep == math.random(10,1305) and not natedie then

        doTweenY('NO','nate',getProperty('nate.y') + 1600,0.4)
        natedie = true
        playSound('nat')
        debugPrint('HugeNate fell from a high place')
    end

    if curStep == 1203 then
        playSound('die')
    end


end
