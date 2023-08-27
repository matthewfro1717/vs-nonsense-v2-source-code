function onCreate()
    luaDebugMode = true
    addCharacterToList('gf-event','dad') 
    addCharacterToList('gf-mic','dad')
end

function onCreatePost()
    setProperty('showRating',false)
    setProperty('showComboNum',false)
end

function onStepHit()

    if curStep == 120 then
        runHaxeCode([[
                    game.moveCamera(true,false);
                    game.callOnLuas('onMoveCamera', ['dad']);
                ]])
        doTweenZoom('shesay','camGame',1.2,0.5,'cubein')
    end

    if curStep == 124 then
        triggerEvent('Change Character', '1', 'gf-event')
        triggerEvent('Play Animation','eventalr','dad')

    end

    if curStep == 128 then
        triggerEvent('Change Character', '1', 'gf-new')
        triggerEvent('Camera Follow Pos' , '', '')
    end

    if curStep == 240 then
        triggerEvent('Change Character', '1', 'gf-event')
        triggerEvent('Play Animation','eventthydi','dad')
        doTweenZoom('shesay','camGame',1.2,1,'cubein')
    end

    if curStep == 256 then
        triggerEvent('Change Character', '1', 'gf-mic')
    end

end