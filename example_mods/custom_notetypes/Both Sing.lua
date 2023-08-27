local penis
function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Both BF Sing' then
			--setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				--setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
	--debugPrint('Script started!')
end

function onEvent(name, value1,value2)

	cancelTimer('bfhold')
	if name == "bf2sing" then

		if value1 == 0 then
			objectPlayAnimation('secondbf','singLEFT',true)
		end
		if value1 == 1 then
			objectPlayAnimation('secondbf','singDOWN',true)
		end
		if value1 == 2 then
			objectPlayAnimation('secondbf','singUP',true)
		end
		if value1 == 3 then
			objectPlayAnimation('secondbf','singRIGHT',true)
		end
		runTimer('bfhold', 0.6, 1)
	end
end
function  onTimerCompleted(t,l,ll)
	if t == 'bfhold' then
			objectPlayAnimation('secondbf','idle',true)
			setProperty('secondbf.offset.x',3)
             setProperty('secondbf.offset.y',0)
	end
end
function goodNoteHit(id, noteData, noteType, isSustainNote)

	if noteType == 'Both BF Sing' then
		if noteData == 0 then
			objectPlayAnimation('secondbf','singLEFT',true)
                setProperty('secondbf.offset.x',5)
                setProperty('secondbf.offset.y',-6)
                --triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
		end
		if noteData == 1 then
				objectPlayAnimation('secondbf','singDOWN',true)
                setProperty('secondbf.offset.x',-20)
                setProperty('secondbf.offset.y',-51)
               -- triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
		end
		if noteData == 2 then
			objectPlayAnimation('secondbf','singUP',true)
                setProperty('secondbf.offset.x',-46)
                setProperty('secondbf.offset.y',27)
               -- triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
		end
		if noteData == 3 then
				objectPlayAnimation('secondbf','singRIGHT',true)
                setProperty('secondbf.offset.x',-48)
                setProperty('secondbf.offset.y',-7)
                --triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
		end
	end
end

function noteMiss(id, noteData, noteType, isSustainNote)


	if noteType == 'Second BF Sing' then
		if noteData == 0 then
			objectPlayAnimation('secondbf','singLEFTmiss',true)
                setProperty('secondbf.offset.x',5)
                setProperty('secondbf.offset.y',-6)
                --triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
		end
		if noteData == 1 then
				objectPlayAnimation('secondbf','singDOWNmiss',true)
                setProperty('secondbf.offset.x',-20)
                setProperty('secondbf.offset.y',-51)
               -- triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
		end
		if noteData == 2 then
			objectPlayAnimation('secondbf','singUPmiss',true)
                setProperty('secondbf.offset.x',-46)
                setProperty('secondbf.offset.y',27)
               -- triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
		end
		if noteData == 3 then
				objectPlayAnimation('secondbf','singRIGHTmiss',true)
                setProperty('secondbf.offset.x',-48)
                setProperty('secondbf.offset.y',-7)
                --triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
		end
	end
end