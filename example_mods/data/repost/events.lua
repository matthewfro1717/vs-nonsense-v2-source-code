local onyoutube = false


function onCreatePost()
        --subtitles 
        makeLuaText('subtitles', '', 0, 0, 0)
        --Text Setting
        setProperty('subtitles.y',500)
        setTextAlignment('subtitles', 'center')
        setTextWidth('subtitles', getTextWidth('scoreTxt'))
        setTextBorder('subtitles',4,'000000')
        setTextSize('subtitles', 40)
        setTextFont('subtitles','PRIMETIME.ttf')
        --setProperty('subtitles.alpha',0)
        addLuaText('subtitles')
        setObjectCamera('subtitles', 'other')


        textscalex = getProperty('subtitles.scale.x')
        textscaley = getProperty('subtitles.scale.y')

        
end





function onSongStart()

    doTweenZoom('lolintro','camGame',0.6,2,'cubein')
end

function onStepHit()
    -- HEY LOOK WHAT I CAN DO
    if curStep == 112 then
        textpop('HEY!!!',true)
        triggerEvent('Play Animation','eventhey','dad')
    end

    if curStep == 120 then
        textpop('Look',true)
    end

    if curStep == 121 then
        textpop('what',false)
    end

    if curStep == 122 then
        textpop('I',false)
    end

    if curStep == 123 then
        textpop('can',false)
    end

    if curStep == 124 then
        textpop('do',false)
    end

    -- Might seem unfair but
    if curStep == 176 then
        textpop('Might',true)
        triggerEvent('Play Animation','eventunfair','dad')
    end

    if curStep == 178 then
        textpop('seem',false)
    end

    if curStep == 179 then
        textpop('unfair',false)
    end

    if curStep == 182 then
        textpop('but',false)
    end

    -- Here it goes
    if curStep == 187 then
        textpop('Here',true)
    end

    if curStep == 188 then
        textpop('it',false)
    end

    if curStep == 189 then
        textpop('goes',false)
    end

    -- Good Luck
    if curStep == 314 then
        textpop('Good',true)
        triggerEvent('Play Animation','eventgood','dad')
    end

    if curStep == 316 then
        textpop('luck',false)
    end

    --Alright Its go tune bois
    if curStep == 368 then
        textpop('Al',true)
        triggerEvent('Play Animation','eventgotime','dad')
    end

    if curStep == 369 then
        textpop('Alright',true)
    end

    if curStep == 374 then
        textpop('its',true)
    end

    if curStep == 375 then
        textpop('go',false)
    end

    if curStep == 377 then
        textpop('time',false)
    end

    if curStep == 379 then
        textpop('bois',false)
    end


    if curStep == 128 or curStep == 192 or curStep == 320 or curStep == 384 then
        
        textdown()
    end



    --if curStep == 528 then
       -- youtube()
   --end
    --Camera events
    if curStep == 144 or curStep == 192 or curStep == 196 or curStep == 216 or curStep == 224 or curStep == 228 or curStep == 248 or curStep == 400 or curStep == 432 or curStep == 464 or curStep == 496  then
        --cancelTween('lolintro')
       -- doTweenZoom('lolintro','camGame',1,0.5,'cubein')
    end
        
   

end

function onBeatHit()
    

end
function onTweenCompleted(tag)
    if tag == 'lolintro' then
    
        setProperty('defaultCamZoom',0.7)
    end

    if tag == 'godown' then
    
        setTextString('subtitles','')
        setProperty('subtitles.y',500)
    end
end

function textpop(text,reset)
    if reset then
        setTextString('subtitles',text)
    
        setProperty('subtitles.scale.x', 1.075)
        setProperty('subtitles.scale.y', 1.075)
        doTweenX('pop','subtitles.scale', 1,0.2,'cubein')
        doTweenY('pop2','subtitles.scale', 1,0.2,'cubein')
    
    
        doTweenAlpha('comein','subtitles',1,0.1,'cubein')
    else 


        previousSub = getTextString('subtitles')
        setTextString('subtitles',previousSub .. ' ' ..text)
    
        setProperty('subtitles.scale.x', 1.075)
        setProperty('subtitles.scale.y', 1.075)
        doTweenX('pop','subtitles.scale', 1,0.2,'cubein')
        doTweenY('pop2','subtitles.scale', 1,0.2,'cubein')
    
    
        doTweenAlpha('comein','subtitles',1,0.1,'cubein')
    end


end

function textdown()

    doTweenY('godown','subtitles',getProperty('subtitles.y') + 300,0.7,'cubein')
    doTweenAlpha('goaway','subtitles',0,0.7,'cubein')

end


