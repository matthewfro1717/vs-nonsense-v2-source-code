function onSongStart()
	runHaxeCode([[
        game.songLength = (41820 * 10000);
    ]])
end

function onCreate()
    addCharacterToList('bf-stun','boyfriend') 
    
	addCharacterToList('bf-nervous','boyfriend') 
end

function onTweenCompleted(tag)
	if tag == 'zoomintro' then
		setProperty('defaultCamZoom', 1)
	end

	if tag == 'zoom1' then
		setProperty('defaultCamZoom', 0.8)
	end

    if tag == 'zoomout' then
		setProperty('defaultCamZoom', 0.8)
	end
end

function bfemotion()
    if not godArrowstund then
        if getProperty('health') < 1 then 
            triggerEvent('Change Character', '0', 'bf-nervous')
        else
            triggerEvent('Change Character', '0', 'bf-new')
        end 
    end
	

end

function onBeatHit()
	bfemotion()

end

function onStepHit()

    if curStep == 128 then
        doTweenZoom('zoomintro','camGame',1,3, 'cubeout')
    end

    if curStep == 256 or curStep == 368 or curStep == 376 or curStep == 488 or curStep == 500 then
        cancelTween('zoomintro')
        doTweenZoom('zoom1','camGame',0.7,0.5, 'cubeout')
    end

    if curStep == 360 or curStep == 372 or curStep == 384 or curStep == 496 or curStep == 504 then
        cancelTween('zoom1')
        doTweenZoom('zoomintro','camGame',1,0.5, 'cubeout')
    end

    if curStep == 512 then
        cancelTween('zoomintro')
        doTweenZoom('zoomout','camGame',0.8,8, 'cubeout')
    end

    if curStep == 640 then
        cancelTween('zoomout')
        doTweenZoom('zoomintro','camGame',1,3, 'cubeout')
    end

    if curStep == 704 then
        cancelTween('zoomintro')
        doTweenZoom('zoom1','camGame',0.7,10, 'cubeout')
    end

    if curStep == 832 then
        cancelTween('zoom1')
        doTweenZoom('zoomintro','camGame',1,10, 'cubeout')
    end

    if curStep == 896 then
        cancelTween('zoomintro')
        doTweenZoom('zoom1','camGame',0.7,1, 'cubeout')
    end

    if curStep == 912 then
        setProperty('defaultCamZoom', 1)
    end

    if curStep == 960 or curStep == 1088 then
        cancelTween('zoomintro')
        doTweenZoom('zoom1','camGame',0.7,8, 'cubeout')
    end

    if curStep == 992 or curStep == 1052 or curStep == 1120 then
        cancelTween('zoom1')
        doTweenZoom('zoomintro','camGame',1,8, 'cubeout')
    end

    if curStep == 1042 or curStep == 1144 or curStep == 1344 or curStep == 1538 or curStep == 1632  then
    cancelTween('zoomintro')
    doTweenZoom('zoom1','camGame',0.7,0.5, 'cubeout')
    end

    if curStep == 1152 or curStep == 1280 or curStep == 1408 or curStep == 1600 or curStep == 1648 then
        cancelTween('zoom1')
        doTweenZoom('zoomintro','camGame',1,0.5, 'cubeout')
    end

    if curStep == 1664 then
        cancelTween('zoomintro')
    doTweenZoom('zoom1','camGame',0.7,1, 'cubeout')
    end
    
end
