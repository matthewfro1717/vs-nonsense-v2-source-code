local allowCountdown = false;
numberpop = 0;
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and not seenCutscene then
		----startVideo('your-mom');
		--allowCountdown = true;
		---return Function_Stop;
	end
end

function onCreate()
	luaDebugMode = true
	addCharacterToList('new-nonsense-playable','dad') 
	addCharacterToList('popup-sense','dad') 
	precracepopup()

end

function onCreatePost()
	--setProperty('camHUD.alpha',0)
end

function onSongStart()
	doTweenZoom('zoomintro','camGame',1,20, 'cubein')
end

function onTweenCompleted(tag)
	if tag == 'zoomintro' then
		setProperty('defaultCamZoom', 1)
	end

	if tag == 'zoom1' then
		setProperty('defaultCamZoom', 0.7)
	end
end



function onStepHit()
	if curStep == 112 then
		--doTweenAlpha('hudin','camHUD',1,3,'cubein')
	end
	if curStep == 258 then
		setProperty('defaultCamZoom', 0.7)
	end

	if curStep == 352 then
		doTweenZoom('zoomintro','camGame',1,10, 'cubeout')
	end

	if curStep == 416 then
		cancelTween('zoomintro')
		doTweenZoom('zoom1','camGame',0.7,3, 'cubeout')
	end

	if curStep == 480 then
		cancelTween('zoom1')
		doTweenZoom('zoomintro','camGame',1,3, 'cubeout')
	end

	if curStep == 576 then
		cancelTween('zoomintro')
		doTweenZoom('zoom1','camGame',0.7,8, 'cubein')
	end

	if curStep == 640 then
		cancelTween('zoom1')
		doTweenZoom('zoomintro','camGame',1,0.4, 'cubeout')
	end

	if curStep == 767 then
		setProperty('defaultCamZoom', 0.7)
	end

	if curStep == 927 then
		doTweenZoom('zoomintro','camGame',1,10, 'cubeout')
	end

	if curStep == 960 then
		triggerEvent('Camera Follow Pos' , '720', '256.5')
		cancelTween('zoomintro')
		doTweenZoom('zoom1','camGame',0.7,3, 'cubeout')
		popupwindow(true,650,350,nil)
		
		triggerEvent('Change Character', '1', 'popup-sense')
		triggerEvent('Play Animation','eventpopup','dad')
	end
	if curStep == 1000 then
		popupwindow(false,nil,nil,44)
	end



end



-- I HATE MYSELF SO MUCH DOING THIS SHIT IN LUA - TAEYAI
function popupwindow(customXY,x, y, spam)
	
	
	randomX = math.random(-200,800)
	randomY = math.random(-200,600)
	popnum = math.random(0,11)
	arraypop = {'FNAF', 'aduck', 'benny', 'clark', 'daveandbambi', 'dog', 'hello', 'imscared', 'indihome', 'otherdog', 'pico', 'texas'}
	

	runTimer('pops',0.02)
	function onTimerCompleted(tag, loops, loopsLeft)

		if tag == 'pops' then
			numberpop = numberpop + 1
			if customXY then
				makeAnimatedLuaSprite("popup"..numberpop..'','NewNonsense Assets/popup windows',x,y)
			else
				x = math.random(-200,800)
				y = math.random(-200,600)
				makeAnimatedLuaSprite("popup"..numberpop..'','NewNonsense Assets/popup windows',x,y)
			end
			addLuaSprite("popup"..numberpop..'')
			setObjectCamera("popup"..numberpop..'','hud',true)
			addAnimationByPrefix("popup"..numberpop..'','popit',arraypop[math.random(#arraypop)],24,false)
			playAnim("popup"..numberpop..'','popit')
			playSound('PopupSpawnLOL')
			
			--debugPrint('popup', numberpop)
			--debugPrint(getProperty('popup.x'))
			
			if spam ~= nil then
				if numberpop < spam then
					cancelTimer('pops')
					runTimer('pops',0.02)
				end
			end
			
		end
	
	end


end

function precracepopup()
	arraypop = {'FNAF', 'aduck', 'benny', 'clark', 'daveandbambi', 'dog', 'hello', 'imscared', 'indihome', 'otherdog', 'pico', 'texas'}
	makeAnimatedLuaSprite("popuppre",'NewNonsense Assets/popup windows',0,0)
	addLuaSprite("popuppre")
	setObjectCamera("popuppre",'hud',true)
	addAnimationByPrefix("popuppre",'popit',arraypop[math.random(#arraypop)],24,false)
	playAnim("popuppre",'popit')
	removeLuaSprite('popuppre')
end