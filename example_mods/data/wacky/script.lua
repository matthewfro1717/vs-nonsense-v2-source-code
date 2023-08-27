local allowCountdown = false;

function onCreate()
    luaDebugMode = true

end

function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and not seenCutscene then
		startVideo('gorbini1');
		allowCountdown = true;
		return Function_Stop;
	end
end

local allowEndSong = false;
function onEndSong()
	if not allowEndSong and not seenCutscene then
		startVideo('gorbini2');
		allowEndSong = true;
		return Function_Stop;
	end
end

function onStepHit()
	if curStep == 471 and not allowEndSong then
		setProperty("camHUD.visible", false)
		playSound("hud_change")
	end
	if curStep == 736 and not allowEndSong then
		setProperty("camHUD.visible", true)
		playSound("hud_change")
	end
	if curStep == 686 or curStep == 448 then
		if not allowEndSong then
			setProperty("vocals.volume", 1)
		end
	end
end