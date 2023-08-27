local allowCountdown = false;
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and not seenCutscene then
		--startVideo('simple');
		--allowCountdown = true;
		--return Function_Stop;
	end
end

function onCreate() 
	luaDebugMode = true

	makeLuaSprite('bgevents', 'empty', -700, -200)
	makeGraphic('bgevents', 1280, 720, '000000')
	setObjectCamera('bgevents', 'game')
	scaleObject('bgevents',3,3)
	setProperty('bgevents.alpha',0)
	addLuaSprite('bgevents', false)

	addCharacterToList('new-nonsense-playable','dad') 
	addCharacterToList('nonsensehdomgreal','dad') 
	addCharacterToList('bf-nervous','boyfriend') 
	
end

function onSongStart()
	
	doTweenZoom('zoomin','camGame',1,15,'cubein')
end

function onTweenCompleted(tag)
	if tag == 'zoomin' then
		
		setProperty('defaultCamZoom', 0.8)
	end
end

function onStepHit()

	if curStep == 176 then
		triggerEvent('Change Character', '1', 'mad')
		cameraShake('game',0.01,3)
		doTweenZoom('introzoom','camGame',2,3)
	end

	if curStep == 203 then
		omghemad()
	end

	if curStep == 652 then
		triggerEvent('Change Character', '1', 'nonsensehdomgreal')
	end

	if curStep == 811 then
		triggerEvent('Play Animation','eventpreScream','boyfriend')
		cameraShake('game',0.01,5)
	end


end

function omghemad()
	cameraFlash('game','FFFFFF',0.2)
	
	triggerEvent('Change Character', '0', 'bf-scared')
	triggerEvent('Change Character', '1', 'nonsensehdomgreal')


end

function onBeatHit()
	if curBeat > 50 then
		triggerEvent("Add Camera Zoom", "0.05", "0.04")
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