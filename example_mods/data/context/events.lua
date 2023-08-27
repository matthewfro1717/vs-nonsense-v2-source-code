local accuracygood = false;
function onCreate() 
	luaDebugMode = true
end

function onTweenCompleted(tag)

    if tag == 'funny' then
        setProperty('defaultCamZoom',0.8)
    end

    if tag == 'funny2' then
        setProperty('defaultCamZoom',1)
    end

end

function onStepHit()

    if curStep == 1 or curStep == 51 or curStep == 83 or curStep == 147 or curStep == 211 or curStep == 643 or curStep == 677 or curStep == 773 then
        setProperty('defaultCamZoom',1)
    end

    if curStep == 19 or curStep == 75 or curStep == 107 or curStep == 195 or curStep == 223 or curStep == 377 or curStep == 499 or curStep == 655 or curStep == 691 or curStep == 787  or curStep == 883 or curStep == 594 then
        setProperty('defaultCamZoom',0.8)
    end

    if curStep == 63 or curStep == 95 or curStep == 179 or curStep == 307  or curStep == 819 then
        setProperty('defaultCamZoom',0.7)
    end
    
    if curStep == 115 or curStep == 626 then
        setProperty('defaultCamZoom',0.7)
        cameraFlash('camGame','FFFFFF','0.2')
        cameraShake('camGame',0.002,0.1)
    end

    if curStep == 948 then
        setProperty('defaultCamZoom',1)
        cameraFlash('camGame','FFFFFF','0.2')
        cameraShake('camGame',0.002,0.1)
    end

    if curStep == 467 then
        setProperty('defaultCamZoom',0.9)
    end

    if curStep == 1011 then
        doTweenZoom('funny','camGame',0.8,0.3)
    end

    if curStep == 322 then
        doTweenZoom('funny2','camGame',1,0.5)

        if accuracygood == true then
            triggerEvent('Play Animation','eventlol','boyfriend')
		else
            triggerEvent('Play Animation','eventbruh','boyfriend')
		end
    end

    if curStep == 578 then

        if accuracygood == true then
            doTweenZoom('funny2','camGame',1,0.5)
		end
    end

    if curStep == 588 then

        if accuracygood == true then
            triggerEvent('Play Animation','eventdab','boyfriend')
		end
    end

    if curStep == 610 then
        doTweenZoom('funny2','camGame',1,0.5)
        if accuracygood == true then
            triggerEvent('Play Animation','eventmad','dad')
        else 
            triggerEvent('Play Animation','eventhahahlol','dad')
		end
    end

    if curStep == 627 then
        if accuracygood == true then
            triggerEvent('Change Character', '1', 'nonsense-mad')
        end
    end

    if curStep == 948 then
        if accuracygood == true then
            triggerEvent('Play Animation','eventpain','dad')
        end
    end


end 

function onUpdate(elapsed)

	if ratingName == 'Sick!' or ratingName == 'Great' or ratingName == 'Good' or ratingName == 'Perfect!!' or ratingName == 'Nice' then
            
		accuracygood = true;
	elseif ratingName == 'Bruh' or ratingName == 'Bad' or ratingName == 'Stupid' or ratingName == 'You Suck!' then
		accuracygood = false;
	else
		accuracygood = false;
	end

end