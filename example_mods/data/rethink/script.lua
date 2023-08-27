local allowCountdown = false;
local accuracygood = false;
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and not seenCutscene then
		--startVideo('rethink');
		--allowCountdown = true;
		--return Function_Stop;
	end
end



function onCreate() 

	makeLuaSprite('bgevents', 'empty', -700, -200)
	makeGraphic('bgevents', 1280, 720, '000000')
	setObjectCamera('bgevents', 'game')
	scaleObject('bgevents',3,3)
	setProperty('bgevents.alpha',1)
	addLuaSprite('bgevents', false)

	addCharacterToList('gf-event','gf') 
	addCharacterToList('gf-new','gf') 
	addCharacterToList('bf-confident','boyfriend') 
	

end

function onCreatePost()
	setProperty('dad.alpha',0)
	setProperty('boyfriend.alpha',0)
	setProperty('gf.alpha',0)
end

function onSongStart()
	triggerEvent('Camera Follow Pos' , '720', '356.5')
	doTweenAlpha('fading','bgevents',0.5,5,'cubein')
	doTweenAlpha('fade1','boyfriend',1,3,'cubein')

	doTweenZoom('intro','camGame',1,10,'cubein')
end

function onTweenCompleted(tag)

	if tag == 'lol' then
		setProperty('defaultCamZoom', 0.5)
	end

	if tag == 'lol2' then
		setProperty('defaultCamZoom', 0.8)
	end

	if tag == 'intro' then
		setProperty('defaultCamZoom', 1)
	end

	if tag == 'lol3' then
		doTweenZoom('lol4','camGame',1,10,'cubein')
	end

	if tag == 'zoomin' then
		doTweenZoom('lol2','camGame',0.7,3,'cubein')
	end

end

function  onStepHit()



	if curStep == 16 then
		doTweenAlpha('fade2','gf',1,1,'cubeout')
	end

	if curStep == 32 then
		doTweenAlpha('fade3','dad',1,2,'cubein')
	end

	if curStep == 48 then
		cancelTween('fading')
		doTweenAlpha('fade4','bgevents',0,3,'cubeout')
		triggerEvent('Camera Follow Pos' , '', '')
	end

	if curStep == 448 then
		doTweenZoom('lol2','camGame',0.7,10,'cubein')
	end

	if curStep == 576 then
		cancelTween('lol2')
		doTweenZoom('intro','camGame',1,10,'cubein')
	end

	if curStep == 704 then
		cancelTween('intro')
		doTweenZoom('lol3','camGame',0.7,10,'cubeout')
	end

	if curStep == 752 then
		cancelTween('lol3')
		doTweenAlpha('fading','bgevents',0.5,1,'cubeout')
		doTweenZoom('intro','camGame',1,0.5,'cubeout')
	end

	if curStep == 768 then
		cancelTween('intro')
		cancelTween('fading')
		cameraFlash('game','FFFFFF',0.3)
		doTweenZoom('lol2','camGame',0.7,0.4,'cubeout')
		doTweenAlpha('fading','bgevents',0,0.4,'cubeout')
	end

	if curStep == 891 then
		doTweenZoom('intro','camGame',1,0.5,'cubeout')
	end

	if curStep == 820 then
		if accuracygood == true then
			triggerEvent('Play Animation','eventspin','boyfriend')
		end
	end

	if curStep == 832 then
		if accuracygood == true then
			triggerEvent('Change Character', '0', 'bf-confident')
		end
	end

	if curStep == 960 then
		doTweenZoom('lol2','camGame',0.7,3,'cubeout')
	end

	if curStep == 1027 then
		cancelTween('lol2')
		doTweenZoom('intro','camGame',1,0.5,'cubeout')
		doTweenAlpha('fading','bgevents',0.5,1,'cubein')
	end

	if curStep == 1035 then
		cancelTween('lol2')
		doTweenZoom('intro','camGame',1.3,0.5,'cubeout')
		doTweenAlpha('fading','bgevents',0.9,1,'cubein')
	end

	if curStep == 1040 then
		cancelTween('fading')
		cameraFlash('game','FFFFFF',0.3)
		doTweenZoom('lol2','camGame',0.7,0.5,'cubeout')
		doTweenAlpha('fading','bgevents',0,0.3,'cubein')
	end

	if curStep == 1088 then
		setProperty('defaultCamZoom', 1)
	end

	if curStep == 1136 then
		doTweenZoom('lol2','camGame',0.7,3,'cubein')
	end

	if curStep == 1168 then
		cancelTween('lol2')
		doTweenZoom('intro','camGame',1,3,'cubein')
	end

	if curStep == 1264 then
		cancelTween('intro')
		setProperty('defaultCamZoom', 0.7)
	end

	if curStep == 1280 then
		doTweenZoom('intro','camGame',1,3,'cubein')
		doTweenAlpha('fading','bgevents',1,1,'cubeout')
		doTweenAlpha('fade1','gf',0,1,'cubeout')
		doTweenAlpha('fade2','boyfriend',0,1,'cubeout')
	end

	if curStep == 1344 then
		cancelTween('intro')
		doTweenZoom('lol2','camGame',0.7,3,'cubein')
		doTweenAlpha('fade2','boyfriend',1,1,'cubeout')
	end

	if curStep == 1408 then
		cancelTween('lol2')
		doTweenZoom('intro','camGame',1,3,'cubein')
	end

	if curStep == 1536 then
		cancelTween('intro')
		doTweenZoom('lol2','camGame',0.7,20,'cubein')
		doTweenAlpha('fade3','gf',1,1,'cubeout')
		doTweenAlpha('fading','bgevents',0.5,5,'cubein')
	end

	if curStep == 1712 then
		cancelTween('lol2')
		cancelTween('fading')
		doTweenZoom('zoomin','camGame',1,0.4,'cubeout')
		doTweenAlpha('fading','bgevents',0.7,0.3,'cubeout')
	end

	if curStep == 1728 then
		cancelTween('lol2')
		cancelTween('zoomin')
		cancelTween('fading')
		cameraFlash('game','FFFFFF',0.3)
		doTweenAlpha('fading','bgevents',0,0.3,'cubeout')
		doTweenZoom('intro','camGame',1,0.4,'cubeout')
	end

	if curStep == 1792 then
		cancelTween('intro')
		cancelTween('fading')
		doTweenAlpha('fading','bgevents',0.7,4,'cubeout')
		doTweenZoom('lol2','camGame',0.7,4,'cubeout')
	end

	if curStep == 1840 then
		cancelTween('lol2')
		cancelTween('fading')
		doTweenAlpha('fading','bgevents',0.9,0.3,'cubeout')
		doTweenZoom('intro','camGame',1,0.3,'cubeout')
	end

	if curStep == 1888 then
		setProperty('defaultCamZoom', 1)
	end

	if curStep == 1920 then
		cancelTween('intro')
		cancelTween('fading')
		doTweenZoom('lol2','camGame',0.7,0.4,'cubeout')
		doTweenAlpha('fading','bgevents',0,0.4,'cubeout')
	end

	if curStep == 1952 then
		doTweenZoom('intro','camGame',1,0.5,'cubeout')
	end

	if curStep == 2016 then
		doTweenZoom('lol2','camGame',0.7,3,'cubeout')
	end

	if curStep == 2107 then
		cancelTween('lol2')
		doTweenZoom('intro','camGame',1,0.5,'cubeout')
		doTweenAlpha('fading','bgevents',0.5,1,'cubein')
	end

	if curStep == 2122 then
		cancelTween('lol2')
		doTweenZoom('intro','camGame',1.3,0.5,'cubeout')
		doTweenAlpha('fading','bgevents',0.5,1,'cubein')
	end

	if curStep == 2128 then
		cancelTween('fading')
		cameraFlash('game','FFFFFF',0.3)
		doTweenZoom('lol2','camGame',0.7,0.5,'cubeout')
		doTweenAlpha('fading','bgevents',0,0.3,'cubein')
	end

	if curStep == 2192 then
		setProperty('defaultCamZoom', 1)
	end

	if curStep == 2240 then
		doTweenZoom('lol2','camGame',0.7,3,'cubein')
	end

	if curStep == 2304 then
		cancelTween('lol2')
		doTweenZoom('intro','camGame',1,3,'cubein')
	end

	if curStep == 2352 then
		cancelTween('intro')
		setProperty('defaultCamZoom', 0.7)
	end

	if curStep == 2368 then
		setProperty('defaultCamZoom', 1)
	end




end

function onBeatHit()

	if curBeat == 192 then

		void(true)
	end

	if curBeat == 464 then
		cancelTween('intro')
		doTweenAlpha('fading','bgevents',0,0.3,'cubein')
		cameraFlash('game','FFFFFF',0.3)
		triggerEvent('Camera Follow Pos' , '720', '356.5')
		void(true)
	end

	if curBeat == 320 then
		void(false)
	end

end

function onTimerCompleted(tag)

	if tag == 'coolwait' then
		triggerEvent('Camera Follow Pos' , '', '')
	end

end

function void(on) -- HOLY SHIT CYBER SENSATION
	staticstage = {'staticbg', 'plaque', 'debrisgf', 'debrissmall2', 'debrissmall', 'debrisbf', 'debrisdad', 'joeyDoll'}
	instage = {'inside', 'outside'}
	static()
	
	runTimer('coolwait',0.3)
	if on then
		triggerEvent('Camera Follow Pos' , '720', '256.5')
		-- STAGE CHANGE
		doTweenZoom('lol','camGame',0.5,0.5,'cubeout')
		for i=1, #staticstage do
		setProperty(staticstage[i]..".alpha",1)
		end

		for i=1, #instage do
		setProperty(instage[i]..".alpha",0)
		end

		-- POSITION
		setProperty('boyfriendGroup.x', getProperty('boyfriendGroup.x') + 280)
		setProperty('dad.x', getProperty('dad.x') - 400)
		setProperty('gf.x', getProperty('gf.x') - 200)
		setProperty('gf.y', getProperty('gf.y') - 280)
		setProperty('gf.angle', -5)
		runHaxeCode([[game.gf.setGraphicSize(Std.int(gf.width * 0.7));]])
		setScrollFactor('gf',0.8,0.8)

		setGraphicSize('staticbg',getProperty('staticbg.width') * 1.15)
		setGraphicSize('joeyDoll',getProperty('joeyDoll.width') * 1.7)
		--setGraphicSize('gf',getProperty('gf.width') * 0.7)
	else
		triggerEvent('Camera Follow Pos' , '720', '356.5')
		-- STAGE CHANGE
		doTweenZoom('lol2','camGame',0.8,0.5,'cubeout')
		for i=1, #staticstage do
		setProperty(staticstage[i]..".alpha",0)
		end

		for i=1, #instage do
		setProperty(instage[i]..".alpha",1)
		end

		-- POSITION
		setProperty('boyfriendGroup.x', getProperty('boyfriendGroup.x') -280)
		setProperty('dad.x', getProperty('dad.x') + 400)
		setProperty('gf.x', getProperty('gf.x') + 200)
		setProperty('gf.y', getProperty('gf.y') + 280)
		setProperty('gf.angle', 0)
		setScrollFactor('gf',0.95,0.95)
		runHaxeCode([[game.gf.setGraphicSize(Std.int(gf.width * 1));]])
		
	end
end

function static()

	setProperty('ostatic.alpha', 1)
	playSound('static')
	doTweenAlpha('gonesa','ostatic',0,0.2,'cubeout')



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