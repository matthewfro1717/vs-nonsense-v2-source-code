function onCountdownTick(counter) --Count Down 
    if counter == 0 then -- 3
        playAnim('gf','three',true)
    end

    if counter == 1 then -- 2
        playAnim('gf','two',true)
        
    end

    if counter == 2 then -- 1
        playAnim('gf','one',true)
    end

    if counter == 3 then -- Go!
        playAnim('gf','go',true)
    end
end

function onBeatHit()
    if not gfcansing then
        if songName ~= 'the-dev-song' then
            doBeatAnim(curBeat)          
        end
    end
    
end

function doBeatAnim(curBeat)
    if curBeat %2 == 0 then
        if ratingName == 'Sick!' or ratingName == 'Great' or ratingName == 'Perfect!!' or ratingName == 'Good' or ratingName == 'Nice' then
            
            playAnim('gf','CheerRight',true)
        elseif ratingName == 'Bruh' or ratingName == 'Meh' or ratingName == 'Bad' or ratingName == 'Stupid' or ratingName == 'You Suck!' then
            playAnim('gf','CringeRight',true)
        else
            playAnim('gf','danceRight',true)
        end
        
    else
        if ratingName == 'Sick!' or ratingName == 'Great' or ratingName == 'Perfect!!' or ratingName == 'Good' or ratingName == 'Nice' then
            
            playAnim('gf','CheerLeft',true)
        elseif ratingName == 'Bruh' or ratingName == 'Meh' or ratingName == 'Bad' or ratingName == 'Stupid' or ratingName == 'You Suck!' then
            playAnim('gf','CringeLeft',true)
        else
            playAnim('gf','danceLeft',true)
        end

    end
end

   