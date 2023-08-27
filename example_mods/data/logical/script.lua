local allowCountdown = false;
local ayaycaptain = false;
local accuracygood = false;
function onStartCountdown() --REmake  this later  :sob:
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and not seenCutscene then
		--startVideo('logical');
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

	addCharacterToList('gf-event','gf') 
	addCharacterToList('gf-new','gf') 
	addCharacterToList('gf-pirate','gf') 
	addCharacterToList('nonsense-pirate','dad') 
	addCharacterToList('bf-nervous','boyfriend') 
	addCharacterToList('bf-pirate','boyfriend') 
	

end

function onSongStart()
	--piratemode('on')
	doTweenZoom('zoomin','camGame',0.7,6, 'cubeout')
end

function onTimerCompleted(tag, loops, loopsLeft)
	if  tag == 'gfwait' then
		doTweenAlpha('gffade','gf',0,1, 'cubeout')
	end
end

function onTweenCompleted(tag)
	if tag == 'zoomin2' then
		setProperty('defaultCamZoom', 0.7)
	end
end

function onStepHit()

	setProperty('health', 1)
	--debugPrint('CAMZOOM: ', getProperty('defaultCamZoom'))
	--PIRATE  AY AY--
	if  curStep == 256 or curStep == 912 then
		cancelTween('bgfade')
		cancelTween('zoomin3')
		setProperty('defaultCamZoom', 0.8)
		setProperty('bgevents.alpha',0)
		piratemode('on')
	end

	if  curStep == 640 then
		doTweenZoom('zoomin3','camGame',1,6, 'cubeout')
		piratemode('off')
	end
	--PIRATE  AY AY--

	--CAMERA EVENTS--
	if  curStep == 128 then
		doTweenZoom('zoomin2','camGame',0.7,4, 'cubein')
		ayaycaptain = true
	end

	if  curStep == 169 then
		cancelTween('zoomin2')
		doTweenZoom('zoomin3','camGame',1,6, 'cubeout')
	end

	if  curStep == 192 then
		setProperty('defaultCamZoom', 0.8)
	end

	if  curStep == 224 then
		doTweenZoom('zoomin3','camGame',1,6, 'cubeout')
	end
	
	if  curStep == 240 then
		cancelTween('zoomin3')
		doTweenZoom('zoomin3','camGame',1.4,3, 'cubeout')
		doTweenAlpha('bgfade','bgevents',0.7,2, 'cubeout')
	end

	if  curStep == 272 then
		setProperty('defaultCamZoom', 1)
	end

	if  curStep == 288 then
		setProperty('defaultCamZoom', 0.8)
	end

	if  curStep == 304 then
		doTweenZoom('zoomin3','camGame',0.7,3, 'cubeout')
	end

	if  curStep == 344 or curStep == 376 then
		doTweenZoom('zoominextra','camGame',0.8,0.5, 'cubeout')
	end

	if  curStep == 347 or curStep == 379 then
		cancelTween('zoominextra')
		setProperty('defaultCamZoom', 0.7)
	end

	if  curStep == 384 then
		setProperty('defaultCamZoom', 1)
	end

	if curStep == 400 then
		if accuracygood == true then
			triggerEvent('Play Animation','eventpog','boyfriend')
		else
			triggerEvent('Play Animation','eventbruh','boyfriend')
		end
	end

	if curStep == 412 then --IDK WHY PSYCH NOT LOOP SHIT
		if accuracygood == true then
			triggerEvent('Play Animation','eventpog-loop','boyfriend')
		end
	end

	if  curStep == 443 then
		doTweenZoom('zoomin2','camGame',0.7,0.5, 'cubeout')
	end

	if  curStep == 448 then
		doTweenZoom('zoomin3','camGame',1,11, 'cubeout')
	end

	if  curStep == 512 then
		cancelTween('zoomin3')
		doTweenZoom('zoomin2','camGame',0.7,0.5, 'cubeout')
	end

	if  curStep == 572 then
		setProperty('defaultCamZoom', 1)
	end

	if  curStep == 592 then
		setProperty('defaultCamZoom', 0.8)
	end

	if  curStep == 672 then
		doTweenZoom('zoomin3','camGame',0.7,6, 'cubeout')
	end

	if  curStep == 704 then
		setProperty('defaultCamZoom', 0.8)
	end

	if  curStep == 752 then
		doTweenZoom('zoomin3','camGame',1,3, 'cubeout')
		doTweenAlpha('bgfade','bgevents',0.7,2, 'cubeout')
	end

	if  curStep == 832 then
		cancelTween('zoomin3')
		cancelTween('bgfade')
		doTweenZoom('zoomin3','camGame',1.5,6, 'cubeout')
		doTweenAlpha('bgfade','bgevents',0.7,8, 'cubeout')
	end

	if  curStep == 880 then
		cancelTween('zoomin3')
		cancelTween('bgfade')
		setProperty('defaultCamZoom', 0.7)
		doTweenAlpha('bgfade','bgevents',0,0.3, 'cubeout')
	end

	if  curStep == 896 then
		cancelTween('zoomin3')
		cancelTween('bgfade')
		doTweenZoom('zoomin3','camGame',1,3, 'cubeout')
		doTweenAlpha('bgfade','bgevents',0.7,2, 'cubeout')
	end



	--CAMERA EVENTS--

	if  curStep == 768 then --GF FUCKING GONE NOOOOOOOO
		triggerEvent('Change Character', '2', 'gf-event')
		runTimer('gfwait',1.2917)
		triggerEvent('Play Animation','fade','gf')
		cancelTween('zoomin3')
		cancelTween('bgfade')
		doTweenZoom('zoomin3','camGame',1.4,11, 'cubeout')
		doTweenAlpha('bgfade','bgevents',0.7,11, 'cubeout')
	end

	
	if  curStep == 1152 then --IT END :(
		gone()
	end

end

function onBeatHit()
	if not ayaycaptain then
		bfemotion()
	end

	if curBeat >= 228 and curBeat < 256 then
		triggerEvent('Add Camera Zoom','0.05','0.04')
	end

	if curBeat >= 260 then
		triggerEvent('Add Camera Zoom','0.05','0.04')
	end

end

function bfemotion()

	if getProperty('health') < 1 then 
		triggerEvent('Change Character', '0', 'bf-nervous')
	else
		triggerEvent('Change Character', '0', 'bf-new')
	end

end



function gone() 
	cameraFlash('other','FFFFFF',0.2)
	doTweenAlpha('camHudend','camHUD',0,1, 'cubeout')
	doTweenAlpha('camgameend','camGame',0,0.001, 'cubeout')

end

function piratemode(turn)
	cameraFlash('game','FFFFFF',0.3)
	if turn == 'on' then
		ayaycaptain = true
		--TURN OFF OG  STAGE
		setProperty('outside.alpha',0)
		setProperty('inside.alpha',0)

		--TURN ON PIRATE STAGE
		setProperty('outside2.alpha',1)
		setProperty('inside2.alpha',1)	

		-- CHANGE  CHARACTER 
		triggerEvent('Change Character', '0', 'bf-pirate')
		triggerEvent('Change Character', '1', 'nonsense-pirate')
		triggerEvent('Change Character', '2', 'gf-pirate')
	else 
		ayaycaptain = false
		--TURN ON OG  STAGE
		setProperty('outside.alpha',1)
		setProperty('inside.alpha',1)

		--TURN OFF PIRATE STAGE
		setProperty('outside2.alpha',0)
		setProperty('inside2.alpha',0)	

		-- CHANGE  CHARACTER 
		triggerEvent('Change Character', '0', 'bf-new')
		triggerEvent('Change Character', '1', 'new-nonsense-playable')
		triggerEvent('Change Character', '2', 'gf-new')
	end
end

function forcedbf()
	triggerEvent('Change Character', '0', 'bf-new')
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