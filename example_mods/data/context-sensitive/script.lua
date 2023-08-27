local allowCountdown = false;
local accuracygood = false;
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and not seenCutscene then
		--startVideo('context-sensitive');
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

	addCharacterToList('new-nonsense-mad','dad') 
	addCharacterToList('nonsense-confident-blood','dad') 
	addCharacterToList('bf-nervous','boyfriend') 
	

end

function onCreatePost()
	setProperty('defaultCamZoom', 0.65)
end


function  onSongStart()

	doTweenZoom('zoomin','camGame',1,1, 'cubeout')
end

function onTweenCompleted(tag)
	if tag == 'zoomin' then
		setProperty('defaultCamZoom', 1)
	end

	if tag == 'zoominextra2' then
		setProperty('defaultCamZoom', 1)
	end
end

function onStepHit()

	if curStep == 32 or curStep == 64 then
		doTweenZoom('zoomin2','camGame',0.7,1, 'cubeout')
	end

	if curStep == 56 then
		doTweenZoom('zoomin','camGame',1,1, 'cubeout')
	end

	if curStep == 96 then
		doTweenZoom('zoomin3','camGame',0.7,6, 'cubeout')
	end

	if curStep == 124 then
		cancelTween('zoomin3')
		doTweenZoom('zoomin4','camGame',1,0.5, 'cubeout')
		doTweenAlpha('bgfadein','bgevents',0.7,0.3, 'cubeout')
		doTweenAlpha('gffade','gf',0.7,0.4, 'cubeout')
	end

	if curStep == 128 then
		impact()
		setProperty('defaultCamZoom', 0.7)
		cancelTween('gffade')
		cancelTween('bgfadein')
		setProperty('bgevents.alpha',0)
		setProperty('gf.alpha',1)
	end

	if curStep == 140 or curStep == 171 then
		doTweenZoom('zoominextra','camGame',0.8,0.5, 'cubeout')
	end

	if curStep == 144 or curStep == 176 then
		cancelTween('zoominextra')
		setProperty('defaultCamZoom', 0.7)
	end

	if curStep == 192 or curStep == 320 then
		doTweenZoom('zoomin3','camGame',1,10, 'cubeout')
	end

	if curStep == 224 or curStep == 352 then
		cancelTween('zoomin3')
		doTweenZoom('zoomin3','camGame',0.7,10, 'cubeout')
	end

	if curStep == 267 or curStep == 299 then
		cancelTween('zoomin3')
		doTweenZoom('zoominextra2','camGame',1,0.6, 'cubeout')
	end

	if curStep == 272 or curStep == 304 then
		cancelTween('zoominextra2')
		setProperty('defaultCamZoom', 0.7)
	end

	if curStep == 336 then
		setProperty('defaultCamZoom', 1)
		if accuracygood == true then
			forcedbf()
			playAnim('boyfriend','eventdab',true)
		else
			forcedbf()
			playAnim('boyfriend','eventbruh',true)
		end
	end
	if curStep == 368 then
		setProperty('defaultCamZoom', 1)
		if accuracygood == true then
			triggerEvent('Play Animation','eventmad','dad')
		else
			triggerEvent('Play Animation','eventhahahlol','dad')
		end
	end

	if curStep == 376 then
		if accuracygood == true then
			triggerEvent('Play Animation','eventmad-loop','dad')
		else
			triggerEvent('Play Animation','eventhahahlol-loop','dad')
		end
	end

	if curStep == 384 then
		impact()
		cancelTween('zoomin3')
		setProperty('defaultCamZoom', 1)
		if accuracygood == true then
			triggerEvent('Change Character', '1', 'new-nonsense-mad')
		else
			triggerEvent('Change Character', '1', 'nonsense-confident-blood')
		end
	end

	if curStep == 416 then
		setProperty('defaultCamZoom', 0.8)
	end

	if curStep == 448 then
		setProperty('defaultCamZoom', 0.7)
	end

	if curStep == 480 or curStep == 544 then
		cancelTween('zoomin3')
		doTweenZoom('zoomin3','camGame',1,10, 'cubeout')
	end

	if curStep == 512 or curStep == 576 then
		cancelTween('zoomin3')
		doTweenZoom('zoomin3','camGame',0.7,10, 'cubeout')
	end

	if curStep == 608 then --382.5 ,356.5
		cancelTween('zoomin3')
		doTweenZoom('zoomin3','camGame',1,10, 'cubeout')
	end

	if curStep == 640 then
		doTweenAlpha('bgfadein','bgevents',0.7,0.3, 'cubeout')
		doTweenAlpha('gffade','gf',0.7,0.4, 'cubeout')
		cancelTween('zoomin3')
		setProperty('defaultCamZoom', 1)
	end

	if curStep == 656  then
		doTweenZoom('zoomin3','camGame',1,10, 'circin')

	end

	if curStep == 663  then
		cancelTween('zoomin3')
		doTweenZoom('zoomin3','camGame',1.5,3, 'cubeout')
		doTweenZoom('zoomouthud','camHUD',1.4,3, 'cubeout')

		doTweenAlpha('bgfadein','bgevents',0.9,2, 'cubeout')
		doTweenAlpha('gffade','gf',0.5,2, 'cubeout')
	end

	if curStep == 672 then
		impact()
		cancelTween('zoomin3')
		cancelTween('zoomouthud')

		cancelTween('bgfadein')
		cancelTween('gffade')
		setProperty('bgevents.alpha',0)
		setProperty('gf.alpha',1)
		setProperty('defaultCamZoom', 0.7)
	end


	if curStep == 683 or curStep == 704 then
		setProperty('defaultCamZoom', 1)
	end

	if curStep == 696 or curStep == 720 then
		setProperty('defaultCamZoom', 0.7)
	end

	if curStep == 727 then
		setProperty('defaultCamZoom', 0.8)
	end

	if curStep == 736 then
		doTweenZoom('zoomin3','camGame',0.7,6, 'cubeout')
	end

	if curStep == 763 or curStep == 891 then
		cancelTween('zoomin3')
		doTweenZoom('zoomin4','camGame',1,0.5, 'cubeout')
		doTweenAlpha('bgfadein','bgevents',0.7,0.3, 'cubeout')
		doTweenAlpha('gffade','gf',0.7,0.4, 'cubeout')
	end

	if curStep == 768 or  curStep == 896 then
		impact()
		setProperty('defaultCamZoom', 0.7)
		cancelTween('gffade')
		cancelTween('bgfadein')
		setProperty('bgevents.alpha',0)
		setProperty('gf.alpha',1)
	end

	if curStep == 784 then
		setProperty('defaultCamZoom', 1)
	end

	if curStep == 800 or curStep == 832 then
		setProperty('defaultCamZoom', 0.7)
	end

	if curStep == 805 or curStep == 838 then
		setProperty('defaultCamZoom', 1)
	end

	if curStep == 816 or curStep == 848 then
		setProperty('defaultCamZoom', 0.8)
	end

	if curStep == 864 then
		doTweenZoom('zoomin3','camGame',0.7,6, 'cubeout')
	end

	if curStep == 907 or curStep == 939 then
		doTweenZoom('zoominextra','camGame',0.8,0.5, 'cubeout')
	end

	if curStep == 912 or curStep == 944 then
		cancelTween('zoominextra')
		setProperty('defaultCamZoom', 0.7)
	end

	if curStep == 960 then
		cancelTween('zoomin3')
		doTweenZoom('zoomin3','camGame',1,10, 'cubeout')
	end

	if curStep == 992 then
		cancelTween('zoomin3')
		doTweenZoom('zoomin3','camGame',0.7,10, 'cubeout')
	end

	if curStep == 1024 then
		cancelTween('zoomin3')
		doTweenZoom('zoomin3','camGame',1,0.7, 'cubeout')
	end


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

function impact()
	triggerEvent('Add Camera Zoom','0.1','0.1')
	cameraFlash('game','FFFFFF',0.2)

end