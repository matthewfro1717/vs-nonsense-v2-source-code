function onSongStart()
    luaDebugMode = true;
    addHaxeLibrary('flixel.FlxG')
    addHaxeLibrary('flixel.system.FlxSound')
	runHaxeCode([[
        game.songLength = (78 * 1000);
    ]])

    
end

function onStepHit()

	if curStep == 744 then 
		addHaxeLibrary('flixel.FlxG')
        addHaxeLibrary('flixel.system.FlxSound')

        runHaxeCode([[
            game.updateTime = true;
            FlxTween.tween(game, {songLength: FlxG.sound.music.length}, 2, {ease: FlxEase.cubeIn});
            
        ]])

	end

    if curStep == 991 then 

        runHaxeCode([[
            FlxTween.tween(game, {songLength: (1000 * 1000)}, 1, {ease: FlxEase.cubeIn})
        ]])

	end

    if curStep == 1001 then 

        runHaxeCode([[
            FlxTween.tween(game, {songLength: FlxG.sound.music.length}, 1.5, {ease: FlxEase.cubeIn})
        ]])

	end

end