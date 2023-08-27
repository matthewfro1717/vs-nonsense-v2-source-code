local penis
local nd = 0;
local dadtimer = 0
local sing = false
local nosing = true
local spinning = true
function onCreate()
	--Iterate over all notes
	luaDebugMode = true
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Second Dad Sing' then
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true); --No Anim

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored

				--setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets')
			end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false

function onEvent(name, value1,value2)

	cancelTimer('dadhold')
	if name == "dad2sing" then
		sing = true
		if value1 == 0 then
			playAnim('nonsense','singLEFT',true)
		end
		if value1 == 1 then
			playAnim('nonsense','singDOWN',true)
		end
		if value1 == 2 then
			playAnim('nonsense','singUP',true)
		end
		if value1 == 3 then
			playAnim('nonsense','singRIGHT',true)
		end
		runTimer('dadhold', 0.9, 1)
	end
end

function  onTimerCompleted(t,l,ll)
	if t == 'dadhold' then
			 playAnim('nonsense','idle',true)
			 setProperty('nonsense.offset.x',0)
			 setProperty('nonsense.offset.y',0)
			 sing = false
			 spinning = false
			 cancelTween('funn2y')
			 if not spinning then
				doTweenAngle('funn2y','iconP2',0,0.5, 'quadInOut')
			 end

	end

	if t == 'og' then
		 nosing = true
		 spinning = false
		 if not spinning then
			doTweenAngle('funn2y','iconP2',0,0.5, 'quadInOut')
		end
	end

	if t == 'lolspin' then
		
		if not spinning then
			doTweenAngle('funn2y','iconP2',360,0.5, 'quadInOut')
		end
		spinning = true
	end
end

function onBeatHit()
    if curBeat %2 == 0 then 
        if not sing then
            playAnim('nonsense','idle',true)
        end
    end

	if curBeat == 274 then
        playAnim('nonsense','idle',true)
        setProperty('nonsense.offset.x',0)
        setProperty('nonsense.offset.y',0)
        sing = false
    end
end



function onUpdatePost()
	if sing then
		setProperty('iconP2.animation.curAnim.curFrame', 1)
	elseif nosing then
		setProperty('iconP2.animation.curAnim.curFrame', 0)
	else
		setProperty('iconP2.animation.curAnim.curFrame', 2)
		
	end


end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
	cancelTimer('dadhold')
	cancelTimer('og')
	if noteType == 'Second Dad Sing' then
		setProperty('iconP2.animation.curAnim.curFrame',1)
		sing = true

		if noteData == 0 then
				playAnim('nonsense','singLEFT',true)
                setProperty('nonsense.offset.x',15)
                setProperty('nonsense.offset.y',-20)
               
		end
		if noteData == 1 then
			playAnim('nonsense','singDOWN',true)
                setProperty('nonsense.offset.x',18)
                setProperty('nonsense.offset.y',-53)
               -- triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
		end
		if noteData == 2 then
			playAnim('nonsense','singUP',true)
                setProperty('nonsense.offset.x',0)
                setProperty('nonsense.offset.y',21)
               -- triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
		end
		if noteData == 3 then
			playAnim('nonsense','singRIGHT',true)
                setProperty('nonsense.offset.x',1)
                setProperty('nonsense.offset.y',-12)
                --triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
		end
		runTimer('dadhold', 0.9, 1)
	end

	if notetype ~= 'Second Dad Sing' then
		runTimer('og',0.9,1)
		runTimer('lolspin',0.0001)
		nosing = false
	end

	if not spinning then
		doTweenAngle('funn2y','iconP2',360,0.5, 'quadInOut')
	end

	
	
end
