cooleffecton = false
function onCreate() 
	luaDebugMode = true

	makeLuaSprite('bgevents', 'empty', -700, -200)
	makeGraphic('bgevents', 1280, 720, '000000')
	setObjectCamera('bgevents', 'game')
	scaleObject('bgevents',3,3)
	setProperty('bgevents.alpha',0)
	addLuaSprite('bgevents', false)

	addCharacterToList('crystal','dad') 
	addCharacterToList('joenuts','dad') 
	addCharacterToList('madbear','dad') 
	addCharacterToList('nate','dad') 
	addCharacterToList('crystaldie','dad') 

    makeAnimatedLuaSprite('joeyintro', 'characters/devSong/joenuts', getProperty('DAD_X') + 100, getProperty('DAD_Y') - 1100)
    addAnimationByPrefix('joeyintro','jump','Intro0',24,false)
    addLuaSprite('joeyintro',true)
    setProperty('joeyintro.alpha',0)
end

function onCreatePost()

    iconpos = getProperty('iconP1.y')
    barpos = getProperty('healthBarBG.y')
    scorepos = getProperty('scoreTxt.y')
    timepos = getProperty('timeTxt.y')
    time2pos = getProperty('timeBarBG.y')
    time3pos = getProperty('timeBar.y')
end

function onTimerCompleted(tag, loops, loopsLeft)

    if tag == 'gone' then
        doTweenAlpha('crystalgone','dad',0,0.3)
    end

end

function onSongStart()



end

function onTweenCompleted(tag) 

    if tag == 'snaping' then
        setProperty('defaultCamZoom',0.7)
    end

end

function onStepHit()

    if curStep == 772 then
        setProperty('deadGose.visible',true)
    end

    if curStep == 1167 then
        doTweenAlpha('itred','redShit',1,15)
    end

    if curStep == 1312 then
        cancelTween('itred')
        doTweenAlpha('itred','redShit',0,1)
    end

    if curStep == 1488 then
        triggerEvent('Play Animation','eventcompose','dad')
        cooleffect(true)
    end

    if curStep == 1582 then
        playSound('snap')
        doTweenZoom('snaping','camGame',0.7,0.5,'cubeout')
    end

    if curStep == 1592 then
        cooleffect(false)
       
    end

    if curStep == 2176 then
        triggerEvent('Change Character', '1', 'crystaldie')
        triggerEvent('Play Animation','eventjoey','dad')
        runTimer('gone',4.9538)
    end

    if curStep == 2189 then
        setProperty('joeyintro.alpha',1)
        playAnim('joeyintro','jump',true)
    end

    if curStep == 2227 then
        removeLuaSprite('joeyintro')
        setProperty('dad.alpha',1)
    end

    if curStep == 2480 then
        joeytime(true)
    end

    if curStep == 3032 then
        joeytime(false)
    end


end

function onUpdate()
    charobject = {'gf', 'boyfriend', 'speakers', 'stickman'}
       
    if cooleffecton then
        for i=1, #charobject do
            setProperty(charobject[i]..'.animation.curAnim.paused',true)
            setProperty('gf.skipDance', true)
        end

        for i= 1, 2 do
            setProperty(charobject[i]..'.skipDance', true)
        end
    else 
        for i=1, #charobject do
            setProperty(charobject[i]..'.animation.curAnim.paused',false)
        end

        for i= 1, 2 do
            setProperty(charobject[i]..'.skipDance', false)
        end

    end
end

function joeytime(on) 

    stageobject = {'lightfront', 'camerafront', 'stagebgdev', 'greenscreen', 'sustrash', 'lights', 'deadGose', 'stickman'}
    joeystage = {'nightSky', 'mid', 'bgPole'}
        
	if on then
        cameraFlash('game','FFFFFF',0.3)
		for i=1, #stageobject do
           setProperty(stageobject[i]..'.alpha',0)
    
        end

        for i=1, #joeystage do
            setProperty(joeystage[i]..'.alpha',1)
     
         end
	else 
        for i=1, #joeystage do
            doTweenAlpha('stagegone'..joeystage[i],joeystage[i],0,0.5)
        end

        for i=1, #stageobject do
            doTweenAlpha('stagecome'..stageobject[i],stageobject[i],1,0.5)
        end
	end
end


function cooleffect(on) 
    if on then
        cooleffecton = true
        stageobject = {'boyfriend', 'gf', 'speakers', 'lightfront', 'camerafront', 'stagebgdev', 'greenscreen', 'sustrash', 'lights', 'deadGose', 'stickman'}
        hudobject = {'timeTxt', 'timeBar', 'iconP1', 'iconP2', 'healthBar', 'scoreTxt', 'timeBarBG'}
        for i=1, #stageobject do
            doTweenColor('dark'..stageobject[i],stageobject[i],'292929',1)
    
        end

        for i = 0,3 do
            noteTweenX('gn3'..i, i, -420, 3, 'quadInOut')
        end

        for i = 4,7 do
            noteTweenX('gn4'..i, i, 1420, 3, 'quadInOut')
        end

        for i=1, #hudobject do
            doTweenColor('dark2'..hudobject[i],hudobject[i],'292929',2)
            doTweenAlpha('hudgone'..hudobject[i],hudobject[i],0.4,2)
        end

        for i = 3,6 do
            if not downscroll then
                doTweenY('godown'..hudobject[i],hudobject[i],1200,3)
            else 
                doTweenY('godown'..hudobject[i],hudobject[i],-1200,3)
            end
            
        end

        if not downscroll then
            doTweenY('godown1'..hudobject[1],hudobject[1],-400,3)
            doTweenY('godown2'..hudobject[2],hudobject[2],-400,3)
            doTweenY('godown3'..hudobject[7],hudobject[7],-400,3)
        else 
            doTweenY('godown1'..hudobject[1],hudobject[1],900,3)
            doTweenY('godown2'..hudobject[2],hudobject[2],900,3)
            doTweenY('godown3'..hudobject[7],hudobject[7],900,3)
        end



        

       

    else 
        cooleffecton = false
        stageobject = {'boyfriend', 'gf', 'speakers', 'lightfront', 'camerafront', 'stagebgdev', 'greenscreen', 'sustrash', 'lights', 'deadGose', 'stickman'}
        hudobject = {'timeTxt', 'timeBar', 'iconP1', 'iconP2', 'healthBar', 'scoreTxt', 'timeBarBG'}
        for i=1, #stageobject do
            doTweenColor('dark'..stageobject[i],stageobject[i],'ffffff',1)
    
        end

        
            noteTweenX('gn1', 3, defaultOpponentStrumX3, 1, 'quadInOut')
            noteTweenX('gn2', 2, defaultOpponentStrumX2, 1.3, 'quadInOut')
            noteTweenX('gn3', 1, defaultOpponentStrumX1, 1.5, 'quadInOut')
            noteTweenX('gn4', 0, defaultOpponentStrumX0, 1.7, 'quadInOut')

        
            noteTweenX('gn5', 4, defaultPlayerStrumX0, 1, 'quadInOut')
            noteTweenX('gn6', 5, defaultPlayerStrumX1, 1.3, 'quadInOut')
            noteTweenX('gn7', 6, defaultPlayerStrumX2, 1.5, 'quadInOut')
            noteTweenX('gn8', 7, defaultPlayerStrumX3, 1.7, 'quadInOut')
        

        for i=1, #hudobject do
            doTweenColor('dark2'..hudobject[i],hudobject[i],'ffffff',1)
            doTweenAlpha('hudgone'..hudobject[i],hudobject[i],1,1)
        end

        
        
        for i = 3,4 do
            doTweenY('goup'..hudobject[i],hudobject[i],iconpos,1, 'quadInOut')
        end
        
        doTweenY('goup2'..hudobject[5],hudobject[5],barpos,1, 'quadInOut')
        doTweenY('goup3'..hudobject[6],hudobject[6],scorepos,1, 'quadInOut')

        doTweenY('2godown1'..hudobject[1],hudobject[1],timepos,1, 'quadInOut')
        doTweenY('2godown2'..hudobject[2],hudobject[2],time2pos,1, 'quadInOut')
        doTweenY('2godown3'..hudobject[7],hudobject[7],time3pos,1, 'quadInOut')

    end


end