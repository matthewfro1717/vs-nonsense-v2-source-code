local accuracygood = false;

function onCreate() 
	luaDebugMode = true
    addCharacterToList('nonsense-tired','dad') 
end

function onTweenCompleted(tag)

    if tag == 'funny' then
        setProperty('defaultCamZoom',1)
    end

end

function onStepHit()

    if curStep == 20 or curStep == 729 or curStep == 883 then
        setProperty('defaultCamZoom',0.7)
    end

    if curStep == 35 or curStep == 274 or curStep == 659 or curStep == 755 or curStep == 851 or curStep == 963 or curStep == 915 or curStep == 530 then
        setProperty('defaultCamZoom',0.8)
    end

    if curStep == 235 or curStep == 267 or curStep == 523 then
        setProperty('defaultCamZoom',1)
    end
    
    if curStep == 243 or curStep == 499 then
        setProperty('defaultCamZoom',0.8)
        cameraFlash('camGame','FFFFFF','0.2')
        cameraShake('camGame',0.002,0.2)
    end

    if curStep == 819 or curStep == 945 then
        setProperty('defaultCamZoom',0.7)
        cameraFlash('camGame','FFFFFF','0.2')
        cameraShake('camGame',0.002,0.2)
    end

    if curStep == 255 or curStep == 371 or curStep == 513 or curStep == 643 or curStep == 739 or curStep == 835 or curStep == 899 then
        setProperty('defaultCamZoom',0.9)
    end

    if curStep == 621 then
        doTweenZoom('funny','camGame',1,0.1)
        cameraShake('camGame',0.002,0.2)
    end

    if curStep == 627 then
        setProperty('defaultCamZoom',0.7)
        cameraFlash('camGame','FFFFFF','0.2')
    end

    if curStep == 578 then
        if accuracygood == true then
            setProperty('defaultCamZoom',1)
			triggerEvent('Play Animation','eventsweat','dad')
		else
            setProperty('defaultCamZoom',0.8)
            triggerEvent('Play Animation','eventbruh','dad')

		end
    end

    if curStep == 595 then
        setProperty('defaultCamZoom',0.8)
        triggerEvent('Change Character', '1', 'nonsense-tired')
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