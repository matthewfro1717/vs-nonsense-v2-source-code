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

    if curStep == 16 then
        doTweenZoom('funny','camGame',1,0.3)
        cameraFlash('camGame','FFFFFF','0.2')
        cameraShake('camGame',0.002,0.1)
        triggerEvent('Play Animation','eventfrick','boyfriend')
    end

    if curStep == 55 then
        setProperty('defaultCamZoom',0.9)
    end

    if curStep == 350 then
        triggerEvent('Play Animation','eventdie','dad')
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