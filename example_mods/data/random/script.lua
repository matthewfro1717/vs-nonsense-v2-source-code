local allowCountdown = false;
local accuracygood = false;
local coolnow = false;
function onStartCountdown() --REDO LATER AGAIN
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and not seenCutscene then
		--startVideo('random');
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
	addCharacterToList('nonsense-confident','dad') 
	addCharacterToList('nonsense-superdog','dad') 
	addCharacterToList('gf-tyler','gf') 
	addCharacterToList('bf-nervous','boyfriend') 
	

end

function onSongStart()
	--piratemode('on')
	doTweenZoom('zoomin','camGame',1,10, 'cubeout')
end

function onTweenCompleted(tag)
	if tag == 'zoomin2' then
		setProperty('defaultCamZoom', 0.7)
	end
end


function onStepHit()
	setProperty('health', 1)
	-- ACCURACY EVENTS --
		if curStep == 224 then
			setProperty('defaultCamZoom', 1)
			if accuracygood == true then
				triggerEvent('Play Animation','eventthinking','dad')
			else
				triggerEvent('Play Animation','eventlookatdis','dad')
			end
		end

		if curStep == 240 then
			setProperty('defaultCamZoom', 0.8)
			if accuracygood == true then
				triggerEvent('Change Character', '1', 'new-nonsense-playable')
			else
				triggerEvent('Change Character', '1', 'nonsense-confident')
				coolnow = true
			end
		end

		if curStep == 235 then -- Loop Animation
			if accuracygood == true then
				-- do nothing
			else
				triggerEvent('Play Animation','eventlookatdis-loop','dad')
			end
		end
	-- ACCURACY EVENTS --

	-- Camera Events --
		if curStep == 65 then
			doTweenZoom('zoomin','camGame',0.7,10, 'cubeout')
		end

		if curStep == 128 then
			setProperty('defaultCamZoom', 1)
		end

		if curStep == 140 or curStep == 192 then
			doTweenZoom('zoominextra','camGame',0.8,0.5, 'cubeout')
		end

		if curStep == 144 or curStep == 195 then
			cancelTween('zoominextra')
			setProperty('defaultCamZoom', 0.7)
		end

		
		if curStep == 160 then
			setProperty('defaultCamZoom', 0.8)
		end

		if curStep == 184 then
			doTweenZoom('zoominextra','camGame',1,0.5, 'cubeout')
		end

		if curStep == 187 then
			cancelTween('zoominextra')
			setProperty('defaultCamZoom', 0.7)
		end

		if curStep == 256 then
			doTweenZoom('zoomin3','camGame',1,4, 'cubeout')
		end
		if curStep == 256 then
			cancelTween('zoomin3')
			doTweenZoom('zoomin3','camGame',0.8,0.4, 'cubeout')
		end
		if curStep == 272 then
			cancelTween('zoomin3')
			doTweenZoom('zoomin3','camGame',1,4, 'cubeout')
		end

		if curStep == 288 then
			cancelTween('zoomin3')
			doTweenZoom('zoomin3','camGame',0.7,11, 'cubeout')
		end

		if curStep == 320 then
			cancelTween('zoomin3')
			doTweenZoom('zoomin3','camGame',1,4, 'cubeout')
			doTweenAlpha('bgfade','bgevents',0.7,2, 'cubeout')
		end

		if  curStep == 351 then
			cancelTween('zoomin3')
			cancelTween('bgfade')
			doTweenZoom('zoomin3','camGame',1.5,6, 'cubeout')
			doTweenAlpha('bgfade','bgevents',0.7,8, 'cubeout')
		end
	
		if  curStep == 367 then
			cancelTween('zoomin3')
			cancelTween('bgfade')
			setProperty('defaultCamZoom', 0.7)
			doTweenAlpha('bgfade','bgevents',0,0.3, 'cubeout')
		end
	
		if  curStep == 376 then
			cancelTween('zoomin3')
			cancelTween('bgfade')
			doTweenZoom('zoomin3','camGame',1,3, 'cubeout')
			doTweenAlpha('bgfade','bgevents',0.7,2, 'cubeout')
		end

		if  curStep == 383 then
			cameraFlash('game','FFFFFF',0.5)
			cancelTween('bgfade')
			cancelTween('zoomin3')
			setProperty('defaultCamZoom', 0.7)
			setProperty('bgevents.alpha',0)
		end

		if  curStep == 383 then
			setProperty('defaultCamZoom', 1)
		end

		if  curStep == 415 then
			setProperty('defaultCamZoom', 0.75)
		end

		if curStep == 431 then
			cancelTween('zoomin3')
			doTweenZoom('zoomin3','camGame',0.7,5, 'cubeout')
		end

		if  curStep == 447 then
			setProperty('defaultCamZoom', 1)
		end

		if curStep == 431 then
			cancelTween('zoomin3')
			doTweenZoom('zoomin3','camGame',0.7,6, 'cubeout')
		end

		if curStep == 431 then
			cancelTween('zoomin3')
			setProperty('defaultCamZoom', 0.75)
		end

		if curStep == 495 then
			cancelTween('zoomin3')
			doTweenZoom('zoomin3','camGame',1,5, 'cubeout')
		end

		if  curStep == 511 then
			cancelTween('zoomin3')
			doTweenZoom('zoomin3','camGame',0.8,5, 'cubeout')
		end

		if  curStep == 559 then
			cancelTween('zoomin3')
			doTweenZoom('zoomin3','camGame',1,3, 'cubeout')
		end

		if curStep == 575 then
			cancelTween('zoomin3')
			setProperty('defaultCamZoom', 0.75)
		end

		if  curStep == 624 then
			cancelTween('zoomin3')
			doTweenZoom('zoomin3','camGame',0.8,5, 'cubeout')
			
		end

		if  curStep == 656 then
			cancelTween('zoomin3')
			setProperty('defaultCamZoom', 0.7)
			doTweenAlpha('bgfade','bgevents',0,0.3, 'cubeout')
		end

		if  curStep == 672 then
			setProperty('defaultCamZoom', 0.8)
		end

		if curStep == 688 or curStep == 711 or curStep == 736 or curStep == 776 then
			doTweenZoom('zoominextra','camGame',1,0.5, 'cubeout')
		end

		if curStep == 692 or curStep == 716 or curStep == 740 or curStep == 780 then
			cancelTween('zoominextra')
			setProperty('defaultCamZoom', 0.7)
		end

		if  curStep == 784 then
			cancelTween('zoomin3')
			doTweenZoom('zoomin3','camGame',1,5, 'cubeout')
		end

		if  curStep == 816 then
			cancelTween('zoomin3')
			doTweenZoom('zoomin3','camGame',0.7,5, 'cubeout')
		end

		if  curStep == 848 then
			cancelTween('zoomin3')
			doTweenAlpha('hudone','camHUD',0,1, 'cubeout')
			doTweenZoom('zoomin3','camGame',1.2,11, 'cubeout')
		end

		if  curStep == 852 then
			--setProperty('defaultCamZoom', 0.8)
			
		end

		if  curStep == 854 then
			cancelTween('zoomin3')
			setProperty('defaultCamZoom', 0.8)
			
		end

		if  curStep == 885 then
			setProperty('defaultCamZoom', 0.7)
		end

		if  curStep == 896 then
			setProperty('defaultCamZoom', 1)
		end

		if  curStep == 907 then
			cancelTween('zoomin3')
			doTweenAlpha('hudone','camHUD',1,1, 'cubeout')
			doTweenZoom('zoomin3','camGame',1.3,1, 'cubeout')
		end

		if  curStep == 920 then
			cancelTween('zoomin3')
			doTweenZoom('zoomin3','camGame',0.8,0.5, 'cubeout')
		end

		if  curStep == 944 then
			setProperty('defaultCamZoom', 1)
		end

		if  curStep == 968 then
			cancelTween('zoomin3')
			doTweenZoom('zoomin3','camGame',0.7,0.5, 'cubeout')
		end

		if  curStep == 1008 then
			cancelTween('zoomin3')
			doTweenZoom('zoomin3','camGame',1,3, 'cubeout')
		end

		if  curStep == 1016 then
			cancelTween('zoomin3')
			doTweenZoom('zoomin3','camGame',0.7,3, 'cubeout')
		end

		if  curStep == 1024 then
			cancelTween('zoomin3')
			doTweenZoom('zoomin3','camGame',1,4, 'cubeout')
		end

		if  curStep == 1032 then
			cancelTween('zoomin3')
			doTweenZoom('zoomin3','camGame',0.7,4, 'cubeout')
		end

		if  curStep == 1040 then
			setProperty('defaultCamZoom', 0.8)
		end

		if  curStep == 1060 then
			setProperty('defaultCamZoom', 1)
		end

		if  curStep == 1068 then
			setProperty('defaultCamZoom', 0.7)
		end

		if  curStep == 1104 then
			setProperty('defaultCamZoom',1)
		end

		if  curStep == 1124 then
			cancelTween('zoomin3')
			doTweenZoom('zoomin3','camGame',0.7,4, 'cubeout')
		end

		if  curStep == 1136 then
			cancelTween('zoomin3')
			doTweenZoom('zoomin3','camGame',1,6, 'cubeout')
			doTweenAlpha('bgfade','bgevents',0.7,7, 'cubeout')
		end

		if  curStep == 1156 then
			cancelTween('zoomin3')
			cancelTween('bgfade')
			setProperty('defaultCamZoom', 0.7)
			doTweenAlpha('bgfade','bgevents',0,0.3, 'cubeout')
		end

		if  curStep == 1160 then
			cancelTween('zoomin3')
			doTweenZoom('zoomin3','camGame',1,2, 'cubeout')
			doTweenAlpha('bgfade','bgevents',0.7,3, 'cubeout')
		end

		if  curStep == 1160 then
			cancelTween('zoomin3')
			cancelTween('bgfade')
			doTweenZoom('zoomin3','camGame',0.7,5, 'cubeout')
			doTweenAlpha('bgfade','bgevents',0,6, 'cubeout')
		end

		if  curStep == 1200 then
			cancelTween('zoomin3')
			cancelTween('bgfade')
			setProperty('defaultCamZoom',1)
		end

		if  curStep == 1200 then
			cancelTween('zoomin3')
			doTweenZoom('zoomin3','camGame',0.7,11, 'cubeout')
			
			doTweenAlpha('bgfade','bgevents',0.7,12, 'cubeout')
		end

		if  curStep == 1280 then
			cancelTween('zoomin3')
			cancelTween('bgfade')
			doTweenZoom('zoomin3','camGame',1,5, 'cubeout')
			
			doTweenAlpha('bgfade','bgevents',0.4,4, 'cubeout')
		end

		if  curStep == 1291 then
			cancelTween('zoomin3')
			cancelTween('bgfade')
			doTweenZoom('zoomin3','camGame',1.3,0.5, 'cubeout')
			
			doTweenAlpha('bgfade','bgevents',0.7,0.4, 'cubeout')
		end

		if  curStep == 1296 then
			cameraFlash('game','FFFFFF',0.5)
			cancelTween('bgfade')
			cancelTween('zoomin3')
			setProperty('defaultCamZoom', 0.7)
			setProperty('bgevents.alpha',0)
		end

		if  curStep == 1312 then
			setProperty('defaultCamZoom', 1)
			
		end

		if  curStep == 1344 then
			setProperty('defaultCamZoom', 0.8)
			
		end

		if  curStep == 1369 then
			setProperty('defaultCamZoom', 0.7)
			
		end

		if  curStep == 1376 then
			cancelTween('zoomin3')
			doTweenZoom('zoomin3','camGame',1.3,5, 'cubeout')
			
		end

		if  curStep == 1440 then
			setProperty('defaultCamZoom', 1)
			
		end

		if  curStep == 1472 or curStep == 1536 then
			cancelTween('zoomin3')
			doTweenZoom('zoomin3','camGame',0.7,3, 'cubeout')
			doTweenAlpha('bgfade','bgevents',0.7,3, 'cubeout')
		end

		if  curStep == 1488 or curStep == 1552 then
			cancelTween('zoomin3')
			cancelTween('bgfade')
			doTweenZoom('zoomin3','camGame',1,0.5, 'cubeout')
			doTweenAlpha('bgfade','bgevents',0,0.4, 'cubeout')
		end

		if  curStep == 1520 then
			setProperty('defaultCamZoom', 0.7)
			
		end

	-- Camera Events --

	-- Countdown --
		if curStep == 648 then  --3!
			cancelTween('zoomin3')
			doTweenZoom('zoomin3','camGame',1,2, 'cubeout')
			doTweenAlpha('bgfade','bgevents',0.7,3, 'cubeout')
			playAnim('gf','three',true)
		end

		if curStep == 650 then --2!
			playAnim('gf','two',true)
		end

		if curStep == 652 then  --1!
			playAnim('gf','one',true)
		end

		if curStep == 654 then --GO!
			playAnim('gf','go',true)
		end
	-- Countdown --

	-- Mid-song Cutscene --
		if curStep == 855 then
			setProperty('vocals.volume', 1)
		end
		
		if curStep == 857 then -- NO  WAY SUPER DOG TYLER
			cancelTween('zoomin3')
			setProperty('defaultCamZoom', 0.9)
				--cameraShake('game',0.02,0.1)
				triggerEvent('Change Character', '1', 'nonsense-superdog')
				triggerEvent('Change Character', '2', 'gf-tyler')
				triggerEvent('Play Animation','eventsdt','dad')
				triggerEvent('Play Animation','dog','gf')
		end

		if curStep == 859 then -- 382.5 ,356.5
			triggerEvent('Camera Follow Pos' , '720', '256.5')
			setProperty('defaultCamZoom', 1.3)
		end

		if curStep == 867 then
			setProperty('defaultCamZoom', 1)
		end

		if curStep == 883 then
			triggerEvent('Camera Follow Pos' , '382.5', '356.5')
			setProperty('defaultCamZoom', 1.3)
		end

		if curStep == 894 then
			setProperty('defaultCamZoom', 1.3)
		end

		if curStep == 912 then -- AWw :( --Note Add Tyler Out
			setProperty('defaultCamZoom', 0.7)
			triggerEvent('Camera Follow Pos' , '', '')
			if coolnow == true then
				triggerEvent('Change Character', '1', 'nonsense-confident')
			else
				triggerEvent('Change Character', '1', 'new-nonsense-playable')
			end
			
		end

		if curStep == 924 then
			triggerEvent('Change Character', '2', 'gf-new')
		end
	-- Mid-song Cutscene --

end

function forcedbf()
	triggerEvent('Change Character', '0', 'bf-new')
end

function bfemotion()

	if getProperty('health') < 1 then 
		triggerEvent('Change Character', '0', 'bf-nervous')
	else
		triggerEvent('Change Character', '0', 'bf-new')
	end

end

function onBeatHit()
	bfemotion()

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