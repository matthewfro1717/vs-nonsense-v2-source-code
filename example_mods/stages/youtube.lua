local onyoutube = false;
function onCreate()
    -- for intro --
    setProperty('defaultCamZoom',0.8)

    -- Object --
    luaDebugMode = true
    makeLuaSprite('bg', 'NewNonsense Assets/repost/youtubeBG', -440, -180)
    setGraphicSize('bg',getProperty('bg.width') * 1.4)

    makeLuaSprite('ytEndCard', 'NewNonsense Assets/repost/YTEndStuff1', -230, 0)

    makeLuaSprite('ytEndCard1', 'NewNonsense Assets/repost/YTEndStuff2', 0, 0)

    makeLuaSprite('ytEndCard2', 'NewNonsense Assets/repost/YTEndStuff3', 920, 0)

    screenCenter('ytEndCard','y')
    screenCenter('ytEndCard1','xy')
    screenCenter('ytEndCard2','y')
    
    setProperty('ytEndCard.alpha',0)
    setProperty('ytEndCard1.alpha',0)
    setProperty('ytEndCard2.alpha',0)

    setObjectCamera('ytEndCard','other')
    setObjectCamera('ytEndCard1','other')
    setObjectCamera('ytEndCard2','other')


    --Layer
    addLuaSprite('bg', false)

    addLuaSprite('ytEndCard', true)
    addLuaSprite('ytEndCard1', true)
    addLuaSprite('ytEndCard2', true)


    
end




function onStepHit()
    if curStep == 526 then
        triggerEvent('Change Character', '0', 'bf-dead')
        triggerEvent('Play Animation','firstDeath','boyfriend')
        playSound('fnf_loss_sfx',1,'end')
    
        setProperty('dad.alpha', 0)
        setProperty('bg.alpha', 0)
        setProperty('camHUD.alpha', 0)
    
    end

    if curStep == 529 then
        onyoutube = true
        setProperty('camOther.zoom',0.6)
        hitboxyt1x = getProperty('ytEndCard.x')
        hitboxyt1y = getProperty('ytEndCard.y')
    
        hitboxyt2x = getProperty('ytEndCard1.x')
        hitboxyt2y = getProperty('ytEndCard1.y')
    
        hitboxyt3x = getProperty('ytEndCard2.x')
        hitboxyt3y = getProperty('ytEndCard2.y')
    
        setProperty('ytEndCard.alpha',1)
        setProperty('ytEndCard1.alpha',1)
        setProperty('ytEndCard2.alpha',1)
    
        doTweenAlpha('goyt','ytEndCard',1,0.3,'cubein')
        doTweenAlpha('goyt32','ytEndCard1',1,0.3,'cubein')
        doTweenAlpha('goyt3','ytEndCard2',1,0.3,'cubein')
        stopSound('end')
        setProperty('camGame.alpha', 0)
        setPropertyFromClass('flixel.FlxG',"mouse.visible",true)
   end
end

function onUpdate()
    if onyoutube then
        local mouseX, mouseY = getMouseX('other'), getMouseY('other')
        if mouseClicked('left') then
            -- How To Funk
            if mouseX > getProperty('ytEndCard.x') and mouseX < getProperty('ytEndCard.x')+getProperty('ytEndCard.width') and mouseY > getProperty('ytEndCard.y') and mouseY < getProperty('ytEndCard.y')+getProperty('ytEndCard.height') then
                runHaxeCode([[FlxG.openURL('https://www.youtube.com/watch?v=0hEel48tZFA');]])
            end

            -- Sub to Nonsense 
            if mouseX > getProperty('ytEndCard1.x') and mouseX < getProperty('ytEndCard1.x')+getProperty('ytEndCard1.width') and mouseY > getProperty('ytEndCard1.y') and mouseY < getProperty('ytEndCard1.y')+getProperty('ytEndCard1.height') then
                runHaxeCode([[FlxG.openURL('https://www.youtube.com/c/NonsenseHumorLOL?sub_confirmation=1');]])
            end

            --PIZZA TOWER!!!!!!!!
            if mouseX > getProperty('ytEndCard2.x') and mouseX < getProperty('ytEndCard2.x')+getProperty('ytEndCard2.width') and mouseY > getProperty('ytEndCard2.y') and mouseY < getProperty('ytEndCard2.y')+getProperty('ytEndCard2.height') then
                runHaxeCode([[FlxG.openURL('https://www.youtube.com/watch?v=HCCyNOKnvQ4');]])
            end
        end
    end


end
