function onCreatePost()
    --textt 
    makeLuaText('textt', 'Come on!', 0, 0, 0)
    --Text Setting
    setProperty('textt.y',500)
    setTextAlignment('textt', 'center')
    setTextWidth('textt', getTextWidth('scoreTxt'))
    setTextBorder('textt',4,'000000')
    setTextSize('textt', 40)
    setTextFont('textt','PRIMETIME.ttf')
    screenCenter('textt','xy')
    setProperty('textt.alpha',0)
    addLuaText('textt')
    setObjectCamera('textt', 'other')
    setProperty('textt.angle',360)

    textscalex = getProperty('textt.scale.x')
    textscaley = getProperty('textt.scale.y')

    
end




function onTweenCompleted(tag)

    if tag == 'start' then
        setProperty('defaultCamZoom',1.1)
    end

    if tag == 'off' then
        setProperty('defaultCamZoom',0.7)
    end

    if tag == 'bff' then
        setProperty('defaultCamZoom',0.8)
    end

end

function onSongStart()

    doTweenZoom('start','camGame',1,6,'cubein')
end


function onStepHit()

    if curStep == 58 then
        forcecam('gf')
    end

    if curStep == 60 then
        comeon()
    end

    if curStep == 64 then
        cancelTween('start')
        doTweenZoom('off','camGame',0.7,0.4,'cubeout')
        cameraFlash('game','FFFFFF',0.3,true)
        forcecam('dad')
    end

    if curStep == 127 or curStep == 416 then
        doTweenZoom('bff','camGame',0.9,0.4,'cubeout')
    end

    if curStep == 142 then
        doTweenZoom('off','camGame',0.65,0.4,'cubeout')
    end

    if curStep == 188 then
        setProperty('defaultCamZoom',1.1)
        setProperty('cameraSpeed',3)
        triggerEvent('Play Animation','eventohyeah','dad')
        forcecam('dad')
    end

    if curStep == 224 or curStep == 288 then
        doTweenZoom('off','camGame',1,1,'cubein')
    end

    if curStep == 305 then
        doTweenZoom('off','camGame',2,6,'cubein')
    end

    


    if curStep == 348 then
        setProperty('defaultCamZoom',1.1)
        setProperty('cameraSpeed',3)
        triggerEvent('Play Animation','eventthatsright','dad')
    end

    if curStep == 444 then
        setProperty('defaultCamZoom',1.1)
        setProperty('cameraSpeed',3)
        triggerEvent('Play Animation','eventlaugh','dad')
        forcecam('dad')
    end

    if curStep == 432 then
        doTweenZoom('off','camGame',0.7,3,'cubein')
    end

    if curStep >= 445 and curStep < 447 then
        triggerEvent('Play Animation','eventlaugh','dad')
    end

    if curStep == 192 or curStep == 256 or curStep == 320 or curStep == 352 or curStep == 448 then
        doTweenZoom('off','camGame',0.65,0.4,'cubeout')
        if curStep ~= 352 then
            cameraFlash('game','FFFFFF',0.3,true)
        end

        setProperty('cameraSpeed',1)
        if curStep ~= 448 then
            forcecam('bf')
        end
        
    end

    if curStep == 512 or curStep == 576 then
        cameraFlash('game','FFFFFF',0.3,true)
    end

    if curStep == 584 then
        triggerEvent('Play Animation','hey','boyfriend')
    end

end

function forcecam(who)
    if who == 'dad' then
        runHaxeCode([[
            game.moveCamera(true,false);
            game.callOnLuas('onMoveCamera', ['dad']);
        ]])
        
    elseif who == 'bf' then
        runHaxeCode([[
            game.moveCamera(false,false);
            game.callOnLuas('onMoveCamera', ['boyfriend']);
        ]])
    elseif who == 'gf' then
        runHaxeCode([[
            game.moveCamera(true,true);
            game.callOnLuas('onMoveCamera', ['gf']);
        ]])
    else
        triggerEvent('Camera Follow Pos' , '', '')
    end
end


function comeon()

    setProperty('textt.alpha',1)
    --doTweenAngle('lol2','textt',0,0.3,'quadInOut')
    setProperty('textt.scale.x', 2.1)
    setProperty('textt.scale.y', 2.1)
    doTweenX('pop','textt.scale', 1,0.5,'quadInOut')
    doTweenY('pop2','textt.scale', 1,0.5,'quadInOut')
    doTweenAlpha('pop3','textt',0,0.45,'cubein')

end
