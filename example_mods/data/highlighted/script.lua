local allowCountdown = false;
local accuracygood = false;
function onStartCountdown() -- remaking this soon
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and not seenCutscene then
		--startVideo('highlighted');
		--allowCountdown = true;
		--return Function_Stop;
	end
end

function onCreate()
	addCharacterToList('nonsense-tired','dad') 
	addCharacterToList('bf-nervous','boyfriend') 
end

function onStepHit()
	if curStep == 8 or curStep == 16 or curStep == 24 or curStep == 136 or curStep == 136 or curStep == 144 or curStep == 152 or curStep == 288 or curStep == 380 or curStep == 640 or curStep == 704 then
		setProperty('defaultCamZoom', 1)
	end

	if curStep == 4 or curStep == 20 or curStep == 132 or curStep == 148 or curStep == 320 or curStep == 576 or curStep == 736 then
		setProperty('defaultCamZoom', 1.2)
	end

	if curStep == 10 or curStep == 26 or curStep == 138 or curStep == 154 or curStep == 382 or curStep == 672 or curStep == 768 then
		setProperty('defaultCamZoom', 1.2)
	end

	if curStep == 128 or curStep == 544 then
		setProperty('defaultCamZoom', 1)
		cameraFlash('game','FFFFFF',0.2)
		cameraShake('game',0.02,0.2)
	end

	if curStep == 381 then
		setProperty('defaultCamZoom', 0.9)
	end

	if curStep == 370 then
		if accuracygood == true then
			triggerEvent('Play Animation','ohno','dad')
		end
	end

	if curStep == 384 then
		if accuracygood == true then
			triggerEvent("Change Character", '1', 'new-nonsense-tired');
		end
	end

	if curStep == 608 then
		setProperty('defaultCamZoom', 1.4)
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