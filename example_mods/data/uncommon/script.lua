local allowCountdown = false;
local accuracygood = false;
function onStartCountdown() -- reamake this sonn
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and not seenCutscene then
		--startVideo('uncommon');
		--allowCountdown = true;
		--return Function_Stop;
	end
end

--setProperty('defaultCamZoom', 1)
--cameraFlash('game','FFFFFF',0.2)
--cameraShake('game',0.02,0.2)
function onCreate()

	luaDebugMode = true
	makeLuaSprite('bgevent', 'empty', -700, -200)
	makeGraphic('bgevent', 1280, 720, '000000')
	setObjectCamera('bgevent', 'game')
	scaleObject('bgevent',3,3)
	setProperty('bgevent.alpha',0)
	addLuaSprite('bgevent', false)

	addCharacterToList('new-nonsense-playable','dad') 
	addCharacterToList('bf-nervous','boyfriend') 
end
function onSongStart()
	doTweenZoom('zoomin','camGame',1,3, 'cubein')

end

function onStepHit()

	if curStep == 1 then
		setProperty('defaultCamZoom', 1)
	end

	if curStep == 73 then
		doTweenZoom('zoomin2','camGame',1,1, 'cubein')
	end

	if curStep == 80 then
		doTweenAlpha('bffadein','boyfriend',1,1)
	end

	if curStep == 176 then
		doTweenZoom('zoomout','camGame',0.72,11)
		--doTweenZoom('zoomouthud','camHUD',0.6,11)
		
		doTweenAlpha('bgfadein','bgevent',0.5,11)
	end

	if curStep == 254 then
		if accuracygood == true then
			triggerEvent('Play Animation','eventZone','dad')
		end
	end

	if curStep == 267 then
		cancelTween('zoomout')
		doTweenZoom('impact','camGame',1,0.6, 'cubeout')
		cancelTween('bgfadein')
		doTweenAlpha('bgfadein','bgevent',0.7,0.4)
		--setProperty('bgevent.alpha',0.7)
		--setProperty('bgevent2.alpha',0)
	end


	if curStep == 272 then
		impact()
		cancelTween('zoomout')
		cancelTween('zoomouthud')
		doTweenZoom('zoomout','camGame',0.7,1, 'cubeout')
		doTweenZoom('zoomouthud','camHUD',1,1, 'cubeout')
		setProperty('bgevent.alpha',0)
		setProperty('gf.alpha',1)

		if accuracygood == true then
			triggerEvent("Change Character", '1', 'new-nonsense-playable');
		end
	end

	if curStep == 399 then
		doTweenZoom('zoomin','camGame',1,6)
	end

	if curStep == 415 then
		--doTweenZoom('zoomin3','camGame',0.7,1)
	end

	if curStep == 527 then
		doTweenZoom('zoomin4','camGame',1,1, 'cubeout')
	
	end

	if curStep == 591 then
		setProperty('defaultCamZoom', 0.7)
	end

	if curStep == 607 then
		setProperty('defaultCamZoom', 0.9)
	end

	if curStep == 623 then
		setProperty('defaultCamZoom', 0.7)
	end

	if curStep == 637 then
		setProperty('defaultCamZoom', 0.8)
	end

	if curStep == 641 then
		setProperty('defaultCamZoom', 0.9)
	end

	if curStep == 645 then
		doTweenZoom('zoomin5','camGame',0.7,1, 'cubeout')
	end

	if curStep == 655 then
		setProperty('defaultCamZoom', 1)
		doTweenAlpha('bgfadein','bgevent',0.7,1)
	end

	if curStep == 687 then
		setProperty('defaultCamZoom', 0.8)
		doTweenAlpha('bgfadein','bgevent',0,1)
	end

	if curStep == 703 then
		setProperty('defaultCamZoom', 1)
		
		doTweenAlpha('bgfadein','bgevent',0.5,11)
	end

	if curStep == 719 then
		setProperty('defaultCamZoom', 0.7)
	end

	if curStep == 735 then
		setProperty('defaultCamZoom', 0.9)
	end

	if curStep == 751 then
		setProperty('defaultCamZoom', 0.7)
	end

	if curStep == 763 then
		setProperty('defaultCamZoom', 0.8)
	end

	if curStep == 783 then
		impact()
		setProperty('defaultCamZoom', 0.9)
		cancelTween('zoomout')
		cancelTween('zoomout')
		cancelTween('bgevent')

		doTweenZoom('zoomout','camGame',0.7,1, 'cubeout')
		doTweenAlpha('bgfadein','bgevent',0,1)
	end





end

function onTweenCompleted(tag)
	if tag == 'zoomin4' then
		setProperty('defaultCamZoom', 1)
	end
	if tag == 'zoomin5' then
		setProperty('defaultCamZoom', 0.7)
	end
end
function onBeatHit()

	if curBeat >= 36 and curBeat < 68 then
		--triggerEvent('Add Camera Zoom','0.08','0.08')
	end
end

function impact()
	triggerEvent('Add Camera Zoom','0.1','0.1')
	setProperty('defaultCamZoom', 0.7)
	cameraFlash('game','FFFFFF',0.2)
	cameraShake('game',0.02,0.2)

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