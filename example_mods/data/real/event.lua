
function onCreate()
    luaDebugMode = true

end
function onSongStart()

    doTweenZoom('lolintro','camGame',0.7,1,'cubein')

end

function onTweenCompleted(tag)
    if tag == 'lolintro' then
    
        setProperty('defaultCamZoom',0.8)
    end
end

function onStepHit()

    if curStep == 319 or curStep == 351 or curStep == 447 or curStep == 832 or curStep == 1087 then
        setProperty('defaultCamZoom',1)
    end

    if curStep == 335 or curStep == 367 or curStep == 1215 then
        setProperty('defaultCamZoom',1)
    end

    if curStep == 383 or curStep == 1135 then
        doTweenZoom('lolintro','camGame',0.7,3,'cubein')
    end

    if curStep == 1247 then
        setProperty('defaultCamZoom',0.8)
    end


    if curStep == 512 then
        doTweenZoom('lolintro','camGame',0.7,10,'cubein')
    end

end