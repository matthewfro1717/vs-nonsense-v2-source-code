local fcint = 0
local shotted = false
local allowEndSong = true;
local keys = {'left', 'right', 'down', 'up'}
local tocheck = {'Uncommon','Random','Context Sensitive' , 'Rethink', 'Sunny Day', 'Your Mom'}
function onCreatePost()
	if songName == 'Sunny Day' then
            makeAnimatedLuaSprite('nofcsense','characters/New Nonsense/NewNonsense',-1000,128)
            addAnimationByPrefix('nofcsense','idle','Idle',24,false)
            addAnimationByPrefix('nofcsense','shoot','Nonsense shoot gun0',24,false)
        
        
            setObjectOrder('nofcsense',getObjectOrder('dadGroup')+1)
	end

end


function onEndSong()
    for _, s in ipairs(tocheck) do
        if songName == s then
            if not shotted then
                nofc()
                allowEndSong = false;
            else
                allowEndSong = true
            end
        end
      end

        if not allowEndSong then
            return Function_Stop;
        end
        if allowSongEnd then
            return Function_Continue
        end
end

function nofc()
    math.randomseed(os.time())
    randomNumber = math.random()

    if  randomNumber < 0.5 and misses == 0 then
        fcint = fcint + 1
        if songName == 'Sunny Day' then
            doTweenX('nofcing','nofcsense',-100,0.7,'expoinout')
            playAnim('nofcsense','shoot',true)
        else
            triggerEvent('Camera Follow Pos' , '800', '475')
            triggerEvent('Play Animation','eventshoot','dad')
        end

        shotted = true
        runTimer('sfx',0.15)
        runTimer('gunshot',1.75)

        runTimer('done',3.25)
      else
        allowEndSong = true
        shotted = true
        endSong()
      end


end

function keyJustPressedd(keyArray)

    for _, key in ipairs(keyArray) do
      if keyJustPressed(key) then
        return true
      end
    end
    return false
  end

function onTimerCompleted(tag)
    if tag == 'gunshot' then
        math.randomseed(os.time())
        soundName = string.format('gunshot%i', math.random(1, 2))
        playSound(soundName,1,'shot')
        keys = {'left','right','down','up'}
        if keyJustPressedd(keys) then
            triggerEvent('Play Animation','dodge','boyfriend')
            playSound('dodge',1,'dodge')
        else
            addMisses(1)
            triggerEvent('Play Animation','singRIGHTmiss','boyfriend')
            triggerEvent('Camera Follow Pos' , '', '')

        end
            doTweenAlpha('camup','camHUD',1,0.7)

            if songName == 'Sunny Day' then
                doTweenX('nofcingout','nofcsense',-1000,1.7,'expoinout')
            end
    end

    if tag == 'sfx' then
        math.randomseed(os.time())
        soundName = string.format('gun_reload%i', math.random(1, 2))
        playSound(soundName,1,'reload')
    end

    if tag == 'done' then
        allowEndSong = true
        endSong()
    end

end